import Foundation

public protocol RefdsModel: Codable, RefdsLogger {
    
}

public extension RefdsModel {
    func logger() {
        let encodable = (self as Encodable).message
        self.loggerInstance.info(message: encodable)
    }
}
