import Foundation
import CryptoKit

public extension String {
    static func someWord(from theme: RefdsRandomText = .spaceExploration) -> String {
        theme.word
    }
    
    static func someParagraph(from theme: RefdsRandomText = .spaceExploration) -> String {
        theme.paragraph
    }
    
    func asDate(withFormat dateFomat: String.DateFormat = .dayMonthYear) -> Date? {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale.current
        dateFormatter.dateFormat = dateFomat.value
        return dateFormatter.date(from: self)
    }
    
    var asDouble: Double? {
        guard let double = Double(self) else {
            let string = self.replacingOccurrences(of: ".", with: "").replacingOccurrences(of: ",", with: ".")
            return Double(string)
        }
        return double
    }
    
    var asInt: Int? { Int(self) }
    
    var asMD5: String {
        let digest = Insecure.MD5.hash(data: Data(self.utf8))
        return digest.map { String(format: "%02hhx", $0) }.joined()
    }
    
    var capitalizedSentence: String {
        let firstLetter = self.prefix(1).capitalized
        let remainingLetters = self.dropFirst().lowercased()
        return firstLetter + remainingLetters
    }
    
    func enter() -> String {
        self + "\n"
    }
    
    enum DateFormat {
        case day
        case month
        case year
        case dayMonthYear
        case monthYear
        case fullMonthYear
        case weekMonthYear
        case custom(String)
        
        public var value: String {
            switch self {
            case .day: return "dd"
            case .month: return "MMMM"
            case .year: return "yyyy"
            case .dayMonthYear: return "dd/MM/yyyy"
            case .monthYear: return "MM/yyyy"
            case .fullMonthYear: return "MMMM/yyyy"
            case .weekMonthYear: return "EEEE/MM/yyyy"
            case .custom(let dateFormat): return dateFormat
            }
        }
    }
}
