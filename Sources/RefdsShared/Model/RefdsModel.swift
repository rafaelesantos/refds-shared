import Foundation

public protocol RefdsModel: Codable, Sendable, RefdsLogger {
    
}

public extension RefdsModel {
    func logger() async {
        let encodable = (self as Encodable).message
        await Self.loggerInstance.info(message: encodable)
    }
}

extension Array: RefdsModel where Element: RefdsModel {}

extension Array: RefdsLogger where Element: RefdsModel {
    public func logger() async {
        let encodable = (self as Encodable).message
        await Self.loggerInstance.info(message: encodable)
    }
}
