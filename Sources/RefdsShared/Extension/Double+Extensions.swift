import Foundation

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
    
    var formatted: String { String(format: "%.2f", self) }
}
