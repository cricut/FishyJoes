import Foundation

extension AttributedString.Runs.Index: CSharpMutator {
    fileprivate static var _constructorMethod: ((UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject)!

    public static func peekCSharp(_ value: csObject) throws -> AttributedString.Runs.Index {
        try Box<AttributedString.Runs.Index>.peekCSharp(value).value
    }

    public static func toCSharp(_ value: AttributedString.Runs.Index) throws -> csObject {
        let ptr = Box(value).retainedOpaque()
        return try Env.check { env in _constructorMethod(ptr, env) }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout AttributedString.Runs.Index) throws -> R) throws -> R {
        try body(&Box<AttributedString.Runs.Index>.peekCSharp(this).value)
    }
}

@_cdecl("FishyJoesRuntime_AttributedString_Runs_Index_setup")
public func FishyJoesRuntime_cSharp_AttributedString_Runs_Index_setup(
    constructorMethod: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: csOutExn) -> csObject,
    _ exn: csOutExn
) {
    guard AttributedString.Runs.Index._constructorMethod == nil else { return }
    AttributedString.Runs.Index._constructorMethod = constructorMethod
}

@_cdecl("__cs_AttributedString_Runs_Index_equals")
public func AttributedString_Runs_Index_cSharpEquals(lhs: csObject, rhs: csObject, exn: csOutExn) -> Bool.CType {
    Env.catching(to: exn) {
        return try Bool.toCSharp(AttributedString.Runs.Index.peekCSharp(lhs) == AttributedString.Runs.Index.peekCSharp(rhs))
    }
}

@_cdecl("__cs_AttributedString_Runs_Index_hash")
public func AttributedString_Runs_Index_cSharpHash(this: csObject, exn: csOutExn) -> Int32.CType {
    Env.catching(to: exn) {
        var index = try AttributedString.Runs.Index.peekCSharp(this)
        // TODO: Switch to using hashValue when available, as Comparable should be, but is not guaranteed to be, compatible with this hash value
        // let hashValue = index.hashValue
        let hashValue = withUnsafeBytes(of: &index) { (bytes: UnsafeRawBufferPointer) -> Int in
            var hasher = Hasher()
            hasher.combine(bytes: bytes)
            return hasher.finalize()
        }
        return try Int32.toCSharp(Int32(truncatingIfNeeded: hashValue))
    }
}

@_cdecl("__cs_AttributedString_Runs_Index_compare")
public func AttributedString_Runs_Index_cSharpCompare(this: csObject, other: csObject, exn: csOutExn) -> Int.CType {
    Env.catching(to: exn) {
        let thisComparable = try AttributedString.Runs.Index.peekCSharp(this)
        let otherComparable = try AttributedString.Runs.Index.peekCSharp(other)
        return try Int.toCSharp(
            thisComparable < otherComparable ? -1 : thisComparable > otherComparable ? 1 : 0
        )
    }
}
