import Foundation

@propertyWrapper
public struct RefdsDefaults<Value> {
    let key: String
    let defaultValue: Value
    
    public var wrappedValue: Value? {
        get { Self.defaults.object(forKey: key) as? Value }
        set { Self.defaults.set(newValue, forKey: key) }
    }
    
    static var defaults: UserDefaults {
        UserDefaults(suiteName: "refds.defaults") ?? .standard
    }
    
    public static func get(for key: String) -> Value? {
        defaults.object(forKey: key) as? Value
    }
    
    public static func set(_ value: Value, for key: String) {
        defaults.set(value, forKey: key)
    }
}
