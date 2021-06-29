import Foundation
import NodeAPI

public class NodeReference {
    private var env: napi_env
    private var ref: napi_ref?

    public init(env: napi_env, value: napi_value?) throws {
        self.env = env
        try check(napi_create_reference(env, value, 1, &ref))
    }

    public func value(env: napi_env) throws -> napi_value? {
        var result: napi_value?
        try check(napi_get_reference_value(env, ref, &result))
        return result
    }

    deinit {
        _ = napi_delete_reference(env, ref)
        ref = nil
    }
}
