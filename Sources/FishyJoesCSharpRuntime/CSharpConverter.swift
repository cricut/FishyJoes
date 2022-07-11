@_exported import FishyJoesCommonRuntime
import Foundation

// MARK: - CSharp Type Conversion Protocols

public protocol CSharpConverter: Converter {
    associatedtype CType = csObject

    static func fromCSharp(_ value: CType) throws -> SwiftType
    static func fromCSharp(object: csObject) throws -> SwiftType

    static func toCSharp(_ value: SwiftType) throws -> CType
    static func toCSharpObject(_ value: SwiftType) throws -> csObject
}

private protocol PrimitiveCSharpConverter: CSharpConverter where SwiftType == Self, CType == Self {
    typealias ValueMethod = (csObject, csOutExn) -> Self
    typealias ConstructorMethod = (Self, csOutExn) -> csObject

    static var valueMethod: ValueMethod! { get }
    static var constructorMethod: ConstructorMethod! { get }
}

extension PrimitiveCSharpConverter {
    public static func fromCSharp(_ value: Self) throws -> Self { value }
    public static func toCSharp(_ value: Self) throws -> Self { value }

    public static func fromCSharp(object: csObject) throws -> Self {
        try Env.check { exn in valueMethod(object, exn) }
    }
    public static func toCSharpObject(_ value: Self) throws -> csObject {
        try Env.check { exn in constructorMethod(value, exn) }
    }
}

extension CSharpConverter where CType == csObject {
    public static func toCSharpObject(_ value: SwiftType) throws -> csObject {
        try toCSharp(value)
    }
    public static func fromCSharp(object: csObject) throws -> SwiftType {
        try fromCSharp(object)
    }
}

public protocol CSharpMutator: CSharpConverter {
    static func mutateCSharp<R>(_ this: CType, body: (inout SwiftType) throws -> R) throws -> R
}

// MARK: - Primitive Type Conversions

extension VoidConverter: CSharpConverter {
    public typealias CType = Void

    public static func fromCSharp(_ value: Void) throws {}
    public static func toCSharp(_ value: Void) throws {}

    public static func fromCSharp(object: csObject) throws {}
    public static func toCSharpObject(_ value: Void) throws -> csObject { nil }
}

extension Bool: CSharpConverter {
    public typealias CType = UInt8

    typealias ValueMethod = @convention(c) (csObject, csOutExn) -> CType

    fileprivate static var cSharpTrue: csObject = nil
    fileprivate static var cSharpFalse: csObject = nil
    fileprivate static var valueMethod: ValueMethod!

    public static func fromCSharp(_ value: CType) throws -> Self {
        value != 0
    }

    public static func fromCSharp(object: csObject) throws -> Self {
        try Env.check { exn in valueMethod(object, exn) } != 0
    }

    public static func toCSharp(_ value: Self) throws -> CType {
        value ? 1 : 0
    }

    public static func toCSharpObject(_ value: Self) throws -> csObject {
        value ? Self.cSharpTrue : Self.cSharpFalse
    }
}

@_cdecl("FJRuntimeBoolSetup")
func Bool_cSharpSetup(
    cSharpTrue: csObject,
    cSharpFalse: csObject,
    valueMethod: @escaping Bool.ValueMethod,
    _ exn: csOutExn
) {
    guard Bool.cSharpTrue == nil else { return }
    Env.catching(to: exn) {
        Bool.cSharpTrue = Env.newRef(cSharpTrue)
        Bool.cSharpFalse = Env.newRef(cSharpFalse)
        Bool.valueMethod = valueMethod
    }
}

extension Int8: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeInt8Setup")
private func Int8_cSharpSetup(
    valueMethod: @escaping Int8.ValueMethod,
    constructorMethod: @escaping Int8.ConstructorMethod,
    _ exn: csOutExn
) {
    guard Int8.valueMethod == nil else { return }
    Env.catching(to: exn) {
        Int8.valueMethod = valueMethod
        Int8.constructorMethod = constructorMethod
    }
}

extension Int16: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeInt16Setup")
private func Int16_cSharpSetup(
    valueMethod: @escaping Int16.ValueMethod,
    constructorMethod: @escaping Int16.ConstructorMethod,
    _ exn: csOutExn
) {
    guard Int16.valueMethod == nil else { return }
    Env.catching(to: exn) {
        Int16.valueMethod = valueMethod
        Int16.constructorMethod = constructorMethod
    }
}

