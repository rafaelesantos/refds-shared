import SwiftUI

public enum RefdsAsset: String, CaseIterable, Identifiable {
    case applicationIcon = "ApplicationIcon"
    
    public var image: Image {
        Image(rawValue, bundle: .module)
    }
    
    public var id: String {
        rawValue
    }
}
