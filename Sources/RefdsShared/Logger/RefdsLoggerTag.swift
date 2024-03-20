import Foundation
import os

public enum RefdsLoggerTag: RefdsModel {
    case info(message: String)
    case error(message: String)
    
    public var key: String {
        switch self {
        case .info: return "INFO"
        case .error: return "ERROR"
        }
    }
    
    public var message: String {
        switch self {
        case .info(let message): return message
        case .error(let message): return message
        }
    }
    
    public var logger: Void {
        console()
    }
    
    public func console(
        bundle: String? = Bundle.main.bundleIdentifier,
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) {
        guard let bundle = bundle  else { return }
        let log = OSLog(subsystem: bundle, category: "default")
        let callStackString = getCallStackString(file: file, line: line, function: function)
        let content = "\(key)\t\(callStackString)\t\(message)"
        
        switch self {
        case .info: os_log(.info, log: log, "%{public}s", content)
        case .error: os_log(.error, log: log, "%{public}s", content)
        }
    }
    
    private func getCallStackString(
        file: String = #file,
        line: Int = #line,
        function: String = #function
    ) -> String {
        let fileName = URL(fileURLWithPath: file).lastPathComponent
        let dotIndexOrLast = fileName.firstIndex(of: ".") ?? fileName.endIndex
        let fileWithoutExtension = String(fileName[fileName.startIndex ..< dotIndexOrLast])
        return "[\(fileWithoutExtension)\t\(function): \(line)]"
    }
}
