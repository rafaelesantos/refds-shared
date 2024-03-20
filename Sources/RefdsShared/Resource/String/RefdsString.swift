import Foundation

public protocol RefdsStringProtocol {
    var key: String { get }
    var rawValue: String { get }
}

public enum RefdsString: RefdsStringProtocol {
    case lockScreen(RefdsStringLockScreen)
    case storage(RefdsStringStorage)
    
    public var key: String { "" }
    public var rawValue: String {
        switch self {
        case .lockScreen(let lockScreen): return lockScreen.rawValue
        case .storage(let storage): return storage.rawValue
        }
    }
}

public extension String {
    static func refdsString(_ string: RefdsString) -> Self { string.rawValue }
}
