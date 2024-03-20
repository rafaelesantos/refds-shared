import Foundation

public enum RefdsStringLockScreen: RefdsStringProtocol, CaseIterable {
    case title
    case description
    case buttonTitle
    case requestAuthReason
    case alertAuthError
    
    public var key: String {
        switch self {
        case .title: return "lockScreen.title"
        case .description: return "lockScreen.description"
        case .buttonTitle: return "lockScreen.buttonTitle"
        case .requestAuthReason: return "lockScreen.requestAuthReason"
        case .alertAuthError: return "lockScreen.alertAuthError"
        }
    }
    
    public var rawValue: String {
        NSLocalizedString(key, tableName: "Localizable", bundle: .module, comment: "")
    }
}
