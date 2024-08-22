import Foundation
import SwiftUI

#if os(macOS)
#else
public extension UIApplication {
    var rootViewController: UIViewController? {
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first,
           let rootViewController = window.rootViewController {
            return rootViewController
        }
        return nil
    }
}
#endif
