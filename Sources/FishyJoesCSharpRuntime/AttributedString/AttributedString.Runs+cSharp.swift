import Foundation

extension AttributedString.Runs: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedString.Runs {
        try Box<AttributedString.Runs>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedString.Runs) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedString.Runs) throws -> R) throws -> R {
        try body(&Box<AttributedString.Runs>.peekCSharp(this).value)
    }
}

@_cdecl("FishyJoesCSharpRuntime_AttributedString_Runs_setup")
public func FishyJoesCSharpRuntime_AttributedString_Runs_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedString.Runs._constructorMethod == nil else { return }
    AttributedString.Runs._constructorMethod = constructorMethod
}

@_cdecl("__cs_get_AttributedString_Runs_StartIndex")
public func __cs_get_AttributedString_Runs_StartIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Runs.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Runs.Index.toCSharp(AttributedString.Runs.peekCSharp(_cSharpThis).startIndex)
    }
}

@_cdecl("__cs_get_AttributedString_Runs_EndIndex")
public func __cs_get_AttributedString_Runs_EndIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Runs.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Runs.Index.toCSharp(AttributedString.Runs.peekCSharp(_cSharpThis).endIndex)
    }
}

@_cdecl("__cs_AttributedString_Runs_indexBefore")
public func __cs_AttributedString_Runs_indexBefore(
    _cSharpThis: csObject,
    i: AttributedString.Runs.Index.CType,
    _exn: csOutExn
) -> AttributedString.Runs.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.Runs.Index.toCSharp(
            AttributedString.Runs.peekCSharp(_cSharpThis).index(
                before: try AttributedString.Runs.Index.peekCSharp(i)
            )
        )
    }
}

@_cdecl("__cs_AttributedString_Runs_indexAfter")
public func __cs_AttributedString_Runs_indexAfter(
    _cSharpThis: csObject,
    i: AttributedString.Runs.Index.CType,
    _exn: csOutExn
) -> AttributedString.Runs.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.Runs.Index.toCSharp(
            AttributedString.Runs.peekCSharp(_cSharpThis).index(
                after: try AttributedString.Runs.Index.peekCSharp(i)
            )
        )
    }
}

@_cdecl("__cs_AttributedString_Runs_elementAt")
public func __cs_AttributedString_Runs_elementAt(
    _cSharpThis: csObject,
    index: AttributedString.Runs.Index.CType,
    _exn: csOutExn
) -> AttributedString.Runs.Run.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.Runs.Run.toCSharp(
            AttributedString.Runs.peekCSharp(_cSharpThis)[
                try AttributedString.Runs.Index.peekCSharp(index)
            ]
        )
    }
}

@_cdecl("__cs_AttributedString_Runs_elementAtPosition")
public func __cs_AttributedString_Runs_elementAtPosition(
    _cSharpThis: csObject,
    index: AttributedString.Index.CType,
    _exn: csOutExn
) -> AttributedString.Runs.Run.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.Runs.Run.toCSharp(
            AttributedString.Runs.peekCSharp(_cSharpThis)[
                try AttributedString.Index.peekCSharp(index)
            ]
        )
    }
}

@_cdecl("__cs_AttributedString_Runs_equals")
public func AttributedString_Runs_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributedString.Runs.peekCSharp(lhs) == AttributedString.Runs.peekCSharp(rhs))
    }
}

@_cdecl("__cs_AttributedString_Runs_hash")
public func AttributedString_Runs_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        let runHashes = try AttributedString.Runs.peekCSharp(this)
            .lazy
            .map { AttributedString("HASH", attributes: $0.attributes).hashValue }
        let hashValue = runHashes
            .reduce(into: Hasher()) { $0.combine($1) }
            .finalize()
        return try Int32.toCSharp(
            Int32(truncatingIfNeeded: hashValue)
        )
    }
}
