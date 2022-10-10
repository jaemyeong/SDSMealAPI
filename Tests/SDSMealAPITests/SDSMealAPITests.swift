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
        
        let result: ([SDSMealAPI.Category], HTTPURLResponse)
        
        if self.isStubbing {
            let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "Breakfast", withExtension: "html"))
            
            let stubData = try Data(contentsOf: stubDataURL)
            
            let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=breakfast"))
            
            let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))

            result = try await provider.fetch(meal: .breakfast, stubValue: (stubData, stubResponse))
        } else {
            result = try await provider.fetch(meal: .breakfast)
        }
        
        let (data, response) = result

        XCTAssertEqual(response.statusCode, 200)
        
        XCTAssertFalse(data.isEmpty)
        
        os_log(.info, "%@", String(describing: result))
    }
    
    public func testBreakfastClosed() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        do {
            if self.isStubbing {
                let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "BreakfastClosed", withExtension: "html"))
                
                let stubData = try Data(contentsOf: stubDataURL)
                
                let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=breakfast"))
                
                let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))
                
                let _ = try await provider.fetch(meal: .breakfast, stubValue: (stubData, stubResponse))
            } else {
                let _ = try await provider.fetch(meal: .breakfast)
            }
        } catch {
            XCTAssertTrue(error is Close)
            
            os_log(.info, "%@", String(describing: error))
        }
    }
    
    public func testLunch() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let result: ([SDSMealAPI.Category], HTTPURLResponse)
        
        if self.isStubbing {
            let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "Lunch", withExtension: "html"))
            
            let stubData = try Data(contentsOf: stubDataURL)
            
            let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=lunch"))
            
            let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))

            result = try await provider.fetch(meal: .lunch, stubValue: (stubData, stubResponse))
        } else {
            result = try await provider.fetch(meal: .lunch)
        }
        
        let (data, response) = result

        XCTAssertEqual(response.statusCode, 200)
        
        XCTAssertFalse(data.isEmpty)
        
        os_log(.info, "%@", String(describing: result))
    }
    
    public func testLunchClosed() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        do {
            if self.isStubbing {
                let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "LunchClosed", withExtension: "html"))
                
                let stubData = try Data(contentsOf: stubDataURL)
                
                let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=lunch"))
                
                let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))
                
                let _ = try await provider.fetch(meal: .lunch, stubValue: (stubData, stubResponse))
            } else {
                let _ = try await provider.fetch(meal: .lunch)
            }
        } catch {
            XCTAssertTrue(error is Close)
            
            os_log(.info, "%@", String(describing: error))
        }
    }
    
    public func testDinner() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        let result: ([SDSMealAPI.Category], HTTPURLResponse)
        
        if self.isStubbing {
            let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "Dinner", withExtension: "html"))
            
            let stubData = try Data(contentsOf: stubDataURL)
            
            let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=dinner"))
            
            let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))

            result = try await provider.fetch(meal: .dinner, stubValue: (stubData, stubResponse))
        } else {
            result = try await provider.fetch(meal: .dinner)
        }
        
        let (data, response) = result

        XCTAssertEqual(response.statusCode, 200)
        
        XCTAssertFalse(data.isEmpty)
        
        os_log(.info, "%@", String(describing: result))
    }
    
    public func testDinnerClosed() async throws {
        let provider = try XCTUnwrap(self.provider)
        
        do {
            if self.isStubbing {
                let stubDataURL = try XCTUnwrap(Bundle.module.url(forResource: "DinnerClosed", withExtension: "html"))
                
                let stubData = try Data(contentsOf: stubDataURL)
                
                let stubResponseURL = try XCTUnwrap(URL(string: "http://sdsfoodmenu.co.kr:9106/foodcourt/menuplanner/list?zoneId=W2&menuTime=dinner"))
                
                let stubResponse = try XCTUnwrap(HTTPURLResponse(url: stubResponseURL, statusCode: 200, httpVersion: "HTTP/1.1", headerFields: [:]))
                
                let _ = try await provider.fetch(meal: .dinner, stubValue: (stubData, stubResponse))
            } else {
                let _ = try await provider.fetch(meal: .dinner)
            }
        } catch {
            XCTAssertTrue(error is Close)
            
            os_log(.info, "%@", String(describing: error))
        }
    }
}
