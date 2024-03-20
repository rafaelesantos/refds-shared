import Foundation

public protocol RefdsLogger {
    var loggerInstance: RefdsLoggerSystem { get }
    func logger()
}

public extension RefdsLogger {
    var loggerInstance: RefdsLoggerSystem { .shared }
}

public final class RefdsLoggerSystem {
    static let shared = RefdsLoggerSystem()
    
    public func info(
        bundle: String? = Bundle.main.bundleIdentifier,
        file: String = #file,
        line: Int = #line,
        function: String = #function,
        message: String
    ) {
        RefdsLoggerTag
            .info(message: message)
            .console(
                bundle: bundle,
                file: file,
                line: line,
                function: function
            )
    }
    
    public func error(
        bundle: String? = Bundle.main.bundleIdentifier,
        file: String = #file,
        line: Int = #line,
        function: String = #function,
        message: String
    ) {
        RefdsLoggerTag
            .error(message: message)
            .console(
                bundle: bundle,
                file: file,
                line: line,
                function: function
            )
    }
}
