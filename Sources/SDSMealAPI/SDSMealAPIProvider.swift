import Foundation
import Combine
import SwiftSoup
import ErrorKit

public final class SDSMealAPIProvider {
    
    private let session: URLSession
    
    private let zoneID: String
    
    private let baseURL: URL?
    
    public init(session: URLSession = .shared, zoneID: String = "W2", baseURL: URL? = URL(string: "http://sdsfoodmenu.co.kr:9106")) {
        self.session = session
        self.zoneID = zoneID
        self.baseURL = baseURL
    }
    
    public func fetch(meal: Meal = .current, stubValue: (Data, URLResponse)? = nil) async throws -> (Meal, [Category], HTTPURLResponse) {
        guard let baseURL = self.baseURL else {
            throw NilError()
        }
        
        var queryItems: [URLQueryItem] = [
            URLQueryItem(name: "zoneId", value: self.zoneID),
        ]
        
        if meal != .current {
            queryItems.append(URLQueryItem(name: "menuTime", value: meal.rawValue))
        }
        
        var components = URLComponents()
        components.queryItems = queryItems
        components.path = "/foodcourt/menuplanner/list"
        
        guard let url = components.url(relativeTo: baseURL) else {
            throw NilError()
        }
        
        let value: (data: Data, response: URLResponse)
        
        if let stubValue = stubValue {
            value = stubValue
        } else if #available(iOS 15.0, macOS 12.0, *) {
            value = try await self.session.data(from: url)
        } else {
            var subscriptions: Set<AnyCancellable> = []
            
            value = try await withCheckedThrowingContinuation { (continuation: CheckedContinuation<(Data, URLResponse), Error>) in
                self.session.dataTaskPublisher(for: url)
                    .sink { completion in
                        guard case .failure(let error) = completion else {
                            return
                        }
                        continuation.resume(throwing: error)
                    } receiveValue: { value in
                        continuation.resume(returning: value)
                    }
                    .store(in: &subscriptions)
            }
            
            if Task.isCancelled {
                subscriptions = []
            }
        }
        
        let (data, response) = value
        
        guard let response = response as? HTTPURLResponse else {
            throw TypeCastingError()
        }
        
        guard let body = String(data: data, encoding: .utf8) else {
            throw InstantiateError()
        }
        
        let meal = try self.parseMeal(body)
        
        let document = try SwiftSoup.parse(body)
        
        if let close = try document.select(".corner-no-operation").first().map(Close.init(element:)) {
            throw close
        }
        
        let categories = try document.select(".mo-contents .corner").map(Category.init(element:))
        
        return (meal, categories, response)
    }
}

extension SDSMealAPIProvider {
    
    private func parseMeal(_ body: String) throws -> Meal {
        let scanner = Scanner(string: body)
        
        while !scanner.isAtEnd {
            guard scanner.scanString("currentTime = '") != nil else {
                scanner.currentIndex = scanner.string.index(after: scanner.currentIndex)
                continue
            }
            guard let rawValue = scanner.scanUpToString("'") else {
                throw NotFoundError()
            }
            guard let value = Meal(rawValue: rawValue) else {
                throw NilError()
            }
            return value
        }
        
        throw NotFoundError()
    }
}
