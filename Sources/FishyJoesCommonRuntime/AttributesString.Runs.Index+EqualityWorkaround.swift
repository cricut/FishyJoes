#if os(WASI)
import FoundationEssentials
#else
import Foundation
#endif

extension AttributedString.Runs.Index {
    public func workaroundEquals(_ rhs: AttributedString.Runs.Index) -> Bool {
        !(self < rhs || rhs < self)
    }
}
