import Foundation

public protocol RefdsTaskProtocol {
    typealias ExecuteItem = () -> Void
    typealias ControlExecuteItem = (DispatchGroup) -> Void
    
    var queue: DispatchQueue { get }
    
    func execute(items: [ExecuteItem])
    func execute(items: [ControlExecuteItem])
    func sequential(items: [ControlExecuteItem])
}

public final class RefdsTask: RefdsTaskProtocol {
    private let group = DispatchGroup()
    public var queue: DispatchQueue
    
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
    
    public func execute(items: [ControlExecuteItem]) {
        items.forEach { item in
            group.enter()
            queue.async { item(self.group) }
        }
        group.wait()
    }
    
    public func sequential(items: [ControlExecuteItem]) {
        items.forEach { item in
            group.enter()
            queue.async { item(self.group) }
            group.wait()
        }
    }
}
