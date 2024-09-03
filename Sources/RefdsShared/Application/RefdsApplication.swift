import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

public final class RefdsApplication {
    public static let shared = RefdsApplication()
    
    public var id: String? {
        Bundle.main.bundleIdentifier
    }
    
    public var version: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public var rootViewController: RefdsViewController? {
        #if os(macOS)
        let window = NSApplication.shared.windows.first
        return window?.contentViewController?.refdsViewController
        #else
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let window = windowScene?.windows.first
        return window?.rootViewController?.refdsViewController
        #endif
    }
}
