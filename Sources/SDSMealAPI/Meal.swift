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

extension Meal: CaseIterable {}

extension Meal: CustomStringConvertible {
    
    public var description: String {
        switch self {
        case .current:
            return NSLocalizedString("current", bundle: .module, comment: "")
        case .breakfast:
            return NSLocalizedString("breakfast", bundle: .module, comment: "")
        case .lunch:
            return NSLocalizedString("lunch", bundle: .module, comment: "")
        case .dinner:
            return NSLocalizedString("dinner", bundle: .module, comment: "")
        case .night:
            return NSLocalizedString("night", bundle: .module, comment: "")
        }
    }
}