extension Int32: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeInt32Setup")
private func Int32_cSharpSetup(
    valueMethod: @escaping Int32.ValueMethod,
    constructorMethod: @escaping Int32.ConstructorMethod,
    _ exn: csOutExn
) {
    guard Int32.valueMethod == nil else { return }
    Env.catching(to: exn) {
        Int32.valueMethod = valueMethod
        Int32.constructorMethod = constructorMethod
    }
}

extension Int64: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeInt64Setup")
private func Int64_cSharpSetup(
    valueMethod: @escaping Int64.ValueMethod,
    constructorMethod: @escaping Int64.ConstructorMethod,
    _ exn: csOutExn
) {
    guard Int64.valueMethod == nil else { return }
    Env.catching(to: exn) {
        Int64.valueMethod = valueMethod
        Int64.constructorMethod = constructorMethod
    }
}

extension UInt8: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeUInt8Setup")
private func UInt8_cSharpSetup(
    valueMethod: @escaping UInt8.ValueMethod,
    constructorMethod: @escaping UInt8.ConstructorMethod,
    _ exn: csOutExn
) {
    guard UInt8.valueMethod == nil else { return }
    Env.catching(to: exn) {
        UInt8.valueMethod = valueMethod
        UInt8.constructorMethod = constructorMethod
    }
}

extension UInt16: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeUInt16Setup")
private func UInt16_cSharpSetup(
    valueMethod: @escaping UInt16.ValueMethod,
    constructorMethod: @escaping UInt16.ConstructorMethod,
    _ exn: csOutExn
) {
    guard UInt16.valueMethod == nil else { return }
    Env.catching(to: exn) {
        UInt16.valueMethod = valueMethod
        UInt16.constructorMethod = constructorMethod
    }
}

extension UInt32: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeUInt32Setup")
private func UInt32_cSharpSetup(
    valueMethod: @escaping UInt32.ValueMethod,
    constructorMethod: @escaping UInt32.ConstructorMethod,
    _ exn: csOutExn
) {
    guard UInt32.valueMethod == nil else { return }
    Env.catching(to: exn) {
        UInt32.valueMethod = valueMethod
        UInt32.constructorMethod = constructorMethod
    }
}

extension UInt64: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeUInt64Setup")
private func UInt64_cSharpSetup(
    valueMethod: @escaping UInt64.ValueMethod,
    constructorMethod: @escaping UInt64.ConstructorMethod,
    _ exn: csOutExn
) {
    guard UInt64.valueMethod == nil else { return }
    Env.catching(to: exn) {
        UInt64.valueMethod = valueMethod
        UInt64.constructorMethod = constructorMethod
    }
}

extension Int: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeIntSetup")
private func Int_cSharpSetup(
    valueMethod: @escaping Int.ValueMethod,
    constructorMethod: @escaping Int.ConstructorMethod,
    _ exn: csOutExn
) {
    guard Int.valueMethod == nil else { return }
    Env.catching(to: exn) {
        Int.valueMethod = valueMethod
        Int.constructorMethod = constructorMethod
    }
}

extension Float: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeFloatSetup")
private func Float_cSharpSetup(
    valueMethod: @escaping Float.ValueMethod,
    constructorMethod: @escaping Float.ConstructorMethod,
    _ exn: csOutExn
) {
    guard Float.valueMethod == nil else { return }
    Env.catching(to: exn) {
        Float.valueMethod = valueMethod
        Float.constructorMethod = constructorMethod
    }
}

extension Double: PrimitiveCSharpConverter {
    fileprivate static var valueMethod: ValueMethod!
    fileprivate static var constructorMethod: ConstructorMethod!
}

@_cdecl("FJRuntimeDoubleSetup")
private func Double_cSharpSetup(
    valueMethod: @escaping Double.ValueMethod,
    constructorMethod: @escaping Double.ConstructorMethod,
    _ exn: csOutExn
) {
    guard Double.valueMethod == nil else { return }
    Env.catching(to: exn) {
        Double.valueMethod = valueMethod
        Double.constructorMethod = constructorMethod
    }
}

// MARK: - Less-Primitive Type Conversions

private var String_getLength: ((csObject) -> UInt)!

extension String: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> Self {
        fatalError("TODO")
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        fatalError("TODO")
    }
}

