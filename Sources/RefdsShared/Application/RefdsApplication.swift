import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

public final class RefdsApplication {
    public static let shared = RefdsApplication()
#if os(macOS)
    public var rootViewController: NSViewController? {
        if let window = NSApplication.shared.windows.first,
           let rootViewController = window.contentViewController {
            return rootViewController
        }
        return nil
    }
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
