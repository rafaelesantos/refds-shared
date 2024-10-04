import Foundation

public extension Data {
    func asModel<T: Decodable>(dateFormat: String.DateFormat? = nil) -> T? {
        let jsonDecoder = JSONDecoder()
        guard let dateFormat = dateFormat else { return try? jsonDecoder.decode(T.self, from: self) }
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.value
        jsonDecoder.dateDecodingStrategy = .formatted(dateFormatter)
        return try? jsonDecoder.decode(T.self, from: self)
    }
}
