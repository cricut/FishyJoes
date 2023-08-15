import Foundation

extension AttributedSubstring: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedSubstring {
        try Box<AttributedSubstring>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedSubstring) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedSubstring) throws -> R) throws -> R {
        try body(&Box<AttributedSubstring>.peekCSharp(this).value)
    }
}

@_cdecl("TestAPI_AttributedSubstring_setup")
public func TestAPI_AttributedSubstring_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedSubstring._constructorMethod == nil else { return }
    AttributedSubstring._constructorMethod = constructorMethod
}

@_cdecl("__cs_get_AttributedSubstring_Base")
public func __cs_get_AttributedSubstring_Base(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.toCSharp(AttributedSubstring.peekCSharp(_cSharpThis).base)
    }
}

@_cdecl("__cs_get_AttributedSubstring_String")
public func __cs_get_AttributedSubstring_String(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> Swift.String.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        let s = try AttributedSubstring.peekCSharp(_cSharpThis)
        return try Swift.String.toCSharp(String(s.characters))
    }
}

@_cdecl("__cs_get_AttributedSubstring_Runs")
public func __cs_get_AttributedSubstring_Runs(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Runs.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Runs.toCSharp(AttributedSubstring.peekCSharp(_cSharpThis).runs)
    }
}

@_cdecl("__cs_get_AttributedSubstring_Characters")
public func __cs_get_AttributedSubstring_Characters(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.CharacterView.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.CharacterView.toCSharp(AttributedSubstring.peekCSharp(_cSharpThis).characters)
    }
}

@_cdecl("__cs_get_AttributedSubstring_UnicodeScalars")
public func __cs_get_AttributedSubstring_UnicodeScalars(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.UnicodeScalarView.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.UnicodeScalarView.toCSharp(AttributedSubstring.peekCSharp(_cSharpThis).unicodeScalars)
    }
}

@_cdecl("__cs_get_AttributedSubstring_StartIndex")
public func __cs_get_AttributedSubstring_StartIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Index.toCSharp(AttributedSubstring.peekCSharp(_cSharpThis).startIndex)
    }
}

@_cdecl("__cs_get_AttributedSubstring_EndIndex")
public func __cs_get_AttributedSubstring_EndIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Index.toCSharp(AttributedSubstring.peekCSharp(_cSharpThis).endIndex)
    }
}

@_cdecl("__cs_get_AttributedSubstring_Substring")
public func __cs_get_AttributedSubstring_Substring(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedSubstring.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        let s = try AttributedSubstring.peekCSharp(_cSharpThis)
        return try AttributedSubstring.toCSharp(s[s.startIndex..<s.endIndex])
    }
}

@_cdecl("__cs_AttributedSubstring_substringForRange")
public func __cs_AttributedSubstring_substringForRange(
    _cSharpThis: csObject,
    range: RangeConverter<AttributedString.Index>.CType,
    _exn: csOutExn
) -> AttributedSubstring.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedSubstring.toCSharp(
            AttributedSubstring.peekCSharp(_cSharpThis)[
                try RangeConverter<AttributedString.Index>.peekCSharp(range)
            ]
        )
    }
}

@_cdecl("__cs_AttributedSubstring_equals")
public func AttributedSubstring_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributedSubstring.peekCSharp(lhs) == AttributedSubstring.peekCSharp(rhs))
    }
}

@_cdecl("__cs_AttributedSubstring_hash")
public func AttributedSubstring_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributedSubstring.peekCSharp(this).hashValue)
        )
    }
}

@_cdecl("__cs_AttributedSubstring_createEmpty")
public func __cs_AttributedSubstring_createEmpty(
    _exn: csOutExn
) -> AttributedSubstring.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedSubstring.toCSharp(
            AttributedSubstring(
            )
        )
    }
}