extension Data: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> Self {
        fatalError("TODO")
        // let length = env.GetArrayLength(value)
        // let result = try env.GetByteArrayElements(value)
        // defer {
        //     if let value = value, let elements = result.0 {
        //         env.ReleaseByteArrayElements(value, elements, JNI_ABORT)
        //     }
        // }
        // guard let elements = result.0 else {
        //     throw JNIError(message: "memory allocation failed")
        // }
        // return Data(bytes: elements, count: Int(length))
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        fatalError("TODO")
        // let length = jsize(value.count)
        // guard length > 0 else {
        //     return nil
        // }
        // guard let byteArray = try env.NewByteArray(length) else {
        //     throw JNIError(message: "memory allocation failed")
        // }
        // try value.withUnsafeBytes { pointer in
        //     guard let bytes = pointer.baseAddress?.assumingMemoryBound(to: jbyte.self) else {
        //         throw JNIError(message: "memory access failed")
        //     }
        //     try env.SetByteArrayRegion(byteArray, 0, length, bytes)
        // }
        // return byteArray
    }
}

// MARK: - Generics Type Conversions

// private enum CSharpIterator {
//     static var iteratorClass: csObject
//     static var nextMethodID: jmethodID?
//     static var hasNextMethodID: jmethodID?

//     public static func cSharpSetup() throws {
//         guard iteratorClass == nil else { return }
//         iteratorClass = try env.globalRef(env.FindClass("cSharp/util/Iterator"))
//         hasNextMethodID = try env.GetMethodID(iteratorClass, "hasNext", "()Z")
//         nextMethodID = try env.GetMethodID(iteratorClass, "next", "()LcSharp/lang/Object;")
//     }
// }

// private enum CSharpList {
//     static var listClass: csObject
//     static var arrayListClass: csObject
//     static var iteratorMethodID: jmethodID?
//     static var initMethodID: jmethodID?
//     static var addMethodID: jmethodID?

//     public static func cSharpSetup() throws {
//         guard listClass == nil else { return }

//         try CSharpIterator.cSharpSetup()

//         listClass = try env.globalRef(env.FindClass("cSharp/util/List"))
//         iteratorMethodID = try env.GetMethodID(listClass, "iterator", "()LcSharp/util/Iterator;")

//         arrayListClass = try env.globalRef(env.FindClass("cSharp/util/ArrayList"))
//         initMethodID = try env.GetMethodID(arrayListClass, "<init>", "(I)V")
//         addMethodID = try env.GetMethodID(arrayListClass, "add", "(LcSharp/lang/Object;)Z")
//     }

//     public static func forEach(_ listObject: csObject, body: (csObject) throws -> Void) throws {
//         let iter = try env.CallObjectMethod(listObject, iteratorMethodID)
//         while try env.CallBooleanMethod(iter, CSharpIterator.hasNextMethodID) != JNI_FALSE {
//             let item = try env.CallObjectMethod(iter, CSharpIterator.nextMethodID)
//             try body(item)
//             env.DeleteLocalRef(item)
//         }
//         env.DeleteLocalRef(iter)
//     }
// }

// private enum CSharpMap {
//     static var mapClass: csObject
//     static var hashMapClass: csObject
//     static var entrySetMethodID: jmethodID?
//     static var getKeyMethodID: jmethodID?
//     static var getValueMethodID: jmethodID?
//     static var initMethodID: jmethodID?
//     static var putMethodID: jmethodID?

//     public static func cSharpSetup() throws {
//         guard mapClass == nil else { return }

//         mapClass = try env.globalRef(env.FindClass("cSharp/util/Map"))
//         entrySetMethodID = try env.GetMethodID(mapClass, "entrySet", "()LcSharp/util/Set;")

//         let entryClass = try env.FindClass("cSharp/util/Map$Entry")
//         getKeyMethodID = try env.GetMethodID(entryClass, "getKey", "()LcSharp/lang/Object;")
//         getValueMethodID = try env.GetMethodID(entryClass, "getValue", "()LcSharp/lang/Object;")

//         hashMapClass = try env.globalRef(env.FindClass("cSharp/util/HashMap"))
//         initMethodID = try env.GetMethodID(hashMapClass, "<init>", "(I)V")
//         putMethodID = try env.GetMethodID(hashMapClass, "put", "(LcSharp/lang/Object;LcSharp/lang/Object;)LcSharp/lang/Object;")

