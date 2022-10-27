import XCTest
import os

@testable import SDSMealAPI

public final class SDSMealAPITests: XCTestCase {
    
    private var provider: SDSMealAPIProvider?
    
    private var isStubbing: Bool = true
    
    public override func setUp() {
        super.setUp()
        
        self.provider = SDSMealAPIProvider()
        
        self.isStubbing = true
    }
    
    public override func tearDown() {
        super.tearDown()
        
        self.provider = nil
        
        self.isStubbing = true
    }
    
    public func testBreakfast() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let value: (Meal, [SDSMealAPI.Category], HTTPURLResponse)
        
        if self.isStubbing {
            let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "breakfast", withExtension: "html"))
            
            let stubData = try Data(contentsOf: stubDataURL)
            
            let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=breakfast"))
            
            let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))
            
            value = try await provider.fetch(meal: .breakfast, stubValue: (stubData, stubResponse))
        } else {
            value = try await provider.fetch(meal: .breakfast)
        }
        
        let (meal, categories, response) = value
        
        XCTAssertEqual(meal, .breakfast)
        XCTAssertFalse(categories.isEmpty)
        XCTAssertEqual(response.statusCode, 200)
    }
    
    public func testLunch() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let value: (Meal, [SDSMealAPI.Category], HTTPURLResponse)
        
        if self.isStubbing {
            let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "lunch", withExtension: "html"))
            
            let stubData = try Data(contentsOf: stubDataURL)
            
            let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=lunch"))
            
            let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))
            
            value = try await provider.fetch(meal: .lunch, stubValue: (stubData, stubResponse))
        } else {
            value = try await provider.fetch(meal: .lunch)
        }
        
        let (meal, categories, response) = value
        
        XCTAssertEqual(meal, .lunch)
        XCTAssertFalse(categories.isEmpty)
        XCTAssertEqual(response.statusCode, 200)
    }
    
    public func testDinner() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let value: (Meal, [SDSMealAPI.Category], HTTPURLResponse)
        
        if self.isStubbing {
            let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "dinner", withExtension: "html"))
            
            let stubData = try Data(contentsOf: stubDataURL)
            
            let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=dinner"))
            
            let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))
            
            value = try await provider.fetch(meal: .dinner, stubValue: (stubData, stubResponse))
        } else {
            value = try await provider.fetch(meal: .dinner)
        }
        
        let (meal, categories, response) = value
        
        XCTAssertEqual(meal, .dinner)
        XCTAssertFalse(categories.isEmpty)
        XCTAssertEqual(response.statusCode, 200)
    }
    
    public func testNight() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        var value: (Meal, [SDSMealAPI.Category], HTTPURLResponse)?
        
        if self.isStubbing {
            let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "night", withExtension: "html"))
            
            let stubData = try Data(contentsOf: stubDataURL)
            
            let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=night"))
            
            let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))
            
            do {
                value = try await provider.fetch(meal: .night, stubValue: (stubData, stubResponse))
            } catch {
                XCTAssertTrue(error is SDSMealAPI.Close)
            }
        } else {
            do {
                value = try await provider.fetch(meal: .night)
            } catch {
                XCTAssertTrue(error is SDSMealAPI.Close)
            }
        }
        
        XCTAssertNil(value)
    }
    
    public func testCurrent() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let value: (Meal, [SDSMealAPI.Category], HTTPURLResponse)
        
        if self.isStubbing {
            let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "current", withExtension: "html"))
            
            let stubData = try Data(contentsOf: stubDataURL)
            
            let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2"))
            
            let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))
            
            value = try await provider.fetch(stubValue: (stubData, stubResponse))
        } else {
            value = try await provider.fetch()
        }
        
        let (meal, categories, response) = value
        
        XCTAssertEqual(meal, .lunch)
        XCTAssertFalse(categories.isEmpty)
        XCTAssertEqual(response.statusCode, 200)
    }
}
