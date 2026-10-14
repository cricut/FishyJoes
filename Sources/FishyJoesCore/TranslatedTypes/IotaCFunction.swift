/// Represents an iota ffi function and its C signature. Used in both generation and calling
struct IotaFFIFunction {
    let name: String
    let parameters: [(name: String, type: FFIType)]
    let returnType: FFIType
    let swiftBodyWriter: (SourceFragment) -> Void
}

enum FFIType: Hashable {
    case void
    case int, int8, int16, int32, int64
    case uint, uint8, uint16, uint32, uint64
    case float, double
    case unownedHostRef, consumedHostRef, createdHostRef, outCreatedHostRef
    case unownedSwiftRef, consumedSwiftRef, createdSwiftRef
    indirect case pointer(FFIType, isConst: Bool)
    indirect case functionPointer(typeAliasName: String, args: [Parameter], returnType: FFIType)

    // This would be a tuple, but I don't want to write a Hashable conformance
    struct Parameter: Hashable {
        let name: String
        let type: FFIType
    }
}

extension FFIType {
    var cName: String {
        switch self {
        case .void: return "void"
        case .int: return "intptr_t"
        case .int8: return "int8_t"
        case .int16: return "int16_t"
        case .int32: return "int32_t"
        case .int64: return "int64_t"
        case .uint: return "uintptr_t"
        case .uint8: return "uint8_t"
        case .uint16: return "uint16_t"
        case .uint32: return "uint32_t"
        case .uint64: return "uint64_t"
        case .float: return "float"
        case .double: return "double"
        case .unownedHostRef: return "UnownedHostRef"
        case .consumedHostRef: return "ConsumedHostRef"
        case .createdHostRef: return "CreatedHostRef"
        case .outCreatedHostRef: return "OutCreatedHostRef"
        case .unownedSwiftRef: return "UnownedSwiftRef"
        case .consumedSwiftRef: return "ConsumedSwiftRef"
        case .createdSwiftRef: return "CreatedSwiftRef"
        case .pointer(let pointee, false): return "*\(pointee.cName)"
        case .pointer(let pointee, true): return "const *\(pointee.cName)"
        case .functionPointer(let typeAliasName, _, _) : return typeAliasName
        }
    }

    var swiftName: String {
        switch self {
        case .void: return "Void"
        case .int: return "Int"
        case .int8: return "Int8"
        case .int16: return "Int16"
        case .int32: return "Int32"
        case .int64: return "int64"
        case .uint: return "UInt"
        case .uint8: return "UInt8"
        case .uint16: return "UInt16"
        case .uint32: return "UInt32"
        case .uint64: return "UInt64"
        case .float: return "Float"
        case .double: return "Double"
        case .unownedHostRef: return "UnownedHostRef"
        case .consumedHostRef: return "ConsumedHostRef"
        case .createdHostRef: return "CreatedHostRef"
        case .outCreatedHostRef: return "OutCreatedHostRef"
        case .unownedSwiftRef: return "UnownedSwiftRef"
        case .consumedSwiftRef: return "ConsumedSwiftRef"
        case .createdSwiftRef: return "CreatedSwiftRef"
        case .pointer(let pointee, false): return "UnsafePointer<\(pointee.swiftName)>"
        case .pointer(let pointee, true): return "UnsafeMutablePointer<\(pointee.swiftName)>"
        case .functionPointer(let typeAliasName, _, _) : return typeAliasName
        }
    }
}

extension IotaFFIFunction {
    func writeSwiftDefinition(to fragment: SourceFragment) {
        fragment.output("@c")
        fragment.outputBlock("func \(name)(", newLineTerminated: false) {
            for param in parameters {
                fragment.output("\(param.name): \(param.type.swiftName),")
            }
        }
        if returnType != .void {
            fragment.output(" -> \(returnType.swiftName)", newLineTerminated: false)
        }
        fragment.outputBlock(" {") {
            swiftBodyWriter(fragment)
        }
    }
}
