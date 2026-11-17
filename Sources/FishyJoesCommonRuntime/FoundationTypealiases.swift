#if os(WASI)
import FoundationEssentials
#else
import Foundation
#endif

// Generated code spells Foundation types as `FishyJoesCommonRuntime.X`, so the same bindings compile
// whether Foundation or (on WASI) only FoundationEssentials is available.
// Keep in sync with the Foundation types FishyJoesContext can translate.
#if os(WASI)
public typealias AttributeContainer = FoundationEssentials.AttributeContainer
public typealias AttributedString = FoundationEssentials.AttributedString
public typealias AttributedSubstring = FoundationEssentials.AttributedSubstring
public typealias Data = FoundationEssentials.Data
public typealias URL = FoundationEssentials.URL
#else
public typealias AttributeContainer = Foundation.AttributeContainer
public typealias AttributedString = Foundation.AttributedString
public typealias AttributedSubstring = Foundation.AttributedSubstring
public typealias Data = Foundation.Data
public typealias URL = Foundation.URL
#endif
