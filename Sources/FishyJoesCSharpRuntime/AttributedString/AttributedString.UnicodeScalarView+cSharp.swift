import Foundation

extension AttributedString.UnicodeScalarView: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedString.UnicodeScalarView {
        try Box<AttributedString.UnicodeScalarView>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedString.UnicodeScalarView) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedString.UnicodeScalarView) throws -> R) throws -> R {
        try body(&Box<AttributedString.UnicodeScalarView>.peekCSharp(this).value)
    }
}

@_cdecl("FishyJoesCSharpRuntime_AttributedString_UnicodeScalarView_setup")
public func FishyJoesCSharpRuntime_AttributedString_UnicodeScalarView_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedString.UnicodeScalarView._constructorMethod == nil else { return }
    AttributedString.UnicodeScalarView._constructorMethod = constructorMethod
}

@_cdecl("__cs_get_AttributedString_UnicodeScalarView_StartIndex")
public func __cs_get_AttributedString_UnicodeScalarView_StartIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Index.toCSharp(AttributedString.UnicodeScalarView.peekCSharp(_cSharpThis).startIndex)
    }
}

@_cdecl("__cs_get_AttributedString_UnicodeScalarView_EndIndex")
public func __cs_get_AttributedString_UnicodeScalarView_EndIndex(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributedString.Index.toCSharp(AttributedString.UnicodeScalarView.peekCSharp(_cSharpThis).endIndex)
    }
}

@_cdecl("__cs_AttributedString_UnicodeScalarView_indexBefore")
public func __cs_AttributedString_UnicodeScalarView_indexBefore(
    _cSharpThis: csObject,
    i: AttributedString.Index.CType,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.Index.toCSharp(
            AttributedString.UnicodeScalarView.peekCSharp(_cSharpThis).index(
                before: try AttributedString.Index.peekCSharp(i)
            )
        )
    }
}

@_cdecl("__cs_AttributedString_UnicodeScalarView_indexAfter")
public func __cs_AttributedString_UnicodeScalarView_indexAfter(
    _cSharpThis: csObject,
    i: AttributedString.Index.CType,
    _exn: csOutExn
) -> AttributedString.Index.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributedString.Index.toCSharp(
            AttributedString.UnicodeScalarView.peekCSharp(_cSharpThis).index(
                after: try AttributedString.Index.peekCSharp(i)
            )
        )
    }
}

@_cdecl("__cs_AttributedString_UnicodeScalarView_elementAt")
public func __cs_AttributedString_UnicodeScalarView_elementAt(
    _cSharpThis: csObject,
    index: AttributedString.Index.CType,
    _exn: csOutExn
) -> UInt32.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try UInt32.toCSharp(
            AttributedString.UnicodeScalarView.peekCSharp(_cSharpThis)[
                try AttributedString.Index.peekCSharp(index)
            ].value
        )
    }
}
