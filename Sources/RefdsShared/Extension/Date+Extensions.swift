import Foundation

public extension Date {
    static var current: Date { return Date() }
    
    var timestamp: TimeInterval { self.timeIntervalSince1970 }
    
    func asString(withDateFormat dateFormat: String.DateFormat = .dayMonthYear) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = dateFormat.value
        return dateFormatter.string(from: self)
    }
}
