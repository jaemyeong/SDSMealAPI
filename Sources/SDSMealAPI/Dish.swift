import Foundation

public struct Dish {
    
    public var name: String
    
    public init(name: String) {
        self.name = name
    }
}

extension Dish: Equatable {}

extension Dish: Hashable {}

extension Dish: Codable {}
