import Foundation

public actor RefdsDictionary<
    Key: Hashable & Sendable,
    Value,
    Transform: Comparable
> {
    private var elements: [Key: Value] = [:]
    private let keyPath: KeyPath<Value, Transform>
    private let maxCapacity: Int?
    
    public init(
        for type: Value.Type,
        by keyPath: KeyPath<Value, Transform>,
        maxCapacity: Int? = nil
    ) {
        self.keyPath = keyPath
        self.maxCapacity = maxCapacity
    }
    
    public subscript(key: Key) -> Value? {
        get async { elements[key] }
    }
    
    public func set(
        _ newValue: Value?,
        on key: Key
    ) {
        guard let newValue else { return remove(for: key) }
        if !canInsert { removeFirst() }
        guard let _ = elements[key] else {
            insert(newValue, on: key)
            elements[key] = newValue
            return
        }
        reorder(for: newValue, on: key)
        elements[key] = newValue
    }
    
    private func removeFirst() {
        guard let firstKey = keys.first else { return }
        remove(for: firstKey)
    }
    
    public var count: Int { keys.count }
    public var keys: [Key] = []
    public var values: [Value] { keys.compactMap { elements[$0] } }
    
    private var canInsert: Bool {
        guard let maxCapacity else { return true }
        return count < maxCapacity
    }
    
    private func insert(
        _ newValue: Value,
        on key: Key
    ) {
        let rhs = newValue[keyPath: keyPath]
        let index = keys.firstIndex(where: { k in
            guard let lhs = elements[k].map({ $0[keyPath: keyPath] }) else { return false }
            return lhs > rhs
        }) ?? keys.count
        keys.insert(key, at: index)
    }
    
    private func reorder(
        for newValue: Value,
        on key: Key
    ) {
        guard newValue[keyPath: keyPath] != elements[key].map({ $0[keyPath: keyPath] }) else { return }
        keys.sort { lhs, rhs in
            guard let lhsc = elements[lhs].map({ $0[keyPath: keyPath] }),
                  let rhsc = elements[rhs].map({ $0[keyPath: keyPath] }) else { return false }
            return lhsc < rhsc
        }
    }
    
    private func remove(for key: Key) {
        elements.removeValue(forKey: key)
        guard let index = keys.firstIndex(of: key) else { return }
        keys.remove(at: index)
    }
}
