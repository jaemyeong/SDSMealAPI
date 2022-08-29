import Foundation
import SwiftSoup
import os

public struct Category {
    
    public var id: String
    
    public var menus: [Menu]
    
    public init(id: String, menus: [Menu]) {
        self.id = id
        self.menus = menus
    }
}

extension Category {
    
    public init(element: Element) throws {
        self.id = element.id()
        self.menus = try element.select(".menu").map(Menu.init(element:))
    }
}

extension Category: Equatable {}

extension Category: Hashable {}

extension Category: Codable {}
