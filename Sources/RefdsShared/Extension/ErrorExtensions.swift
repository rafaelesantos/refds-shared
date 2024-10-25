import Foundation

public extension Error {
    var refdsError: RefdsError {
        .with(message: self.localizedDescription)
    }
}
