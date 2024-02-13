import FishyJoesCommonRuntime
import Foundation

// This file should be the only C#-specific part of iota.
// It is needed because C# apparently has no idea what malloc/free are.

@_cdecl("FishyJoesCommonRuntime_strup")
public func FishyJoesCommonRuntime_strdup(ptr: UnsafeMutablePointer<CChar>) -> UnsafeMutablePointer<CChar> {
    strdup(ptr)
}
