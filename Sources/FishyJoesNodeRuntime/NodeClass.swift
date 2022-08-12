import Foundation
import NodeAPI

extension napi_property_attributes {
    static func | (_ a: Self, b: Self) -> Self {
        .init(rawValue: a.rawValue | b.rawValue)
    }
    static func |= (_ lhs: inout Self, _ rhs: Self) {
        lhs = lhs | rhs
    }
}

public struct NodeClass {
    public let constructor: NodeReference

    public enum Property {
        case stored(mutable: Bool)
        case method(napi_callback)
        case accessor(getter: napi_callback, setter: napi_callback?)
    }

    public static func descriptorsFor(
        properties: [String: (Property, isStatic: Bool)],
        callbackData: UnsafeMutableRawPointer? = nil,
        env: NAPI.Env
    ) throws -> [napi_property_descriptor] {
        let undefined = try env.getUndefined()
        var nodeProperties: [napi_property_descriptor] = []

        for (name, (prop, isStatic)) in properties {
            let nodeName = try String.toNode(name, env: env)
            var attributes = isStatic ? napi_static : napi_default
            switch prop {
            case let .stored(mutable):
                attributes |= napi_enumerable
                if mutable {
                    attributes |= napi_writable
                }
                nodeProperties.append(
                    napi_property_descriptor(
                        utf8name: nil, name: nodeName.ptr,
                        method: nil, getter: nil, setter: nil, value: undefined.ptr,
                        attributes: attributes,
                        data: nil
                    )
                )
            case let .method(fun):
                nodeProperties.append(
                    napi_property_descriptor(
                        utf8name: nil, name: nodeName.ptr,
                        method: fun, getter: nil, setter: nil, value: nil,
                        attributes: attributes,
                        data: callbackData
                    )
                )
            case let .accessor(getter, setter):
                nodeProperties.append(
                    napi_property_descriptor(
                        utf8name: nil, name: nodeName.ptr,
                        method: nil, getter: getter, setter: setter, value: nil,
                        attributes: attributes,
                        data: callbackData
                    )
                )
            }
        }
        return nodeProperties
    }

    public init(
        env: NAPI.Env,
        name: String,
        superclass: NodeClass? = nil,
        callbackData: UnsafeMutableRawPointer? = nil,
        properties: [String: (Property, isStatic: Bool)],
        constructor: @escaping napi_callback
    ) throws {
        let nodeConstructor = try env.defineClass(
            name,
            constructor,
            callbackData,
            Self.descriptorsFor(properties: properties, callbackData: callbackData, env: env)
        )

        // https://github.com/nodejs/node-addon-api/issues/229#issuecomment-383583352
        if let superclass = superclass {
            let global = try env.getGlobal()
            let object = try env.getNamedProperty(global, "Object")
            let setProto = try env.getNamedProperty(object, "setPrototypeOf")

            let superConstructor = try superclass.constructor.value(env: env)

            let constructorProto = try env.getNamedProperty(nodeConstructor, "prototype")
            let superConstructorProto = try env.getNamedProperty(superConstructor, "prototype")

            _ = try env.callFunction(global, setProto, [constructorProto, superConstructorProto])
            _ = try env.callFunction(global, setProto, [nodeConstructor, superConstructor])
        }

        self.constructor = try NodeReference(env: env, value: nodeConstructor)
        try InstanceData.data(for: env).constructors[name] = self.constructor
    }
}
