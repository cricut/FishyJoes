import Foundation

extension AttributedString.CharacterView: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedString.CharacterView {
        try Box<AttributedString.CharacterView>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedString.CharacterView) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedString.CharacterView) throws -> R) throws -> R {
        try body(&Box<AttributedString.CharacterView>.peekCSharp(this).value)
    }
}

@_cdecl("TestAPI_AttributedString_CharacterView_setup")
public func TestAPI_AttributedString_CharacterView_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedString.CharacterView._constructorMethod == nil else { return }
    AttributedString.CharacterView._constructorMethod = constructorMethod
}

@_cdecl("__cs_get_AttributedString_CharacterView_StartIndex")
public func __cs_get_AttributedString_CharacterView_StartIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Index.toCSharp(AttributedString.CharacterView.peekCSharp(_cSharpThis).startIndex)
    }
}

@_cdecl("__cs_get_AttributedString_CharacterView_EndIndex")
public func __cs_get_AttributedString_CharacterView_EndIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Index.toCSharp(AttributedString.CharacterView.peekCSharp(_cSharpThis).endIndex)
    }
}

@_cdecl("__cs_AttributedString_CharacterView_indexBefore")
public func __cs_AttributedString_CharacterView_indexBefore(
    _cSharpThis: csObject,
    i: AttributedString.Index.CType,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.Index.toCSharp(
            AttributedString.CharacterView.peekCSharp(_cSharpThis).index(
                before: try AttributedString.Index.peekCSharp(i)
            )
        )
    }
}

@_cdecl("__cs_AttributedString_CharacterView_indexAfter")
public func __cs_AttributedString_CharacterView_indexAfter(
    _cSharpThis: csObject,
    i: AttributedString.Index.CType,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.Index.toCSharp(
            AttributedString.CharacterView.peekCSharp(_cSharpThis).index(
                after: try AttributedString.Index.peekCSharp(i)
            )
        )
    }
}

@_cdecl("__cs_AttributedString_CharacterView_elementAt")
public func __cs_AttributedString_CharacterView_elementAt(
    _cSharpThis: csObject,
    index: AttributedString.Index.CType,
    _exn: csOutExn
) -> Swift.String.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try Swift.String.toCSharp(
            String(
                AttributedString.CharacterView.peekCSharp(_cSharpThis)[
                    try AttributedString.Index.peekCSharp(index)
                ]
            )
        )
    }
}
