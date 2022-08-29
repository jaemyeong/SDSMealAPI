import Foundation
import SwiftSoup

public struct Close {
    
    public var message: String
    
    public var localizedMessage: String
    
    public var operatingHoursInformation: String
    
    public var breakfastOpeningHours: String
    
    public var lunchOpeningHours: String
    
    public var dinnerOpeningHours: String
    
    public init(
        message: String,
        localizedMessage: String,
        operatingHoursInformation: String,
        breakfastOpeningHours: String,
        lunchOpeningHours: String,
        dinnerOpeningHours: String
    ) {
        self.message = message
        self.localizedMessage = localizedMessage
        self.operatingHoursInformation = operatingHoursInformation
        self.breakfastOpeningHours = breakfastOpeningHours
        self.lunchOpeningHours = lunchOpeningHours
        self.dinnerOpeningHours = dinnerOpeningHours
    }
}

extension Close {
    
    public init(element: Element) throws {
        self.message = try element.select(".info-title-eng").text()
        self.localizedMessage = try element.select(".info-title").text()
        self.operatingHoursInformation = try element.select(".info-cont").text()
        self.breakfastOpeningHours = try element.select(".info-cont-time")[0].text()
        self.lunchOpeningHours = try element.select(".info-cont-time")[1].text()
        self.dinnerOpeningHours = try element.select(".info-cont-time")[2].text()
    }
}

extension Close: Equatable {}

extension Close: Hashable {}

extension Close: Codable {}

extension Close: Error {}
