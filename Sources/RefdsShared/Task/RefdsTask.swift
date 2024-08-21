import Foundation

public final class RefdsTask {
    private let group = DispatchGroup()
    private let queue: DispatchQueue
    
    static let shared = RefdsTask()
    
    public init(
        label: String = .someWord(),
        qos: DispatchQoS = .unspecified,
        attributes: DispatchQueue.Attributes = .concurrent
    ) {
        queue = DispatchQueue(
            label: .refdsLocalizable(by: .refdsTask, with: label),
            qos: qos,
            attributes: attributes
        )
    }
    
    public typealias ExecuteItem = () -> Void
    public func execute(items: [ExecuteItem]) {
        items.forEach { item in
            group.enter()
            queue.async {
                item()
                self.group.leave()
            }
        }
        group.wait()
    }
}
