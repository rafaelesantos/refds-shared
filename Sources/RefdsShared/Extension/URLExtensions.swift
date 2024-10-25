import Foundation

public extension URL {
    static func storeURL(for appGroup: String, databaseName: String) throws -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            throw RefdsError.cocoa(code: .fileNoSuchFile)
        }
        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }
}
