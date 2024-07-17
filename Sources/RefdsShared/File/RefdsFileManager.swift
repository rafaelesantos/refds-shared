import Foundation

public enum RefdsFileManagerPrivacy: String {
    case `public` = ""
    case `private` = ".private"
}

public final class RefdsFileManager {
    public static var `default` = RefdsFileManager()
    private var fileManager = FileManager.default
    
    private init() {}
    
    public func path(
        with name: String,
        privacy: RefdsFileManagerPrivacy = .public
    ) -> URL? {
        guard let documentsURL = fileManager.urls(
            for: .documentDirectory,
            in: .userDomainMask
        ).first else { return nil }
        
        switch privacy {
        case .public:
            return documentsURL.appendingPathComponent(name)
            
        case .private:
            let privateURL = documentsURL.appendingPathComponent(privacy.rawValue)
            do {
                try fileManager.createDirectory(
                    at: privateURL,
                    withIntermediateDirectories: true,
                    attributes: nil
                )
            } catch { return nil }
            return privateURL.appendingPathComponent(name)
        }
    }
}
