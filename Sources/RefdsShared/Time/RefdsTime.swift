import Foundation

public enum RefdsTime: Identifiable, Equatable {
    case seconds(Int)
    case minutes(Int)
    case hours(Int)
    case days(Int)
    case weeks(Int)
    case months(Int)
    case years(Int)
    
    public var rawValue: Int {
        switch self {
        case let .seconds(value): return value.seconds
        case let .minutes(value): return value.minutes
        case let .hours(value): return value.hours
        case let .days(value): return value.days
        case let .weeks(value): return value.weeks
        case let .months(value): return value.months
        case let .years(value): return value.years
        }
    }
    
    public var id: Int { rawValue }
    
    static func - (lhs: RefdsTime, rhs: RefdsTime) -> Bool {
        lhs.rawValue - rhs.rawValue > 0
    }
}
