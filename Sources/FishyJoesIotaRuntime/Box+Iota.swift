import FishyJoesCommonRuntime
import Foundation

extension Box {
    public static func peekIota(_ value: foreignObject) throws -> Box<T> {
        try Box(inner: AnyBox.peekIota(value))
    }
}

@_cdecl("FishyJoesRuntime_AnyBox_setup")
public func AnyBoxSetup(refGetter: @escaping AnyBox.RefGetter) {
    guard AnyBox.refGetter == nil else { return }
    AnyBox.refGetter = refGetter
}

@_cdecl("FishyJoesRuntime_AnyBox_releaseRef")
public func AnyBoxRelease(ptr: UnsafeMutableRawPointer?, _ exn: foreignOutExn) {
    Env.catching(to: exn) {
        AnyBox.releaseOpaque(try Env.unwrap(ptr))
    }
}

@_cdecl("FishyJoesRuntime_AnyBox_toString")
public func toString(ptr: UnsafeMutableRawPointer?, _ exn: foreignOutExn) -> foreignObject {
    Env.catching(to: exn) {
        try String.toIota("\(AnyBox.takeUnretainedOpaque(try Env.unwrap(ptr)).value)")
    }
}

extension AnyBox {
    public typealias RefGetter = @convention(c) (foreignObject, _ exn: foreignOutExn) -> UnsafeMutableRawPointer?
    fileprivate static var refGetter: RefGetter!

    public static func peekIota(_ value: foreignObject) throws -> AnyBox {
        let ref = try Env.check { exn in refGetter(value, exn) }
        return takeUnretainedOpaque(try Env.unwrap(ref))
    }
}
