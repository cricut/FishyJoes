import Foundation

struct SortedSet<Element: Hashable> {
    private var backingSet: Set<Element>
    private var backingOrder: [Element]

    @discardableResult
    mutating func insert(_ newMember: Element) -> (inserted: Bool, memberAfterInsert: Element) {
        let result = backingSet.insert(newMember)
        if result.inserted {
            backingOrder.append(newMember)
        }
        return result
    }

    mutating func formUnion<S>(_ other: S) where Element == S.Element, S : Sequence {
        for element in other {
            insert(element)
        }
    }

    // TODO: rest of methods from `Swift.Set` if they're ever needed
}

extension SortedSet: ExpressibleByArrayLiteral {
    init(arrayLiteral: Element...) {
        backingSet = []
        backingOrder = []
        formUnion(arrayLiteral)
    }
}

extension SortedSet: Sequence {
    func makeIterator() -> [Element].Iterator {
        backingOrder.makeIterator()
    }
}
