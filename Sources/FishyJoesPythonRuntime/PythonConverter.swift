@_exported import FishyJoesCommonRuntime
import Foundation

// MARK: - Python Type Conversion Protocols

public protocol PythonConverter: Converter {
    associatedtype CType = PyObjectPtr

    static func peekPython(_ value: CType, env: Env) throws -> SwiftType
    static func peekPython(object: PyObjectPtr, env: Env) throws -> SwiftType

    static func consumePython(_ value: CType, env: Env) throws -> SwiftType
    static func consumePython(object: PyObjectPtr, env: Env) throws -> SwiftType

    static func toPython(_ value: SwiftType, env: Env) throws -> CType
    static func toPythonObject(_ value: SwiftType, env: Env) throws -> PyObjectPtr
}

extension PythonConverter {
    public static func consumePython(_ value: CType, env: Env) throws -> SwiftType where CType == PyObjectPtr {
        defer { env.deleteRef(value) }
        return try peekPython(value, env: env)
    }

    @_disfavoredOverload
    public static func consumePython(_ value: CType, env: Env) throws -> SwiftType {
        defer { if let value = value as? PyObjectPtr { env.deleteRef(value) } }
        return try peekPython(value, env: env)
    }

    public static func consumePython(object: PyObjectPtr, env: Env) throws -> SwiftType {
        defer { env.deleteRef(object) }
        return try peekPython(object: object, env: env)
    }
}

extension PythonConverter where CType == PyObjectPtr {
    public static func toPythonObject(_ value: SwiftType, env: Env) throws -> PyObjectPtr {
        try toPython(value, env: env)
    }
    public static func peekPython(object: PyObjectPtr, env: Env) throws -> SwiftType {
        try peekPython(object, env: env)
    }
}

public protocol PythonMutator: PythonConverter {
    static func mutatePython(_ this: CType, to value: SwiftType, env: Env) throws
}

extension PythonMutator {
    public static func withMutatingPython<R>(_ this: CType, env: Env, body: (inout SwiftType) throws -> R) throws -> R {
        var swiftThis = try peekPython(this, env: env)
        let result = try body(&swiftThis)
        try mutatePython(this, to: swiftThis, env: env)
        return result
    }
}

public protocol PythonReferenceMutator: PythonMutator where CType == PyObjectPtr {}

extension PythonReferenceMutator {
    public static func mutatePython(_ this: PyObjectPtr, to value: SwiftType, env: Env) throws {
        try Box<SwiftType>.peekPython(this, env: env).value = value
    }
}

// MARK: - Primitive Type Conversions

extension VoidConverter: PythonConverter {
    public typealias CType = Void

    public static func peekPython(_ value: Void, env: Env) throws {}
    public static func toPython(_ value: Void, env: Env) throws {}

    public static func peekPython(object: PyObjectPtr, env: Env) throws {}
    public static func toPythonObject(_ value: Void, env: Env) throws -> PyObjectPtr { nil }
}

extension Bool: PythonConverter {
    public typealias CType = UInt8

    public typealias ValueMethod = @convention(c) (PyObjectPtr, PyOutExn) -> CType

    static var pythonTrue = Env.CallbackMap<PyObjectPtr>()
    static var pythonFalse = Env.CallbackMap<PyObjectPtr>()
    static var valueMethod = Env.CallbackMap<ValueMethod>()

    public static func peekPython(_ value: CType, env: Env) throws -> Self {
        value != 0
    }

    public static func peekPython(object: PyObjectPtr, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) } != 0
    }

    public static func toPython(_ value: Self, env: Env) throws -> CType {
        value ? 1 : 0
    }

    public static func toPythonObject(_ value: Self, env: Env) throws -> PyObjectPtr {
        env.newRef(value ? Self.pythonTrue[env] : Self.pythonFalse[env])
    }
}

@_cdecl("Swift_Bool_python_setup")
public func Bool_python_setup(
    envRef: EnvRef,
    pythonTrue: PyObjectPtr,
    pythonFalse: PyObjectPtr,
    valueMethod: @escaping Bool.ValueMethod
) {
    let env = Env(envRef)
    if Bool.pythonTrue.isInitialized(env) { return }
    Bool.pythonTrue[env] = env.newRef(pythonTrue)
    Bool.pythonFalse[env] = env.newRef(pythonFalse)
    Bool.valueMethod[env] = valueMethod
}

