import Foundation

public final class NodeReference: @unchecked Sendable {
    private var ref: NAPI.Ref

    public init(env: NAPI.Env, value: NAPI.Value) throws {
        self.ref = try env.createReference(value, 1)
    }

    public func value(env: NAPI.Env) throws -> NAPI.Value {
        try env.getReferenceValue(ref)
    }

    public func deallocate(env: NAPI.Env) {
        guard ref.ptr != nil else {
            return
        }
        try? env.deleteReference(ref)
        ref.ptr = nil
    }

    deinit {
//        precondition(ref.ptr == nil, "Node reference has not been deallocated before going out of scope")
    }
}

extension NAPI.Env {
    public func reference(_ value: NAPI.Value) throws -> NodeReference {
        try NodeReference(env: self, value: value)
    }
}