//         env.DeleteLocalRef(entryClass)
//     }
// }

// private enum CSharpSet {
//     static var setClass: csObject
//     static var hashSetClass: csObject
//     static var iteratorMethodID: jmethodID?
//     static var initMethodID: jmethodID?
//     static var addMethodID: jmethodID?

//     public static func cSharpSetup() throws {
//         guard setClass == nil else { return }

//         try CSharpIterator.cSharpSetup()

//         setClass = try env.globalRef(env.FindClass("cSharp/util/Set"))
//         iteratorMethodID = try env.GetMethodID(setClass, "iterator", "()LcSharp/util/Iterator;")

//         hashSetClass = try env.globalRef(env.FindClass("cSharp/util/HashSet"))
//         initMethodID = try env.GetMethodID(hashSetClass, "<init>", "(I)V")
//         addMethodID = try env.GetMethodID(hashSetClass, "add", "(LcSharp/lang/Object;)Z")
//     }

//     public static func forEach(_ setObject: csObject, body: (csObject) throws -> Void) throws {
//         let iter = try env.CallObjectMethod(setObject, iteratorMethodID)
//         while try env.CallBooleanMethod(iter, CSharpIterator.hasNextMethodID) != JNI_FALSE {
//             let item = try env.CallObjectMethod(iter, CSharpIterator.nextMethodID)
//             try body(item)
//             env.DeleteLocalRef(item)
//         }
//         env.DeleteLocalRef(iter)
//     }
// }

extension ArrayConverter: CSharpConverter where ElementConverter: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        fatalError("TODO")
        // var result = SwiftType()
        // try CSharpList.forEach(value) { item in
        //     result.append(try ElementConverter.fromCSharp(object: item))
        // }
        // return result
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        fatalError("TODO")
        // let array = try env.NewObject(CSharpList.arrayListClass, CSharpList.initMethodID, jvalue(i: jint(value.count)))
        // for element in value {
        //     let cSharpElement = try ElementConverter.toCSharpObject(element)
        //     _ = try env.CallBooleanMethod(array, CSharpList.addMethodID, jvalue(l: cSharpElement))
        //     env.DeleteLocalRef(cSharpElement)
        // }
        // return array
    }
}

extension DictionaryConverter: CSharpConverter where KeyConverter: CSharpConverter, KeyConverter.SwiftType: Hashable, ValueConverter: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        fatalError("TODO")
        // let entries = try env.CallObjectMethod(value, CSharpMap.entrySetMethodID)
        // var result = SwiftType()
        // try CSharpSet.forEach(entries) { entry in
        //     let key = try env.CallObjectMethod(entry, CSharpMap.getKeyMethodID)
        //     let value = try env.CallObjectMethod(entry, CSharpMap.getValueMethodID)
        //     result[try KeyConverter.fromCSharp(object: key)] = try ValueConverter.fromCSharp(object: value)
        //     env.DeleteLocalRef(key)
        //     env.DeleteLocalRef(value)
        // }
        // return result
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        fatalError("TODO")
        // let hashMap = try env.NewObject(CSharpMap.hashMapClass, CSharpMap.initMethodID, jvalue(i: jint(value.count)))
        // for (key, value) in value {
        //     let cSharpKey = try KeyConverter.toCSharpObject(key)
        //     let cSharpValue = try ValueConverter.toCSharpObject(value)
        //     let prevValue = try env.CallObjectMethod(hashMap, CSharpMap.putMethodID, jvalue(l: cSharpKey), jvalue(l: cSharpValue))
        //     env.DeleteLocalRef(cSharpKey)
        //     env.DeleteLocalRef(cSharpValue)
        //     env.DeleteLocalRef(prevValue)
        // }
        // return hashMap
    }
}

extension SetConverter: CSharpConverter where ElementConverter: CSharpConverter, ElementConverter.SwiftType: Hashable {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        fatalError("TODO")
        // var result = SwiftType()
        // try CSharpSet.forEach(value) { _ in
        //     result.insert(try ElementConverter.fromCSharp(object: value))
        // }
        // return result
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        fatalError("TODO")
        // let hashSet = try env.NewObject(CSharpSet.hashSetClass, CSharpSet.initMethodID, jvalue(i: jint(value.count)))
        // for element in value {
        //     let cSharpElement = try ElementConverter.toCSharpObject(element)
        //     _ = try env.CallBooleanMethod(hashSet, CSharpSet.addMethodID, jvalue(l: cSharpElement))
        //     env.DeleteLocalRef(cSharpElement)
        // }
        // return hashSet
    }
}

