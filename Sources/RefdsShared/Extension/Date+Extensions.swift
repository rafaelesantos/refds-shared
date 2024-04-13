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
    
    static var random: Date {
        guard let day = current.asString(withDateFormat: .day).asInt,
              let month = current.asString(withDateFormat: .custom("MM")).asInt,
              let year = current.asString(withDateFormat: .year).asInt else { return current }
        guard let pastDate = "\(day)/\(month - 2)/\(year)".asDate(withFormat: .dayMonthYear)?.timestamp else { return current }
        let currentDate = current.timestamp
        let randomDate: TimeInterval = .random(in: pastDate ... currentDate)
        return randomDate.date
    }
}
