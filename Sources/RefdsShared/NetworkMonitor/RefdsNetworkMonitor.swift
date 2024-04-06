import SwiftUI
import Network

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
