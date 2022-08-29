import XCTest
import os

@testable import SDSMealAPI

public final class SDSMealAPITests: XCTestCase {
    
    private var provider: SDSMealAPIProvider?
    
    public override func setUp() {
        super.setUp()
        
        self.provider = SDSMealAPIProvider()
    }
    
    public override func tearDown() {
        super.tearDown()
        
        self.provider = nil
    }
    
    public func testBreakfast() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "Breakfast", withExtension: "html"))
        
        let stubData = try Data(contentsOf: stubDataURL)
        
        let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=breakfast"))
        
        let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))

        let (data, response) = try await provider.fetch(meal: .breakfast, stubValue: (stubData, stubResponse))

        XCTAssertEqual(response.statusCode, 200)
        
        XCTAssertFalse(data.isEmpty)
    }
    
    public func testBreakfastClosed() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "BreakfastClosed", withExtension: "html"))
        
        let stubData = try Data(contentsOf: stubDataURL)
        
        let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=breakfast"))
        
        let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))

        do {
            let _ = try await provider.fetch(meal: .breakfast, stubValue: (stubData, stubResponse))
        } catch {
            XCTAssertTrue(error is Close)
        }
    }
    
    public func testLunch() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "Lunch", withExtension: "html"))
        
        let stubData = try Data(contentsOf: stubDataURL)
        
        let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=lunch"))
        
        let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))

        let (data, response) = try await provider.fetch(meal: .breakfast, stubValue: (stubData, stubResponse))

        XCTAssertEqual(response.statusCode, 200)
        
        XCTAssertFalse(data.isEmpty)
    }
    
    public func testLunchClosed() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "LunchClosed", withExtension: "html"))
        
        let stubData = try Data(contentsOf: stubDataURL)
        
        let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=lunch"))
        
        let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))

        do {
            let _ = try await provider.fetch(meal: .breakfast, stubValue: (stubData, stubResponse))
        } catch {
            XCTAssertTrue(error is Close)
        }
    }
    
    public func testDinner() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "Dinner", withExtension: "html"))
        
        let stubData = try Data(contentsOf: stubDataURL)
        
        let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=dinner"))
        
        let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))

        let (data, response) = try await provider.fetch(meal: .breakfast, stubValue: (stubData, stubResponse))

        XCTAssertEqual(response.statusCode, 200)
        
        XCTAssertFalse(data.isEmpty)
    }
    
    public func testDinnerClosed() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "DinnerClosed", withExtension: "html"))
        
        let stubData = try Data(contentsOf: stubDataURL)
        
        let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=dinner"))
        
        let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))

        do {
            let _ = try await provider.fetch(meal: .breakfast, stubValue: (stubData, stubResponse))
        } catch {
            XCTAssertTrue(error is Close)
        }
    }
}
