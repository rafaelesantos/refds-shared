import Foundation

public extension TimeInterval {
    var date: Date { Date(timeIntervalSince1970: self) }
    
    func asString(withDateFormat dateFormat: String.DateFormat = .dayMonthYear) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = dateFormat.value
        return dateFormatter.string(from: self.date)
    }
}
