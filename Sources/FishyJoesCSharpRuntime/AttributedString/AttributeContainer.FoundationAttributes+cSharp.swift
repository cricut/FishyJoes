import Foundation

extension AttributeContainer.FoundationAttributes: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributeContainer.FoundationAttributes {
        try Box<AttributeContainer.FoundationAttributes>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributeContainer.FoundationAttributes) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributeContainer.FoundationAttributes) throws -> R) throws -> R {
        try body(&Box<AttributeContainer.FoundationAttributes>.peekCSharp(this).value)
    }
}

@_cdecl("FishyJoesCSharpRuntime_AttributeContainer_FoundationAttributes_setup")
public func FishyJoesCSharpRuntime_AttributeContainer_FoundationAttributes_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributeContainer.FoundationAttributes._constructorMethod == nil else { return }
    AttributeContainer.FoundationAttributes._constructorMethod = constructorMethod
}

@_cdecl("__cs_get_AttributeContainer_FoundationAttributes_Link")
public func __cs_get_AttributeContainer_FoundationAttributes_Link(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> OptionalConverter<Foundation.URL>.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try OptionalConverter<Foundation.URL>.toCSharp(AttributeContainer.FoundationAttributes.peekCSharp(_cSharpThis).link)
    }
}

@_cdecl("__cs_set_AttributeContainer_FoundationAttributes_Link")
public func __cs_set_AttributeContainer_FoundationAttributes_Link(
    _cSharpThis: csObject,
    newValue: OptionalConverter<Foundation.URL>.CType,
    _exn: csOutExn
) {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributeContainer.FoundationAttributes.mutateCSharp(_cSharpThis) { value in
            value.link = try OptionalConverter<Foundation.URL>.peekCSharp(newValue)
        }
    }
}

@_cdecl("__cs_get_AttributeContainer_FoundationAttributes_LanguageIdentifier")
public func __cs_get_AttributeContainer_FoundationAttributes_LanguageIdentifier(
    _cSharpThis: csObject,
    _exn: csOutExn
) -> OptionalConverter<Swift.String>.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try OptionalConverter<Swift.String>.toCSharp(AttributeContainer.FoundationAttributes.peekCSharp(_cSharpThis).languageIdentifier)
    }
}

@_cdecl("__cs_set_AttributeContainer_FoundationAttributes_LanguageIdentifier")
public func __cs_set_AttributeContainer_FoundationAttributes_LanguageIdentifier(
    _cSharpThis: csObject,
    newValue: OptionalConverter<Swift.String>.CType,
    _exn: csOutExn
) {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        try AttributeContainer.FoundationAttributes.mutateCSharp(_cSharpThis) { value in
            value.languageIdentifier = try OptionalConverter<Swift.String>.peekCSharp(newValue)
        }
    }
}

@_cdecl("__cs_AttributeContainer_FoundationAttributes_equals")
public func AttributeContainer_FoundationAttributes_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributeContainer.FoundationAttributes.peekCSharp(lhs) == AttributeContainer.FoundationAttributes.peekCSharp(rhs))
    }
}
@_cdecl("__cs_AttributeContainer_FoundationAttributes_hash")
public func AttributeContainer_FoundationAttributes_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributeContainer.FoundationAttributes.peekCSharp(this).hashValue)
        )
    }
}

@_cdecl("__cs_AttributeContainer_FoundationAttributes_createEmpty")
public func __cs_AttributeContainer_FoundationAttributes_createEmpty(
    _exn: csOutExn
) -> AttributeContainer.FoundationAttributes.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributeContainer.FoundationAttributes.toCSharp(
            AttributeContainer.FoundationAttributes(
            )
        )
    }
}

@_cdecl("__cs_AttributeContainer_FoundationAttributes_createFromContainer")
public func __cs_AttributeContainer_FoundationAttributes_createFromContainer(
    container: Foundation.AttributeContainer.CType,
    _exn: csOutExn
) -> AttributeContainer.FoundationAttributes.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributeContainer.FoundationAttributes.toCSharp(
            AttributeContainer.FoundationAttributes(
                try Foundation.AttributeContainer.peekCSharp(container)
            )
        )
    }
}

@_cdecl("__cs_AttributeContainer_FoundationAttributes_asContainer")
public func __cs_AttributeContainer_FoundationAttributes_asContainer(this: csObject, exn: csOutExn) -> AttributeContainer.CType {
    Env.catching(to: exn) {
        try AttributeContainer.toCSharp(
            AttributeContainer(AttributeContainer.FoundationAttributes.peekCSharp(this))
        )
    }
}
