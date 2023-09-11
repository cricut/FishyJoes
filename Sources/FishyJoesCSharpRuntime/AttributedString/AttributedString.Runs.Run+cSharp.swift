import Foundation

extension AttributedString.Runs.Run: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedString.Runs.Run {
        try Box<AttributedString.Runs.Run>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedString.Runs.Run) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedString.Runs.Run) throws -> R) throws -> R {
        try body(&Box<AttributedString.Runs.Run>.peekCSharp(this).value)
    }
}

@_cdecl("FishyJoesRuntime_AttributedString_Runs_Run_setup")
public func FishyJoesRuntime_cSharp_AttributedString_Runs_Run_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedString.Runs.Run._constructorMethod == nil else { return }
    AttributedString.Runs.Run._constructorMethod = constructorMethod
}

@_cdecl("__cs_get_AttributedString_Runs_Run_Range")
public func __cs_get_AttributedString_Runs_Run_Range(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> RangeConverter<AttributedString.Index>.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try RangeConverter<AttributedString.Index>.toCSharp(AttributedString.Runs.Run.peekCSharp(_cSharpThis).range)
    }
}

@_cdecl("__cs_get_AttributedString_Runs_Run_Attributes")
public func __cs_get_AttributedString_Runs_Run_Attributes(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributeContainer.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributeContainer.toCSharp(AttributedString.Runs.Run.peekCSharp(_cSharpThis).attributes)
    }
}

@_cdecl("__cs_AttributedString_Runs_Run_equals")
public func AttributedString_Runs_Run_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributedString.Runs.Run.peekCSharp(lhs) == AttributedString.Runs.Run.peekCSharp(rhs))
    }
}

@_cdecl("__cs_AttributedString_Runs_Run_hash")
public func AttributedString_Runs_Run_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributedString("HASH", attributes: AttributedString.Runs.Run.peekCSharp(this).attributes).hashValue)
        )
    }
}
