import Foundation
import ErrorKit

/// 식사 타입.
public enum Meal: String {
    
    /// 현재 시간에 맞는 식사 타입.
    public static var current: Self {
        let now = Date()
        
        if DateInterval(start: Self.breakfast.openingHours.end, end: Self.lunch.openingHours.end).contains(now) {
            return .lunch
        } else if DateInterval(start: Self.lunch.openingHours.end, end: Self.dinner.openingHours.end).contains(now) {
            return .dinner
        } else {
            return .breakfast
        }
    }
    
    /// 아침 식사.
    case breakfast
    
    /// 점심 식사.
    case lunch
    
    /// 저녁 식사.
    case dinner
    
    /// 영업 시간.
    public var openingHours: DateInterval {
        let today = Self.calendar.startOfDay(for: Date())
        
        switch self {
        case .breakfast:
            guard let start = Self.calendar.date(bySettingHour: 7, minute: 0, second: 0, of: today) else {
                fatalError(String(describing: InstantiateError()))
            }
            
            guard let end = Self.calendar.date(bySettingHour: 9, minute: 20, second: 0, of: today) else {
                fatalError(String(describing: InstantiateError()))
            }
            
            return DateInterval(start: start, end: end)
        case .lunch:
            guard let start = Self.calendar.date(bySettingHour: 11, minute: 30, second: 0, of: today) else {
                fatalError(String(describing: InstantiateError()))
            }
            
            guard let end = Self.calendar.date(bySettingHour: 13, minute: 0, second: 0, of: today) else {
                fatalError(String(describing: InstantiateError()))
            }
            
            return DateInterval(start: start, end: end)
        case .dinner:
            guard let start = Self.calendar.date(bySettingHour: 17, minute: 30, second: 0, of: today) else {
                fatalError(String(describing: InstantiateError()))
            }
            
            guard let end = Self.calendar.date(bySettingHour: 19, minute: 0, second: 0, of: today) else {
                fatalError(String(describing: InstantiateError()))
            }
            
            return DateInterval(start: start, end: end)
        }
    }
    
    /// 형식화 된 문자열 표현.
    public var formattedOpeningHoursString: String {
        guard let formattedString = Self.formatter.string(from: self.openingHours) else {
            fatalError(String(describing: NilError()))
        }
        return formattedString
    }
}

extension Meal {
    
    private static let locale: Locale = Locale(identifier: "ko_KR")
    
    private static let timeZone: TimeZone = {
        guard let timeZone = TimeZone(identifier: "Asia/Seoul") else {
            fatalError(String(describing: InstantiateError()))
        }
        
        return timeZone
    }()
    
    private static let calendar: Calendar = {
        var calendar = Calendar(identifier: .iso8601)
        calendar.locale = Self.locale
        calendar.timeZone = Self.timeZone
        
        return calendar
    }()
    
    private static let formatter: DateIntervalFormatter = {
        let formatter = DateIntervalFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.timeZone = TimeZone(identifier: "Asia/Seoul")
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateStyle = .none
        formatter.timeStyle = .short
        
        return formatter
    }()
}

extension Meal: Equatable {}

extension Meal: Hashable {}

extension Meal: Codable {}
