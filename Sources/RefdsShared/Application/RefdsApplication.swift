import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

public actor RefdsApplication {
    public init() {}
    
    public var id: String? {
        Bundle.main.bundleIdentifier
    }
    
    public var version: String? {
        Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    }
    
    public var rootViewController: RefdsViewController? {
        get async {
            #if os(macOS)
            let window = await NSApplication.shared.windows.first
            return await window?.contentViewController?.refdsViewController
            #else
            let windowScene = await UIApplication.shared.connectedScenes.first as? UIWindowScene
            let window = await windowScene?.windows.first
            return await window?.rootViewController?.refdsViewController
            #endif
        }
    }
}
