import Foundation

@propertyWrapper
public struct RefdsDefault<Value> {
    let key: String
    let defaultValue: Value
    var defaults: UserDefaults = .standard
    
    public var wrappedValue: Value? {
        get { defaults.object(forKey: key) as? Value }
        set { defaults.set(newValue, forKey: key) }
    }
}
