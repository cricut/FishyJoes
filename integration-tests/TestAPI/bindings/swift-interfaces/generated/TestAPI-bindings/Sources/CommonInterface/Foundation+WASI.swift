// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
#if os(WASI)
import FoundationEssentials
#else
import Foundation
#endif
import TestAPI

#if os(WASI)
// Generated code names types as `Foundation.X`; on WASI they come from FoundationEssentials
enum Foundation {
    typealias AttributeContainer = FoundationEssentials.AttributeContainer
    typealias AttributedString = FoundationEssentials.AttributedString
    typealias AttributedSubstring = FoundationEssentials.AttributedSubstring
    typealias Data = FoundationEssentials.Data
    typealias URL = FoundationEssentials.URL
}
#endif
