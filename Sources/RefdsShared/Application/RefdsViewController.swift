import Foundation
#if os(macOS)
import AppKit
#else
import UIKit
#endif

public protocol RefdsViewControllerProtocol {
    func present(_ viewController: RefdsViewController?)
}

#if os(macOS)
public class RefdsViewController: NSViewController, RefdsViewControllerProtocol {
    public func present(_ viewController: RefdsViewController?) {
        guard let viewController = viewController else { return }
        self.presentAsModalWindow(viewController)
    }
}

public extension NSViewController {
    var refdsViewController: RefdsViewController? {
        self as? RefdsViewController
    }
}
#else
public class RefdsViewController: UIViewController, RefdsViewControllerProtocol {
    public func present(_ viewController: RefdsViewController?) {
        guard let viewController = viewController else { return }
        self.present(viewController, animated: true)
    }
}

public extension UIViewController {
    var refdsViewController: RefdsViewController? {
        self as? RefdsViewController
    }
}
#endif
