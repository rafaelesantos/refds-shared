import Foundation

public extension String {
    static func refdsLocalizable(by key: RefdsLocalizableKey) -> Self {
        NSLocalizedString(key.rawValue, tableName: "Localizable", bundle: .module, comment: "")
    }
    
    static func refdsLocalizable(by key: RefdsLocalizableKey, with params: CVarArg...) -> Self {
        String(
            format: NSLocalizedString(key.rawValue, tableName: "Localizable", bundle: .module, comment: ""),
            arguments: params
        )
    }
}
