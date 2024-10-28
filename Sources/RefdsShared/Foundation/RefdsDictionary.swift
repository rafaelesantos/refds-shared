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
        get { elements[key] }
        set {
            guard let newValue else { return remove(for: key) }
            guard canInsert else { return }
            if elements[key] == nil { insert(for: key) }
            elements[key] = newValue
        }
    }
    
    @discardableResult
    public func removeFirst() -> Value? {
        guard let firstKey = keys.first else { return nil }
        let element = elements[firstKey]
        remove(for: firstKey)
        return element
    }
    
    public var count: Int { keys.count }
    public var keys: [Key] = []
    public var values: [Value] { keys.compactMap { elements[$0] } }
    
    private var canInsert: Bool {
        guard let maxCapacity else { return true }
        return count < maxCapacity
    }
    
    private func insert(for key: Key) {
        let index = keys.firstIndex(where: { k in
            guard let lhs = elements[k].map({ $0[keyPath: keyPath] }),
                  let rhs = elements[key].map({ $0[keyPath: keyPath] }) else { return false }
            return lhs >= rhs
        }) ?? keys.count
        keys.insert(key, at: index)
    }
    
    private func remove(for key: Key) {
        elements.removeValue(forKey: key)
        keys.removeAll { $0 == key }
    }
}
