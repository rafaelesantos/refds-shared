import Foundation

public extension Array {
    subscript(safe index: Int) -> Element? {
        guard index >= 0 && index < count else { return nil }
        return self[index]
    }
    
    mutating func insert<T: Comparable>(
        _ element: Element,
        by keyPath: KeyPath<Element, T>
    ) {
        let index = self.firstIndex {
            $0[keyPath: keyPath] >= element[keyPath: keyPath]
        } ?? self.count
        self.insert(element, at: index)
    }
}
