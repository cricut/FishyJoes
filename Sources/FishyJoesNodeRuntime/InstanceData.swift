import Foundation
import NodeAPI

public class InstanceData {
    public var constructors: [String: NodeReference] = [:]

    private init() {
    }

    public func constructor(for cName: String, env: napi_env) throws -> napi_value? {
        try constructors[cName]?.value(env: env)
    }

    public static func data(for env: napi_env) throws -> InstanceData {
        var dataPointer: UnsafeMutableRawPointer?
        try check(napi_get_instance_data(env, &dataPointer))
        if let pointer = dataPointer {
            return Unmanaged<InstanceData>.fromOpaque(pointer).takeUnretainedValue()
        }
        let data = InstanceData()
        let finalizer: napi_finalize = { env, data, _ in
            guard let data = data else { return }
            Unmanaged<InstanceData>.fromOpaque(data).release()
        }
        try check(napi_set_instance_data(env, Unmanaged.passRetained(data).toOpaque(), finalizer, nil))
        return data
    }

    // deinit {
    //     print("InstanceData.deinit")
    // }
}
