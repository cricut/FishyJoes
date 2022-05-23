import Foundation

public class NodeReference {
    private var env: NAPI.Env
    private var ref: NAPI.Ref

    public init(env: NAPI.Env, value: NAPI.Value) throws {
        self.env = env
        self.ref = try env.createReference(value, 1)
    }

    public func value(env: NAPI.Env) throws -> NAPI.Value {
        try env.getReferenceValue(ref)
    }

    deinit {
        try? env.deleteReference(ref)
        ref.ptr = nil
    }
}

extension NAPI.Env {
    public func reference(_ value: NAPI.Value) throws -> NodeReference {
        try NodeReference(env: self, value: value)
    }
}
