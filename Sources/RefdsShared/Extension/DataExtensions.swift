import Foundation

public extension Data {
    func asModel<T: Decodable>(
        for type: T.Type,
        with dateFormat: String.DateFormat? = nil
    ) throws -> T {
        let jsonDecoder = JSONDecoder()
        guard let dateFormat = dateFormat else { return try jsonDecoder.decode(T.self, from: self) }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.value
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try jsonDecoder.decode(T.self, from: self)
    }
}
