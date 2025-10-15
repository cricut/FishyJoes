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
    public static var registeredConstructors: [String: [String: NodeReference]] = [:]

    public static func constructor(for nodeName: String, module: String, env: NAPI.Env) throws -> NAPI.Value {
        guard let constructor = try Self.registeredConstructors[module]?[nodeName]?.value(env: env) else {
            throw JSException(message: "Internal error, couldn't locate constructor for `\(nodeName)` in module `\(module)`")
        }
        return constructor
    }

    public let constructor: NodeReference

    public enum Property {
        case stored(mutable: Bool)
        case method(napi_callback)
        case accessor(getter: napi_callback, setter: napi_callback?)
    }

    public static func descriptorsFor(
        properties: [(name: String, Property, isStatic: Bool)],
        callbackData: UnsafeMutableRawPointer? = nil,
        env: NAPI.Env
    ) throws -> [napi_property_descriptor] {
        let undefined = try env.getUndefined()
        var nodeProperties: [napi_property_descriptor] = []

        for (name, prop, isStatic) in properties {
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
        module: String,
        name: String,
        superclass: NodeClass? = nil,
        callbackData: UnsafeMutableRawPointer? = nil,
        properties: [(name: String, Property, isStatic: Bool)],
        constructor: @escaping napi_callback
    ) throws {
        if let existingConstructor = Self.registeredConstructors[module]?[name] {
            // TODO: I don't really like this solution. Some other method should ensure this isn't called more than once like we do in other languages
            self.constructor = existingConstructor
            return
        }

        let duplicateCheck = Dictionary(grouping: properties, by: \.name)
        if let duplicate = duplicateCheck.values.first(where: { $0.count > 1 }) {
            fatalError("In JS class '\(name)', found duplicate property name '\(duplicate[0].name)'")
        }

        let nodeConstructor = try env.defineClassViaFunction(
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

            // existing instance member inheritance
            _ = try env.callFunction(global, setProto, [constructorProto, superConstructorProto])
            // additional static inheritance
            _ = try env.callFunction(global, setProto, [nodeConstructor, superConstructor])
        }

        self.constructor = try NodeReference(env: env, value: nodeConstructor)
        Self.registeredConstructors[module, default: [:]][name] = self.constructor
    }
}

extension NAPI.Env {
    // Inheritance doesn't work with napi_create_class: https://github.com/nodejs/node-addon-api/issues/229
    // adapted from napi_create_class in wasm_napi.js, which doesn't have this issue
    func defineClassViaFunction(
        _ name: String,
        _ constructor: @escaping NAPI.Callback,
        _ data: UnsafeMutableRawPointer?,
        _ properties: [napi_property_descriptor]
    ) throws -> NAPI.Value {
        let constructor = try createFunction(name, constructor, data)

        let global = try getGlobal()
        let object = try getNamedProperty(global, "Object")
        let defineProperty = try getNamedProperty(object, "defineProperty")
        let constructorProto = try getNamedProperty(constructor, "prototype")

        for prop in properties {
            let attributes = try createObject()
            var isStatic = false

            if (prop.attributes.rawValue & napi_writable.rawValue) != 0, prop.getter == nil, prop.setter == nil {
                try setNamedProperty(attributes, "writable", getBoolean(true))
            }
            if (prop.attributes.rawValue & napi_enumerable.rawValue) != 0 {
                try setNamedProperty(attributes, "enumerable", getBoolean(true))
            }
            if (prop.attributes.rawValue & napi_configurable.rawValue) != 0 {
                try setNamedProperty(attributes, "configurable", getBoolean(true))
            }
            if (prop.attributes.rawValue & napi_static.rawValue) != 0 {
                try setNamedProperty(attributes, "static", getBoolean(true))
                isStatic = true
            }

            let target = isStatic ? constructor : constructorProto
            let nameValue = NAPI.Value(ptr: prop.name)
            let name = try String.fromNode(nameValue, env: self)

            if prop.getter != nil || prop.setter != nil {
                if let getter = prop.getter {
                    try setNamedProperty(attributes, "get", createFunction("[\(name) getter]", getter, prop.data))
                }
                if let setter = prop.setter {
                    try setNamedProperty(attributes, "set", createFunction("[\(name) setter]", setter, prop.data))
                }
            } else if let method = prop.method {
                try setNamedProperty(attributes, "value", createFunction(name, method, prop.data))
            } else {
                try setNamedProperty(attributes, "value", .init(ptr: prop.value))
            }

            _ = try callFunction(global, defineProperty, [target, nameValue, attributes])
        }
        return constructor
    }
}