extension Int: PythonConverter {
    public typealias ValueMethod = @convention(c) (PyObjectPtr, PyOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> PyObjectPtr
    
    public static func peekPython(_ value: Self, env: Env) throws -> Self { value }
    public static func toPython(_ value: Self, env: Env) throws -> Self { value }

    public static func peekPython(object: PyObjectPtr, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    
    public static func toPythonObject(_ value: Self, env: Env) throws -> PyObjectPtr {
        constructor[env](value)
    }
    
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Int_python_setup")
public func Int_python_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int.ValueMethod,
    constructor: @escaping Int.Constructor
) {
    let env = Env(envRef)
    if Int.valueMethod.isInitialized(env) { return }
    Int.valueMethod[env] = valueMethod
    Int.constructor[env] = constructor
}

extension Int64: PythonConverter {
    public typealias ValueMethod = @convention(c) (PyObjectPtr, PyOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> PyObjectPtr
    
    public static func peekPython(_ value: Self, env: Env) throws -> Self { value }
    public static func toPython(_ value: Self, env: Env) throws -> Self { value }

    public static func peekPython(object: PyObjectPtr, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    
    public static func toPythonObject(_ value: Self, env: Env) throws -> PyObjectPtr {
        constructor[env](value)
    }
    
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Int64_python_setup")
public func Int64_python_setup(
    envRef: EnvRef,
    valueMethod: @escaping Int64.ValueMethod,
    constructor: @escaping Int64.Constructor
) {
    let env = Env(envRef)
    if Int64.valueMethod.isInitialized(env) { return }
    Int64.valueMethod[env] = valueMethod
    Int64.constructor[env] = constructor
}

extension UInt64: PythonConverter {
    public typealias ValueMethod = @convention(c) (PyObjectPtr, PyOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> PyObjectPtr
    
    public static func peekPython(_ value: Self, env: Env) throws -> Self { value }
    public static func toPython(_ value: Self, env: Env) throws -> Self { value }

    public static func peekPython(object: PyObjectPtr, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    
    public static func toPythonObject(_ value: Self, env: Env) throws -> PyObjectPtr {
        constructor[env](value)
    }
    
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_UInt64_python_setup")
public func UInt64_python_setup(
    envRef: EnvRef,
    valueMethod: @escaping UInt64.ValueMethod,
    constructor: @escaping UInt64.Constructor
) {
    let env = Env(envRef)
    if UInt64.valueMethod.isInitialized(env) { return }
    UInt64.valueMethod[env] = valueMethod
    UInt64.constructor[env] = constructor
}

extension Float: PythonConverter {
    public typealias ValueMethod = @convention(c) (PyObjectPtr, PyOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> PyObjectPtr
    
    public static func peekPython(_ value: Self, env: Env) throws -> Self { value }
    public static func toPython(_ value: Self, env: Env) throws -> Self { value }

    public static func peekPython(object: PyObjectPtr, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    
    public static func toPythonObject(_ value: Self, env: Env) throws -> PyObjectPtr {
        constructor[env](value)
    }
    
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Float_python_setup")
public func Float_python_setup(
    envRef: EnvRef,
    valueMethod: @escaping Float.ValueMethod,
    constructor: @escaping Float.Constructor
) {
    let env = Env(envRef)
    if Float.valueMethod.isInitialized(env) { return }
    Float.valueMethod[env] = valueMethod
    Float.constructor[env] = constructor
}

extension Double: PythonConverter {
    public typealias ValueMethod = @convention(c) (PyObjectPtr, PyOutExn) -> Self
    public typealias Constructor = @convention(c) (Self) -> PyObjectPtr
    
    public static func peekPython(_ value: Self, env: Env) throws -> Self { value }
    public static func toPython(_ value: Self, env: Env) throws -> Self { value }

    public static func peekPython(object: PyObjectPtr, env: Env) throws -> Self {
        try env.check { exn in valueMethod[env](object, exn) }
    }
    
    public static func toPythonObject(_ value: Self, env: Env) throws -> PyObjectPtr {
        constructor[env](value)
    }
    
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_Double_python_setup")
public func Double_python_setup(
    envRef: EnvRef,
    valueMethod: @escaping Double.ValueMethod,
    constructor: @escaping Double.Constructor
) {
    let env = Env(envRef)
    if Double.valueMethod.isInitialized(env) { return }
    Double.valueMethod[env] = valueMethod
    Double.constructor[env] = constructor
}

extension String: PythonConverter {
    public typealias ValueMethod = @convention(c) (PyObjectPtr, PyOutExn) -> UnsafePointer<CChar>?
    public typealias Constructor = @convention(c) (UnsafePointer<CChar>) -> PyObjectPtr
    
    public static func peekPython(_ value: Self, env: Env) throws -> Self { value }
    public static func toPython(_ value: Self, env: Env) throws -> Self { value }

    public static func peekPython(object: PyObjectPtr, env: Env) throws -> Self {
        guard let cString = try env.check({ exn in valueMethod[env](object, exn) }) else {
            throw NullPointerError(message: "String value was null")
        }
        defer { free(UnsafeMutableRawPointer(mutating: cString)) }
        return String(cString: cString)
    }
    
    public static func toPythonObject(_ value: Self, env: Env) throws -> PyObjectPtr {
        value.withCString { cString in
            constructor[env](cString)
        }
    }
    
    static var valueMethod = Env.CallbackMap<ValueMethod>()
    static var constructor = Env.CallbackMap<Constructor>()
}

@_cdecl("Swift_String_python_setup")
public func String_python_setup(
    envRef: EnvRef,
    valueMethod: @escaping String.ValueMethod,
    constructor: @escaping String.Constructor
) {
    let env = Env(envRef)
    if String.valueMethod.isInitialized(env) { return }
    String.valueMethod[env] = valueMethod
    String.constructor[env] = constructor
}
