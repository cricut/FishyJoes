import Foundation

extension AttributedString.Runs.Index {
    func workaroundEquals(rhs: AttributedString.Runs.Index) -> Bool {
        !(self < rhs || rhs < self
    }
}
