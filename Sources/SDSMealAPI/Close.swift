import Foundation
import SwiftSoup

public struct Close {
    
    public var message: String
    
    public var localizedMessage: String
    
    public var openingHoursInformation: String
    
    public var openingHours: [String]
    
    public init(
        message: String,
        localizedMessage: String,
        openingHoursInformation: String,
        openingHours: [String]
    ) {
        self.message = message
        self.localizedMessage = localizedMessage
        self.openingHoursInformation = openingHoursInformation
        self.openingHours = openingHours
    }
}

extension Close {
    
    public init(element: Element) throws {
        self.message = try element.select(".info-title-eng").text(trimAndNormaliseWhitespace: true)
        self.localizedMessage = try element.select(".info-title").text(trimAndNormaliseWhitespace: true)
        self.openingHoursInformation = try element.select(".info-cont").text(trimAndNormaliseWhitespace: true)
        self.openingHours = try element.select(".info-cont-time").map { try $0.text(trimAndNormaliseWhitespace: true) }
    }
}

extension Close: Equatable {}

extension Close: Hashable {}

extension Close: Codable {}

extension Close: Error {}
