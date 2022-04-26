import Foundation

public class InstanceData {
    public var constructors: [String: NodeReference] = [:]

    private init() {
    }

    public func constructor(for cName: String, env: NAPI.Env) throws -> NAPI.Value {
        guard let constructor = try constructors[cName]?.value(env: env) else {
            throw JSException(message: "Internal error, couldn't locate constructor for `\(cName)`")
        }
        return constructor
    }

    public static func data(for env: NAPI.Env) throws -> InstanceData {
        if let pointer = try env.getInstanceData() {
            return Unmanaged<InstanceData>.fromOpaque(pointer).takeUnretainedValue()
        }
        let data = InstanceData()
        let finalizer: NAPI.Finalize = { _, data, _ in
            guard let data = data else { return }
            Unmanaged<InstanceData>.fromOpaque(data).release()
        }
        try env.setInstanceData(Unmanaged.passRetained(data).toOpaque(), finalizer, nil)
        return data
    }

    // deinit {
    //     print("InstanceData.deinit")
    // }
}
