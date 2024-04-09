import Foundation
import SwiftUI

public protocol RefdsAlert: Equatable {
    var id: UUID { get }
    var icon: (() -> any View)? { get }
    var title: String? { get }
    var message: String? { get }
}

public extension RefdsAlert {
    var id: UUID { .init() }
    var icon: (() -> any View)? { nil }
}
