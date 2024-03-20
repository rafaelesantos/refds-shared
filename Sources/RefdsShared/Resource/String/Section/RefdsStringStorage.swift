import Foundation

public enum RefdsStringStorage: String, RefdsStringProtocol, CaseIterable {
    case auth = "refds.storage.allow.auth"
    case customAppIcon = "refds.storage.customAppIcon"
    case onboarding = "refds.storage.onboarding"
    
    public var key: String { "" }
}

