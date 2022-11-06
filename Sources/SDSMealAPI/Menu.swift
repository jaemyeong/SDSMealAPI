import Foundation
import SwiftSoup
import ErrorKit

public struct Menu {
    
    public var name: String
    
    public var dishes: [Dish]
    
    public var kilocalories: Measurement<UnitEnergy>
    
    public var imageURL: URL
    
    public init(name: String, dishes: [Dish], kilocalories: Measurement<UnitEnergy>, imageURL: URL) {
        self.name = name
        self.dishes = dishes
        self.kilocalories = kilocalories
        self.imageURL = imageURL
    }
}

extension Menu {
    
    public init(element: Element) throws {
        guard let imageURLComponents = try (element.nextElementSibling()?.select("img").first()?.attr("src")).flatMap(URLComponents.init(string:)) else {
            throw NilError()
        }
        
        guard let baseURL = URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt") else {
            throw InstantiateError()
        }
        
        let hasHost = imageURLComponents.host != nil
        
        guard let imageURL = hasHost ? imageURLComponents.url : imageURLComponents.url(relativeTo: baseURL) else {
            throw NilError()
        }
        
        self.name = try element.select(".menu-title").first()?.ownText() ?? ""
        self.dishes = try element.select(".menu-detail span").not(".menu-calorie").first()?.ownText().split(separator: ",").map { $0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines )}.map(Dish.init(name:)) ?? []
        self.kilocalories = try Measurement(value: (element.select(".menu-detail .menu-calorie").first()?.ownText().trimmingCharacters(in: CharacterSet.decimalDigits.inverted)).flatMap(Double.init) ?? 0.0, unit: UnitEnergy.kilocalories)
        self.imageURL = imageURL
    }
}

extension Menu: Equatable {}

extension Menu: Hashable {}

extension Menu: Codable {}
