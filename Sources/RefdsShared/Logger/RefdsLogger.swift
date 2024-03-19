import Foundation

public protocol RefdsLogger {
    var logger: RefdsLoggerSystem { get }
}

public extension RefdsLogger {
    var logger: RefdsLoggerSystem { .shared }
}

public final class RefdsLoggerSystem {
    static let shared = RefdsLoggerSystem()
    
    public func info(file: String = #file, line: Int = #line, function: String = #function, message: String) {
        RefdsLoggerTag
            .info(message: message)
            .console(file: file, line: line, function: function)
    }
    
    public func error(file: String = #file, line: Int = #line, function: String = #function, message: String) {
        RefdsLoggerTag
            .error(message: message)
            .console(file: file, line: line, function: function)
    }
}
