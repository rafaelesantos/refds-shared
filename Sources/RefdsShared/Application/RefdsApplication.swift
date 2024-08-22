import Foundation
#if os(macOS)
#else
import UIKit
#endif

public final class RefdsApplication {
#if os(macOS)
#else
    public var rootViewController: UIViewController? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first,
           let rootViewController = window.rootViewController {
            return rootViewController
        }
        return nil
    }
#endif
}
