import Foundation

@propertyWrapper
public struct RefdsDefaults<Value: Codable> {
    let key: String
    var defaultValue: Value? = nil
    
    public init(
        key: String,
        defaultValue: Value? = nil
    ) {
        self.key = key
        self.defaultValue = defaultValue
    }
    
    public var wrappedValue: Value? {
        get { Self.get(for: key) }
        set { Self.set(newValue, for: key) }
    }
    
    static var defaults: UserDefaults {
        UserDefaults(suiteName: "refds.defaults") ?? .standard
    }
    
    public static func get(for key: String) -> Value? {
        guard let data = defaults.data(forKey: key) else { return nil }
        return try? JSONDecoder().decode(Value.self, from: data)
    }
    
    public static func set(_ value: Value?, for key: String) {
        guard let data = value.asData else { return }
        defaults.set(data, forKey: key)
    }
}
