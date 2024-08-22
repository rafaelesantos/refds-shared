import Foundation

public enum RefdsResult<Value> {
    case success(Value)
    case failure(RefdsError)
    
    public init(value: Value) {
        self = .success(value)
    }
    
    public init(error: RefdsError) {
        self = .failure(error)
    }
    
    func get() throws -> Value {
        switch self {
        case .success(let value):
            return value
        case .failure(let error):
            throw error
        }
    }
    
    func map<T>(_ transform: (Value) -> T) -> RefdsResult<T> {
        switch self {
        case .success(let value):
            return .success(transform(value))
        case .failure(let error):
            return .failure(error)
        }
    }
    
    func flatMap<T>(_ transform: (Value) -> RefdsResult<T>) -> RefdsResult<T> {
        switch self {
        case .success(let value):
            return transform(value)
        case .failure(let error):
            return .failure(error)
        }
    }
}
