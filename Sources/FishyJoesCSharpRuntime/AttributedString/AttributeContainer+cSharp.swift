import Foundation

extension AttributeContainer: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributeContainer {
        try Box<AttributeContainer>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributeContainer) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributeContainer) throws -> R) throws -> R {
        try body(&Box<AttributeContainer>.peekCSharp(this).value)
    }
}

@_cdecl("FishyJoesRuntime_AttributeContainer_setup")
public func FishyJoesRuntime_cSharp_AttributeContainer_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributeContainer._constructorMethod == nil else { return }
    AttributeContainer._constructorMethod = constructorMethod
}

@_cdecl("__cs_AttributeContainer_merge")
public func __cs_AttributeContainer_merge(
    _cSharpThis: csObject,
    other: AttributeContainer.CType,
    keepCurrent: Bool.CType,
    _exn: csOutExn
) -> VoidConverter.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributeContainer.mutateCSharp(_cSharpThis) { mutatingSelf in
            return try VoidConverter.toCSharp(
                mutatingSelf.merge(
                    try AttributeContainer.peekCSharp(other),
                    mergePolicy: !Bool.peekCSharp(keepCurrent) ? .keepNew : .keepCurrent
                )
            )
        }
    }
}

@_cdecl("__cs_AttributeContainer_equals")
public func AttributeContainer_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributeContainer.peekCSharp(lhs) == AttributeContainer.peekCSharp(rhs))
    }
}
@_cdecl("__cs_AttributeContainer_hash")
public func AttributeContainer_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        try Int32.toCSharp(
            Int32(truncatingIfNeeded: AttributedString("HASH", attributes: AttributeContainer.peekCSharp(this)).hashValue)
        )
    }
}

@_cdecl("__cs_AttributeContainer_createEmpty")
public func __cs_AttributeContainer_createEmpty(
    _exn: csOutExn
) -> AttributeContainer.CType {
    FishyJoesCSharpRuntime.Env.catching(to: _exn) {
        return try AttributeContainer.toCSharp(
            AttributeContainer(
            )
        )
    }
}
