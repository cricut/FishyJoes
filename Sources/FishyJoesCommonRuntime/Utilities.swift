// Used to silence warnings in generated code where an expression may or may not throw
@inlinable
@inline(__always)
public func silenceTryWarning<T>(_ x: T) throws -> T { x }

// Used to silence warnings in generated code where a "va" may or may not have mutations applied to it
@inlinable
@inline(__always)
public func silenceMutationWarning<T>(_ x: inout T) {}
