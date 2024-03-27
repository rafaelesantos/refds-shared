import SwiftUI
import Network

private struct RefdsNetworkMonitorEnvironmentKey: EnvironmentKey {
    static var defaultValue = RefdsNetworkMonitor.shared
}

public extension EnvironmentValues {
    var refdsNetworkMonitor: RefdsNetworkMonitor {
        get { self[RefdsNetworkMonitorEnvironmentKey.self] }
    }
}

public class RefdsNetworkMonitor: ObservableObject {
    public static let shared = RefdsNetworkMonitor()
    private let networkMonitor = NWPathMonitor()
    @Published public var isConnected = false
    
    private init() {
        networkMonitor.pathUpdateHandler = { path in
            Task { @MainActor in
                self.isConnected = path.status == .satisfied
            }
        }
        networkMonitor.start(queue: .global())
    }
}
