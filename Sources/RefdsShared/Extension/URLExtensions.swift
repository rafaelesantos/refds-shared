import Foundation

public extension URL {
    static func storeURL(for appGroup: String, databaseName: String) throws -> URL {
        guard let fileContainer = FileManager.default.containerURL(forSecurityApplicationGroupIdentifier: appGroup) else {
            throw RefdsError.notFound(type: FileManager.self)
        }
        return fileContainer.appendingPathComponent("\(databaseName).sqlite")
    }
}
