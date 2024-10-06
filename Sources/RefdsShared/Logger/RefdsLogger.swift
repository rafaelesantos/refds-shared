import Foundation

public protocol RefdsLogger {
    static var loggerInstance: RefdsLoggerSystem { get }
    func logger() async
}

public extension RefdsLogger {
    static var loggerInstance: RefdsLoggerSystem { .shared }
}

public actor RefdsLoggerSystem {
    public static let shared = RefdsLoggerSystem()
    
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
