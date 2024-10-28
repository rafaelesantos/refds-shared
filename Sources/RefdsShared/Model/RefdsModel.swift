import Foundation

public protocol RefdsModel: Codable, Sendable, RefdsLogger {
    
}

public extension RefdsModel {
    func logger() async {
        let encodable = (self as Encodable).message
        await Self.loggerInstance.info(message: encodable)
    }
}

public extension Array where Element: RefdsModel {
    func logger() async {
        let encodable = (self as Encodable).message
        await RefdsLoggerSystem.shared.info(message: encodable)
    }
}
