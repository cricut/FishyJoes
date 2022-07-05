import FishyJoesCommonRuntime
import Foundation

extension Box {
    public static func fromCSharp(_ value: csObject) throws -> Box<T> {
        try Box(inner: AnyBox.fromCSharp(value))
    }
}

@_cdecl("FJRuntime_AnyBox_setup")
fileprivate func AnyBoxSetup(
    cSharpConstructor: @escaping @convention(c) (UnsafeMutableRawPointer, _ exn: UnsafeMutablePointer<csObject>) -> csObject,
    refGetter: @escaping @convention(c) (csObject, _ exn: UnsafeMutablePointer<csObject>) -> UnsafeMutableRawPointer?,
    _ exn: UnsafeMutablePointer<csObject>
) {
    guard AnyBox.cSharpConstructor == nil else { return }
    AnyBox.cSharpConstructor = cSharpConstructor
    AnyBox.refGetter = refGetter
}

@_cdecl("FJRuntime_AnyBox_finalize")
fileprivate func AnyBoxFinalize(this: csObject, _ exn: UnsafeMutablePointer<csObject>) {
    let ptr = AnyBox.refGetter(this, exn)
    guard exn.pointee != nil else { return }
    Env.catching(to: exn) {
        guard let ptr = ptr else { throw NullPointerError() }
        AnyBox.releaseOpaque(ptr)
    }
}

@_cdecl("FJRuntime_AnyBox_toString")
fileprivate func toString(this: csObject, _ exn: UnsafeMutablePointer<csObject>) -> csObject {
    Env.catching(to: exn) {
        try String.toCSharp("\(AnyBox.fromCSharp(this).value)")
    }
}

extension AnyBox {
    fileprivate static var cSharpConstructor: ((UnsafeMutableRawPointer, _ exn: UnsafeMutablePointer<csObject>) -> csObject)!
    fileprivate static var refGetter: ((csObject, _ exn: UnsafeMutablePointer<csObject>) -> UnsafeMutableRawPointer?)!

    public static func fromCSharp(_ value: csObject) throws -> AnyBox {
        let ref = try Env.check { exn in refGetter(value, exn) }
        return takeUnretainedOpaque(try Env.nonNull(ref))
    }
}
