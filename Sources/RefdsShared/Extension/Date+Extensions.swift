import Foundation

public extension Date {
    var timestamp: TimeInterval { self.timeIntervalSince1970 }
    
    func asString(withDateFormat dateFormat: String.DateFormat = .dayMonthYear) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = dateFormat.value
        return dateFormatter.string(from: self)
    }
    
    static var random: Date {
        guard let day = now.asString(withDateFormat: .day).asInt,
              let month = now.asString(withDateFormat: .custom("MM")).asInt,
              let year = now.asString(withDateFormat: .year).asInt else { return now }
        guard let pastDate = "\(day)/\(month - 2)/\(year)".asDate(withFormat: .dayMonthYear)?.timestamp else { return now }
        let currentDate = now.timestamp
        let randomDate: TimeInterval = .random(in: pastDate ... currentDate)
        return randomDate.date
    }
    
    var days: Int? {
        let calendar = Calendar.current
        guard let interval = calendar.dateInterval(of: .year, for: self),
              let days = calendar.dateComponents([.day], from: interval.start, to: interval.end).day
        else { return 1 }
        return days
    }
}