// MARK: - Optional Type Conversion

extension OptionalConverter: CSharpConverter where WrappedConverter: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        fatalError("TODO")
        // if value == nil {
        //     return nil
        // } else {
        //     return try WrappedConverter.fromCSharp(object: value)
        // }
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        fatalError("TODO")
        // if let wrapped = value {
        //     return try WrappedConverter.toCSharpObject(wrapped)
        // } else {
        //     return nil
        // }
    }
}

// MARK: - Tuple Type Conversions

// private var pairClass: csObject
// private var pairConstructor: jmethodID!
// private var pairFirstMethod: jmethodID!
// private var pairSecondMethod: jmethodID!

extension Tuple2Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        fatalError("TODO")
        // let v0 = try env.CallObjectMethod(value, pairFirstMethod)
        // let v1 = try env.CallObjectMethod(value, pairSecondMethod)
        // return (
        //     try T0.fromCSharp(object: v0),
        //     try T1.fromCSharp(object: v1)
        // )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        fatalError("TODO")
        // let v0 = try jvalue(l: T0.toCSharpObject(value.0))
        // let v1 = try jvalue(l: T1.toCSharpObject(value.1))
        // let result = try env.NewObject(pairClass, pairConstructor, v0, v1)
        // env.DeleteLocalRef(v0.l)
        // env.DeleteLocalRef(v1.l)
        // return result
    }
}

// private var tripleClass: csObject
// private var tripleConstructor: jmethodID!
// private var tripleFirstMethod: jmethodID!
// private var tripleSecondMethod: jmethodID!
// private var tripleThirdMethod: jmethodID!

extension Tuple3Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        fatalError("TODO")
        // let v0 = try env.CallObjectMethod(value, tripleFirstMethod)
        // let v1 = try env.CallObjectMethod(value, tripleSecondMethod)
        // let v2 = try env.CallObjectMethod(value, tripleThirdMethod)
        // return (
        //     try T0.fromCSharp(object: v0),
        //     try T1.fromCSharp(object: v1),
        //     try T2.fromCSharp(object: v2)
        // )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        fatalError("TODO")
        // let v0 = try jvalue(l: T0.toCSharpObject(value.0))
        // let v1 = try jvalue(l: T1.toCSharpObject(value.1))
        // let v2 = try jvalue(l: T2.toCSharpObject(value.2))
        // let result = try env.NewObject(tripleClass, tripleConstructor, v0, v1, v2)
        // env.DeleteLocalRef(v0.l)
        // env.DeleteLocalRef(v1.l)
        // env.DeleteLocalRef(v2.l)
        // return result
    }
}

// private var tuple4Class: csObject
// private var tuple4Constructor: jmethodID!
// private var tuple4FirstMethod: jmethodID!
// private var tuple4SecondMethod: jmethodID!
// private var tuple4ThirdMethod: jmethodID!
// private var tuple4FourthMethod: jmethodID!

extension Tuple4Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter, T3: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        fatalError("TODO")
        // let v0 = try env.CallObjectMethod(value, tuple4FirstMethod)
        // let v1 = try env.CallObjectMethod(value, tuple4SecondMethod)
        // let v2 = try env.CallObjectMethod(value, tuple4ThirdMethod)
        // let v3 = try env.CallObjectMethod(value, tuple4FourthMethod)
        // return (
        //     try T0.fromCSharp(object: v0),
        //     try T1.fromCSharp(object: v1),
        //     try T2.fromCSharp(object: v2),
        //     try T3.fromCSharp(object: v3)
        // )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        fatalError("TODO")
        // let v0 = try jvalue(l: T0.toCSharpObject(value.0))
        // let v1 = try jvalue(l: T1.toCSharpObject(value.1))
        // let v2 = try jvalue(l: T2.toCSharpObject(value.2))
        // let v3 = try jvalue(l: T3.toCSharpObject(value.3))
        // let result = try env.NewObject(tuple4Class, tuple4Constructor, v0, v1, v2, v3)
        // env.DeleteLocalRef(v0.l)
        // env.DeleteLocalRef(v1.l)
        // env.DeleteLocalRef(v2.l)
        // env.DeleteLocalRef(v3.l)
        // return result
    }
}

