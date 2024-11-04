import Foundation

public enum RefdsError: Error, LocalizedError, RefdsLogger {
    case with(message: String)
    
    public static func decode<T>(for type: T.Type) -> Error {
        DecodingError.typeMismatch(
            T.self,
            .init(
                codingPath: [],
                debugDescription: "Decoding failed for \(type)"
            )
        )
    }
    
    public static func encode<T>(for type: T.Type) -> Error {
        EncodingError.invalidValue(
            T.self,
            .init(
                codingPath: [],
                debugDescription: "Encoding failed for \(type)"
            )
        )
    }
    
    public static func request(for code: URLError.Code) -> Error {
        URLError(code)
    }
    
    public static func cocoa(code: CocoaError.Code) -> Error {
        CocoaError(code)
    }
    
    public func logger() async {
        await Self.loggerInstance.error(message: localizedDescription)
    }
}

extension Error {
    public func logger() async {
        await RefdsLoggerSystem.shared.error(message: localizedDescription)
    }
}
