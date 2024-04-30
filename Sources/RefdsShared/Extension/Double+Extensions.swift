import Foundation
import SwiftUI

public extension Double {
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
    
    func currency(code: String? = Locale.current.currency?.identifier) -> String {
        guard let code = code else { return self.formatted }
        return self.formatted(.currency(code: code))
    }
    
    var distance: String {
        let current = self * 1000
        let km = Int(current / 1000)
        let m = Int(current - (Double(km) * 1000))
        return "\(km)km \(m)m"
    }
    
    func reduceScale(to places: Int) -> Double {
        let multiplier = pow(10, Double(places))
        let newDecimal = multiplier * self
        let truncated = Double(Int(newDecimal))
        let originalDecimal = truncated / multiplier
        return originalDecimal
    }
    
    var formatted: String { 
        String(format: "%.2f", self)
    }
    
    func percent(format: String = "%2.f") -> String {
        String(format: format, self * 100) + "%"
    }
    
    var riskColor: Color {
        self < 0.6 ? .green :
        self < 0.9 ? .yellow :
        self < 1 ? .orange : .red
    }
    
    var riskDescription: String {
        self < 0.6 ? .localizable(by: .riskLowDescription) :
        self < 0.9 ? .localizable(by: .riskMediumDescription) :
        self < 1 ? .localizable(by: .riskHighDescription) :
        .localizable(by: .riskWarningDescription)
    }
}
