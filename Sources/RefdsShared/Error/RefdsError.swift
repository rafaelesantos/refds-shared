import Foundation

public enum RefdsError:
    Error,
    CustomStringConvertible,
    Equatable,
    RefdsLogger,
    RefdsAlert
{
    case decodedError(type: Decodable.Type)
    case encodedError(type: Encodable.Type)
    case requestError(error: Error)
    case notFound(type: Any.Type)
    case custom(message: String)
    
    public var description: String {
        switch self {
        case .decodedError(let decodedType): return "Error on decoded - \(decodedType.self)"
        case .encodedError(let encodedType): return "Error on encoded - \(encodedType.self)"
        case .requestError(let description): return "Error on request - \(description)"
        case .notFound(let type): return "Error - not found - \(type.self)"
        case .custom(let message): return "Custom Error - \(message)"
        }
    }
    
    public var title: String? {
        switch self {
        case .decodedError: return "Decoded Error"
        case .encodedError: return "Encoded Error"
        case .requestError: return "Request Error"
        case .notFound: return "Not Found"
        case .custom: return "Unknown error"
        }
    }
    
    public var message: String? {
        description
    }
    
    public static func == (lhs: RefdsError, rhs: RefdsError) -> Bool {
        lhs.description == rhs.description
    }
    
    public func logger() {
        Self.loggerInstance.error(message: description)
    }
}
