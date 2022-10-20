import Foundation
import SwiftSoup

public struct Menu {
    
    public var name: String
    
    public var dishes: [Dish]
    
    public var kilocalories: Measurement<UnitEnergy>
    
    public var image: URL?
    
    public init(name: String, dishes: [Dish], kilocalories: Measurement<UnitEnergy>, image: URL?) {
        self.name = name
        self.dishes = dishes
        self.kilocalories = kilocalories
        self.image = image
    }
}

extension Menu {
    
    public init(element: Element) throws {
        self.name = try element.select(".menu-title").first()?.ownText() ?? ""
        self.dishes = try element.select(".menu-detail span").not(".menu-calorie").first()?.ownText().split(separator: ",").map { $0.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines )}.map(Dish.init(name:)) ?? []
        self.kilocalories = try Measurement(value: (element.select(".menu-detail .menu-calorie").first()?.ownText().trimmingCharacters(in: CharacterSet.decimalDigits.inverted)).flatMap(Double.init) ?? 0.0, unit: UnitEnergy.kilocalories)
        self.image = try (element.nextElementSibling()?.select("img").first()?.attr("src")).flatMap(URL.init(string:))
    }
}

extension Menu: Equatable {}

extension Menu: Hashable {}

extension Menu: Codable {}
