import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol RefdsViewControllerProtocol {
    func present(controller: RefdsViewController)
}

#if os(macOS)
public class RefdsViewController: NSViewController, RefdsViewControllerProtocol {
    public func present(controller: RefdsViewController) {
        self.presentAsModalWindow(controller)
    }
}

public extension NSViewController {
    var refdsViewController: RefdsViewController? {
        self as? RefdsViewController
    }
}
#else
public class RefdsViewController: UIViewController, RefdsViewControllerProtocol {
    public func present(controller: RefdsViewController) {
        self.present(controller, animated: true)
    }
}

public extension UIViewController {
    var refdsViewController: RefdsViewController? {
        self as? RefdsViewController
    }
}
#endif

