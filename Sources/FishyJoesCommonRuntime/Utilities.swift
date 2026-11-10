import Foundation

// Used to silence warnings in generated code where an expression may or may not throw
@inlinable
@inline(__always)
public func silenceTryWarning<T>(_ x: T) throws -> T { x }

// Used to silence warnings in generated code where a "var" may or may not have mutations applied to it
@inlinable
@inline(__always)
public func silenceMutationWarning<T>(_ x: inout T) {}

@_cdecl("FishyJoesCommonRuntime_strdup")
func strdupWrapper(_ ptr: UnsafePointer<CChar>) -> UnsafeMutablePointer<CChar> {
    strdup(ptr)
}

// Used by C# and python-on-windows because apparently microsoft has a hard time with the C standard library
@_cdecl("FishyJoesCommonRuntime_strdup")
public func FishyJoesCommonRuntime_strdup(ptr: UnsafeMutablePointer<CChar>) -> UnsafeMutablePointer<CChar> {
    strdup(ptr)
}
