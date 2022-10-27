import Foundation
import ErrorKit

/// 식사.
public enum Meal: String {
    
    /// 현재
    case current
    
    /// 아침.
    case breakfast
    
    /// 점심.
    case lunch
    
    /// 저녁.
    case dinner
    
    /// 야식.
    case night
}

extension Meal: Equatable {}

extension Meal: Hashable {}

extension Meal: Codable {}
