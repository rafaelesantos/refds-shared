import Foundation

@propertyWrapper
public struct RefdsDefault<Value> {
    let key: String
    let defaultValue: Value
    
    public var wrappedValue: Value? {
        get { Self.defaults.object(forKey: key) as? Value }
        set { Self.defaults.set(newValue, forKey: key) }
    }
    
    static var defaults: UserDefaults {
        UserDefaults(suiteName: "refds.defaults") ?? .standard
    }
    
    static func get<T>(for key: String) -> T? {
        defaults.object(forKey: key) as? T
    }
    
    static func set<T>(_ value: T, for key: String) {
        defaults.set(value, forKey: key)
    }
}