// private var tuple5Class: csObject
// private var tuple5Constructor: jmethodID!
// private var tuple5FirstMethod: jmethodID!
// private var tuple5SecondMethod: jmethodID!
// private var tuple5ThirdMethod: jmethodID!
// private var tuple5FourthMethod: jmethodID!
// private var tuple5FifthMethod: jmethodID!

extension Tuple5Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter, T3: CSharpConverter, T4: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        fatalError("TODO")
        // let v0 = try env.CallObjectMethod(value, tuple5FirstMethod)
        // let v1 = try env.CallObjectMethod(value, tuple5SecondMethod)
        // let v2 = try env.CallObjectMethod(value, tuple5ThirdMethod)
        // let v3 = try env.CallObjectMethod(value, tuple5FourthMethod)
        // let v4 = try env.CallObjectMethod(value, tuple5FifthMethod)
        // return (
        //     try T0.fromCSharp(object: v0),
        //     try T1.fromCSharp(object: v1),
        //     try T2.fromCSharp(object: v2),
        //     try T3.fromCSharp(object: v3),
        //     try T4.fromCSharp(object: v4)
        // )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        fatalError("TODO")
        // let v0 = try jvalue(l: T0.toCSharpObject(value.0))
        // let v1 = try jvalue(l: T1.toCSharpObject(value.1))
        // let v2 = try jvalue(l: T2.toCSharpObject(value.2))
        // let v3 = try jvalue(l: T3.toCSharpObject(value.3))
        // let v4 = try jvalue(l: T4.toCSharpObject(value.4))
        // let result = try env.NewObject(tuple5Class, tuple5Constructor, v0, v1, v2, v3, v4)
        // env.DeleteLocalRef(v0.l)
        // env.DeleteLocalRef(v1.l)
        // env.DeleteLocalRef(v2.l)
        // env.DeleteLocalRef(v3.l)
        // env.DeleteLocalRef(v4.l)
        // return result
    }
}

// private var tuple6Class: csObject
// private var tuple6Constructor: jmethodID!
// private var tuple6FirstMethod: jmethodID!
// private var tuple6SecondMethod: jmethodID!
// private var tuple6ThirdMethod: jmethodID!
// private var tuple6FourthMethod: jmethodID!
// private var tuple6FifthMethod: jmethodID!
// private var tuple6SixthMethod: jmethodID!

extension Tuple6Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter, T3: CSharpConverter, T4: CSharpConverter, T5: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> SwiftType {
        fatalError("TODO")
        // let v0 = try env.CallObjectMethod(value, tuple6FirstMethod)
        // let v1 = try env.CallObjectMethod(value, tuple6SecondMethod)
        // let v2 = try env.CallObjectMethod(value, tuple6ThirdMethod)
        // let v3 = try env.CallObjectMethod(value, tuple6FourthMethod)
        // let v4 = try env.CallObjectMethod(value, tuple6FifthMethod)
        // let v5 = try env.CallObjectMethod(value, tuple6SixthMethod)
        // return (
        //     try T0.fromCSharp(object: v0),
        //     try T1.fromCSharp(object: v1),
        //     try T2.fromCSharp(object: v2),
        //     try T3.fromCSharp(object: v3),
        //     try T4.fromCSharp(object: v4),
        //     try T5.fromCSharp(object: v5)
        // )
    }

    public static func toCSharp(_ value: SwiftType) throws -> csObject {
        fatalError("TODO")
        // let v0 = try jvalue(l: T0.toCSharpObject(value.0))
        // let v1 = try jvalue(l: T1.toCSharpObject(value.1))
        // let v2 = try jvalue(l: T2.toCSharpObject(value.2))
        // let v3 = try jvalue(l: T3.toCSharpObject(value.3))
        // let v4 = try jvalue(l: T4.toCSharpObject(value.4))
        // let v5 = try jvalue(l: T5.toCSharpObject(value.5))
        // let result = try env.NewObject(tuple6Class, tuple6Constructor, v0, v1, v2, v3, v4, v5)
        // env.DeleteLocalRef(v0.l)
        // env.DeleteLocalRef(v1.l)
        // env.DeleteLocalRef(v2.l)
        // env.DeleteLocalRef(v3.l)
        // env.DeleteLocalRef(v4.l)
        // env.DeleteLocalRef(v5.l)
        // return result
    }
}
