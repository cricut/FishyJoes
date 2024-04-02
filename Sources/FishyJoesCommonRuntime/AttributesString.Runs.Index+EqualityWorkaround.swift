import Foundation

extension AttributedString.Runs.Index {
    public func workaroundEquals(_ rhs: AttributedString.Runs.Index) -> Bool {
        !(self < rhs || rhs < self)
    }
}
