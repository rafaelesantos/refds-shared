import Foundation

public extension Error {
    var refdsError: RefdsError {
        .custom(message: localizedDescription)
    }
}
