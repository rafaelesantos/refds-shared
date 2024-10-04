import Foundation

public extension Int {
    var letter: String { String(format: "%c", self) }
    
    var seconds: Int { self }
    
    var minutes: Int { seconds * 60 }
    
    var hours: Int { minutes * 60 }
    
    var days: Int { hours * 24 }
    
    var weeks: Int { days * 7 }
    
    var months: Int { weeks * 4 }
    
    var years: Int { months * 12 }
}
