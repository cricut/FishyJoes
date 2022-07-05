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

    typealias ValueMethod = @convention(c) (csObject, UnsafeMutablePointer<csObject>) -> CType

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
    _ exn: UnsafeMutablePointer<csObject>
) {
    guard Bool.cSharpTrue == nil else { return }
    Env.catching(to: exn) {
        Bool.cSharpTrue = try Env.pin(object: cSharpTrue)
        Bool.cSharpFalse = try Env.pin(object: cSharpFalse)
        Bool.valueMethod = valueMethod
    }
}

// extension UInt8: CSharpConverter {
//     public typealias CType = jbyte

//     public static var cSharpClass: csObject
//     private static var unsignedConverterClass: csObject
//     private static var coerceUnsigned: jmethodID!
//     private static var coerceSigned: jmethodID!

//     public static func fromCSharp(_ value: CType) throws -> Self { .init(bitPattern: value) }
//     public static func toCSharp(_ value: Self) throws -> CType { .init(bitPattern: value) }

//     public static func fromCSharp(object: csObject) throws -> Self {
//         let signed = try env.CallStaticByteMethod(unsignedConverterClass, Self.coerceUnsigned, jvalue(object))
//         return .init(bitPattern: signed)
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         let signed = CType(bitPattern: value)
//         return try env.CallStaticObjectMethod(unsignedConverterClass, Self.coerceSigned, jvalue(signed))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("kotlin/UByte"))
//         unsignedConverterClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/UnsignedIntegerConverter"))
//         coerceUnsigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceUByteToByte", "(Lkotlin/UByte;)B")
//         coerceSigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceByteToUByte", "(B)Lkotlin/UByte;")
//     }
// }

// extension UInt16: CSharpConverter {
//     public typealias CType = jshort

//     public static var cSharpClass: csObject
//     private static var unsignedConverterClass: csObject
//     private static var coerceUnsigned: jmethodID!
//     private static var coerceSigned: jmethodID!

//     public static func fromCSharp(_ value: CType) throws -> Self { .init(bitPattern: value) }
//     public static func toCSharp(_ value: Self) throws -> CType { .init(bitPattern: value) }

//     public static func fromCSharp(object: csObject) throws -> Self {
//         let signed = try env.CallStaticShortMethod(unsignedConverterClass, Self.coerceUnsigned, jvalue(object))
//         return .init(bitPattern: signed)
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         let signed = CType(bitPattern: value)
//         return try env.CallStaticObjectMethod(unsignedConverterClass, Self.coerceSigned, jvalue(signed))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("cSharp/lang/Short"))
//         unsignedConverterClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/UnsignedIntegerConverter"))
//         coerceUnsigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceUShortToShort", "(Lkotlin/UShort;)S")
//         coerceSigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceShortToUShort", "(S)Lkotlin/UShort;")
//     }
// }

// extension UInt32: CSharpConverter {
//     public typealias CType = jint

//     public static var cSharpClass: csObject
//     private static var unsignedConverterClass: csObject
//     private static var coerceUnsigned: jmethodID!
//     private static var coerceSigned: jmethodID!

//     public static func fromCSharp(_ value: CType) throws -> Self { .init(bitPattern: value) }
//     public static func toCSharp(_ value: Self) throws -> CType { .init(bitPattern: value) }

//     public static func fromCSharp(object: csObject) throws -> Self {
//         let signed = try env.CallStaticIntMethod(unsignedConverterClass, Self.coerceUnsigned, jvalue(object))
//         return .init(bitPattern: signed)
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         let signed = CType(bitPattern: value)
//         return try env.CallStaticObjectMethod(unsignedConverterClass, Self.coerceSigned, jvalue(signed))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("cSharp/lang/Integer"))
//         unsignedConverterClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/UnsignedIntegerConverter"))
//         coerceUnsigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceUIntToInt", "(Lkotlin/UInt;)I")
//         coerceSigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceIntToUInt", "(I)Lkotlin/UInt;")
//     }
// }

// extension UInt64: CSharpConverter {
//     // NOTE: CType is jlong, which is defined as Int, but is guaranteed by the JNI to be 64-bits
//     public typealias CType = jlong

//     public static var cSharpClass: csObject
//     private static var unsignedConverterClass: csObject
//     private static var coerceUnsigned: jmethodID!
//     private static var coerceSigned: jmethodID!

//     public static func fromCSharp(_ value: CType) throws -> Self { .init(bitPattern: Int64(value)) }
//     public static func toCSharp(_ value: Self) throws -> CType { CType(Int64(bitPattern: value)) }

//     public static func fromCSharp(object: csObject) throws -> Self {
//         let signed = try env.CallStaticLongMethod(unsignedConverterClass, Self.coerceUnsigned, jvalue(object))
//         return .init(bitPattern: Int64(signed))
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         let signed = Int64(bitPattern: value)
//         return try env.CallStaticObjectMethod(unsignedConverterClass, Self.coerceSigned, jvalue(CType(signed)))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("cSharp/lang/Long"))
//         unsignedConverterClass = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/UnsignedIntegerConverter"))
//         coerceUnsigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceULongToLong", "(Lkotlin/ULong;)J")
//         coerceSigned = try env.GetStaticMethodID(unsignedConverterClass, "coerceLongToULong", "(J)Lkotlin/ULong;")
//     }
// }

// extension Int8: CSharpConverter {
//     public typealias CType = jbyte

//     public static var cSharpClass: csObject
//     private static var _valueMethodID: jmethodID!
//     private static var _constructorMethodID: jmethodID!

//     public static func fromCSharp(_ value: CType) throws -> Self { value }
//     public static func toCSharp(_ value: Self) throws -> CType { value }

//     public static func fromCSharp(object: csObject) throws -> Self {
//         try env.CallByteMethod(object, Self._valueMethodID)
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         try env.NewObject(Self.cSharpClass, Self._constructorMethodID, jvalue(value))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("cSharp/lang/Byte"))
//         _valueMethodID = try env.GetMethodID(cSharpClass, "byteValue", "()B")
//         _constructorMethodID = try env.GetMethodID(cSharpClass, "<init>", "(B)V")
//     }
// }

// extension Int16: CSharpConverter {
//     public typealias CType = jshort

//     public static var cSharpClass: csObject
//     private static var _valueMethodID: jmethodID!
//     private static var _constructorMethodID: jmethodID!

//     public static func fromCSharp(_ value: CType) throws -> Self { value }
//     public static func toCSharp(_ value: Self) throws -> CType { value }

//     public static func fromCSharp(object: csObject) throws -> Self {
//         try env.CallShortMethod(object, Self._valueMethodID)
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         try env.NewObject(Self.cSharpClass, Self._constructorMethodID, jvalue(value))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("cSharp/lang/Short"))
//         _valueMethodID = try env.GetMethodID(cSharpClass, "shortValue", "()S")
//         _constructorMethodID = try env.GetMethodID(cSharpClass, "<init>", "(S)V")
//     }
// }

// extension Int32: CSharpConverter {
//     public typealias CType = jint

//     public static var cSharpClass: csObject
//     private static var _valueMethodID: jmethodID!
//     private static var _constructorMethodID: jmethodID!

//     public static func fromCSharp(_ value: CType) throws -> Self { value }
//     public static func toCSharp(_ value: Self) throws -> CType { value }

//     public static func fromCSharp(object: csObject) throws -> Self {
//         try env.CallIntMethod(object, Self._valueMethodID)
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         try env.NewObject(Self.cSharpClass, Self._constructorMethodID, jvalue(value))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("cSharp/lang/Integer"))
//         _valueMethodID = try env.GetMethodID(cSharpClass, "intValue", "()I")
//         _constructorMethodID = try env.GetMethodID(cSharpClass, "<init>", "(I)V")
//     }
// }

// extension Int64: CSharpConverter {
//     // NOTE: CType is jlong, which is defined as Int, but is guaranteed by the JNI to be 64-bits
//     public typealias CType = jlong

//     public static var cSharpClass: csObject
//     private static var _valueMethodID: jmethodID!
//     private static var _constructorMethodID: jmethodID!

//     public static func fromCSharp(_ value: CType) throws -> Self { Self(value) }
//     public static func toCSharp(_ value: Self) throws -> CType { CType(value) }

//     public static func fromCSharp(object: csObject) throws -> Self {
//         Self(try env.CallLongMethod(object, Self._valueMethodID))
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         try env.NewObject(Self.cSharpClass, Self._constructorMethodID, jvalue(CType(value)))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("cSharp/lang/Long"))
//         _valueMethodID = try env.GetMethodID(cSharpClass, "longValue", "()J")
//         _constructorMethodID = try env.GetMethodID(cSharpClass, "<init>", "(J)V")
//     }
// }

// extension Int: CSharpConverter {
//     public typealias CType = Int64.CType

//     public static var cSharpClass: csObject { Int64.cSharpClass }

//     public static func fromCSharp(_ value: Int64.CType) throws -> Self {
//         try Self(Int64.fromCSharp(value))
//     }

//     public static func toCSharp(_ value: Self) throws -> Int64.CType {
//         Int64.CType(value)
//     }

//     public static func fromCSharp(object value: csObject) throws -> Self {
//         Self(try Int64.fromCSharp(object: value))
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         try Int64.toCSharpObject(Int64(value))
//     }

//     public static func cSharpSetup() throws {
//         try Int64.cSharpSetup()
//     }
// }

// extension Float: CSharpConverter {
//     public typealias CType = jfloat

//     public static var cSharpClass: csObject
//     private static var _valueMethodID: jmethodID!
//     private static var _constructorMethodID: jmethodID!

//     public static func fromCSharp(_ value: jfloat) throws -> Self { value }
//     public static func toCSharp(_ value: Self) throws -> jfloat { value }

//     public static func fromCSharp(object: csObject) throws -> Self {
//         try env.CallFloatMethod(object, Self._valueMethodID)
//     }

//     public static func toCSharpObject(_ value: Self) throws -> csObject {
//         try env.NewObject(Self.cSharpClass, Self._constructorMethodID, jvalue(f: value))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("cSharp/lang/Float"))
//         _valueMethodID = try env.GetMethodID(cSharpClass, "floatValue", "()F")
//         _constructorMethodID = try env.GetMethodID(cSharpClass, "<init>", "(F)V")
//     }
// }

// extension Double: CSharpConverter {
//     public typealias CType = jdouble

//     public static var cSharpClass: csObject
//     private static var _valueMethodID: jmethodID!
//     private static var _constructorMethodID: jmethodID!

//     public static func fromCSharp(_ value: jdouble) throws -> Double { value }
//     public static func toCSharp(_ value: Double) throws -> jdouble { value }

//     public static func fromCSharp(object: csObject) throws -> Double {
//         try env.CallDoubleMethod(object, Self._valueMethodID)
//     }

//     public static func toCSharpObject(_ value: Double) throws -> csObject {
//         try env.NewObject(Self.cSharpClass, Self._constructorMethodID, jvalue(d: value))
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("cSharp/lang/Double"))
//         _valueMethodID = try env.GetMethodID(cSharpClass, "doubleValue", "()D")
//         _constructorMethodID = try env.GetMethodID(cSharpClass, "<init>", "(D)V")
//     }
// }

// MARK: - Less-Primitive Type Conversions

fileprivate var String_getLength: ((csObject) -> UInt)!

extension String: CSharpConverter {
    public static func fromCSharp(_ value: csObject) throws -> Self {
        fatalError("TODO")
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        fatalError("TODO")
    }
}

// extension Data: CSharpConverter {
//     public typealias CType = jbyteArray?

//     public static var cSharpClass: csObject

//     public static func fromCSharp(_ value: jbyteArray?) throws -> Self {
//         let length = env.GetArrayLength(value)
//         let result = try env.GetByteArrayElements(value)
//         defer {
//             if let value = value, let elements = result.0 {
//                 env.ReleaseByteArrayElements(value, elements, JNI_ABORT)
//             }
//         }
//         guard let elements = result.0 else {
//             throw JNIError(message: "memory allocation failed")
//         }
//         return Data(bytes: elements, count: Int(length))
//     }

//     public static func toCSharp(_ value: Self) throws -> jbyteArray? {
//         let length = jsize(value.count)
//         guard length > 0 else {
//             return nil
//         }
//         guard let byteArray = try env.NewByteArray(length) else {
//             throw JNIError(message: "memory allocation failed")
//         }
//         try value.withUnsafeBytes { pointer in
//             guard let bytes = pointer.baseAddress?.assumingMemoryBound(to: jbyte.self) else {
//                 throw JNIError(message: "memory access failed")
//             }
//             try env.SetByteArrayRegion(byteArray, 0, length, bytes)
//         }
//         return byteArray
//     }

//     public static func cSharpSetup() throws {
//         guard cSharpClass == nil else { return }
//         cSharpClass = try env.globalRef(env.FindClass("[B"))
//     }
// }

// // MARK: - Generics Type Conversions

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

// extension ArrayConverter: CSharpConverter where ElementConverter: CSharpConverter {
//     public static var cSharpClass: csObject {
//         CSharpList.listClass
//     }

//     public static func fromCSharp(_ value: csObject) throws -> SwiftType {
//         var result = SwiftType()
//         try CSharpList.forEach(value) { item in
//             result.append(try ElementConverter.fromCSharp(object: item))
//         }
//         return result
//     }

//     public static func toCSharp(_ value: SwiftType) throws -> csObject {
//         let array = try env.NewObject(CSharpList.arrayListClass, CSharpList.initMethodID, jvalue(i: jint(value.count)))
//         for element in value {
//             let cSharpElement = try ElementConverter.toCSharpObject(element)
//             _ = try env.CallBooleanMethod(array, CSharpList.addMethodID, jvalue(l: cSharpElement))
//             env.DeleteLocalRef(cSharpElement)
//         }
//         return array
//     }

//     public static func cSharpSetup() throws {
//         try CSharpList.cSharpSetup()
//         try ElementConverter.cSharpSetup()
//     }
// }

// extension DictionaryConverter: CSharpConverter where
//     KeyConverter: CSharpConverter,
//     KeyConverter.SwiftType: Hashable,
//     ValueConverter: CSharpConverter {
//     public static var cSharpClass: csObject {
//         CSharpMap.mapClass
//     }

//     public static func fromCSharp(_ value: csObject) throws -> SwiftType {
//         let entries = try env.CallObjectMethod(value, CSharpMap.entrySetMethodID)
//         var result = SwiftType()
//         try CSharpSet.forEach(entries) { entry in
//             let key = try env.CallObjectMethod(entry, CSharpMap.getKeyMethodID)
//             let value = try env.CallObjectMethod(entry, CSharpMap.getValueMethodID)
//             result[try KeyConverter.fromCSharp(object: key)] = try ValueConverter.fromCSharp(object: value)
//             env.DeleteLocalRef(key)
//             env.DeleteLocalRef(value)
//         }
//         return result
//     }

//     public static func toCSharp(_ value: SwiftType) throws -> csObject {
//         let hashMap = try env.NewObject(CSharpMap.hashMapClass, CSharpMap.initMethodID, jvalue(i: jint(value.count)))
//         for (key, value) in value {
//             let cSharpKey = try KeyConverter.toCSharpObject(key)
//             let cSharpValue = try ValueConverter.toCSharpObject(value)
//             let prevValue = try env.CallObjectMethod(hashMap, CSharpMap.putMethodID, jvalue(l: cSharpKey), jvalue(l: cSharpValue))
//             env.DeleteLocalRef(cSharpKey)
//             env.DeleteLocalRef(cSharpValue)
//             env.DeleteLocalRef(prevValue)
//         }
//         return hashMap
//     }

//     public static func cSharpSetup() throws {
//         try CSharpSet.cSharpSetup()
//         try CSharpMap.cSharpSetup()
//         try KeyConverter.cSharpSetup()
//         try ValueConverter.cSharpSetup()
//     }
// }

// extension SetConverter: CSharpConverter where ElementConverter: CSharpConverter, ElementConverter.SwiftType: Hashable {
//     public static var cSharpClass: csObject {
//         CSharpSet.setClass
//     }

//     public static func fromCSharp(_ value: csObject) throws -> SwiftType {
//         var result = SwiftType()
//         try CSharpSet.forEach(value) { _ in
//             result.insert(try ElementConverter.fromCSharp(object: value))
//         }
//         return result
//     }

//     public static func toCSharp(_ value: SwiftType) throws -> csObject {
//         let hashSet = try env.NewObject(CSharpSet.hashSetClass, CSharpSet.initMethodID, jvalue(i: jint(value.count)))
//         for element in value {
//             let cSharpElement = try ElementConverter.toCSharpObject(element)
//             _ = try env.CallBooleanMethod(hashSet, CSharpSet.addMethodID, jvalue(l: cSharpElement))
//             env.DeleteLocalRef(cSharpElement)
//         }
//         return hashSet
//     }

//     public static func cSharpSetup() throws {
//         try CSharpSet.cSharpSetup()
//         try ElementConverter.cSharpSetup()
//     }
// }

// // MARK: - Optional Type Conversion

// extension OptionalConverter: CSharpConverter where WrappedConverter: CSharpConverter {
//     public static var cSharpClass: csObject {
//         WrappedConverter.cSharpClass
//     }

//     public static func fromCSharp(_ value: csObject) throws -> SwiftType {
//         if value == nil {
//             return nil
//         } else {
//             return try WrappedConverter.fromCSharp(object: value)
//         }
//     }

//     public static func toCSharp(_ value: SwiftType) throws -> csObject {
//         if let wrapped = value {
//             return try WrappedConverter.toCSharpObject(wrapped)
//         } else {
//             return nil
//         }
//     }

//     public static func cSharpSetup() throws {
//         try WrappedConverter.cSharpSetup()
//     }
// }

// // MARK: - Tuple Type Conversions

// private var pairClass: csObject
// private var pairConstructor: jmethodID!
// private var pairFirstMethod: jmethodID!
// private var pairSecondMethod: jmethodID!

// extension Tuple2Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter {
//     public static var cSharpClass: csObject {
//         pairClass
//     }

//     public static func fromCSharp(_ value: csObject) throws -> SwiftType {
//         let v0 = try env.CallObjectMethod(value, pairFirstMethod)
//         let v1 = try env.CallObjectMethod(value, pairSecondMethod)
//         return (
//             try T0.fromCSharp(object: v0),
//             try T1.fromCSharp(object: v1)
//         )
//     }

//     public static func toCSharp(_ value: SwiftType) throws -> csObject {
//         let v0 = try jvalue(l: T0.toCSharpObject(value.0))
//         let v1 = try jvalue(l: T1.toCSharpObject(value.1))
//         let result = try env.NewObject(pairClass, pairConstructor, v0, v1)
//         env.DeleteLocalRef(v0.l)
//         env.DeleteLocalRef(v1.l)
//         return result
//     }

//     public static func cSharpSetup() throws {
//         try T0.cSharpSetup()
//         try T1.cSharpSetup()

//         guard cSharpClass == nil else { return }
//         pairClass = try env.globalRef(env.FindClass("kotlin/Pair"))
//         pairConstructor = try env.GetMethodID(cSharpClass, "<init>", "(LcSharp/lang/Object;LcSharp/lang/Object;)V")
//         pairFirstMethod = try env.GetMethodID(cSharpClass, "getFirst", "()LcSharp/lang/Object;")
//         pairSecondMethod = try env.GetMethodID(cSharpClass, "getSecond", "()LcSharp/lang/Object;")
//     }
// }

// private var tripleClass: csObject
// private var tripleConstructor: jmethodID!
// private var tripleFirstMethod: jmethodID!
// private var tripleSecondMethod: jmethodID!
// private var tripleThirdMethod: jmethodID!

// extension Tuple3Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter {
//     public static var cSharpClass: csObject {
//         tripleClass
//     }

//     public static func fromCSharp(_ value: csObject) throws -> SwiftType {
//         let v0 = try env.CallObjectMethod(value, tripleFirstMethod)
//         let v1 = try env.CallObjectMethod(value, tripleSecondMethod)
//         let v2 = try env.CallObjectMethod(value, tripleThirdMethod)
//         return (
//             try T0.fromCSharp(object: v0),
//             try T1.fromCSharp(object: v1),
//             try T2.fromCSharp(object: v2)
//         )
//     }

//     public static func toCSharp(_ value: SwiftType) throws -> csObject {
//         let v0 = try jvalue(l: T0.toCSharpObject(value.0))
//         let v1 = try jvalue(l: T1.toCSharpObject(value.1))
//         let v2 = try jvalue(l: T2.toCSharpObject(value.2))
//         let result = try env.NewObject(tripleClass, tripleConstructor, v0, v1, v2)
//         env.DeleteLocalRef(v0.l)
//         env.DeleteLocalRef(v1.l)
//         env.DeleteLocalRef(v2.l)
//         return result
//     }

//     public static func cSharpSetup() throws {
//         try T0.cSharpSetup()
//         try T1.cSharpSetup()
//         try T2.cSharpSetup()

//         guard cSharpClass == nil else { return }
//         tripleClass = try env.globalRef(env.FindClass("kotlin/Triple"))
//         tripleConstructor = try env.GetMethodID(cSharpClass, "<init>", "(LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;)V")
//         tripleFirstMethod = try env.GetMethodID(cSharpClass, "getFirst", "()LcSharp/lang/Object;")
//         tripleSecondMethod = try env.GetMethodID(cSharpClass, "getSecond", "()LcSharp/lang/Object;")
//         tripleThirdMethod = try env.GetMethodID(cSharpClass, "getThird", "()LcSharp/lang/Object;")
//     }
// }

// private var tuple4Class: csObject
// private var tuple4Constructor: jmethodID!
// private var tuple4FirstMethod: jmethodID!
// private var tuple4SecondMethod: jmethodID!
// private var tuple4ThirdMethod: jmethodID!
// private var tuple4FourthMethod: jmethodID!

// extension Tuple4Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter, T3: CSharpConverter {
//     public static var cSharpClass: csObject {
//         tuple4Class
//     }

//     public static func fromCSharp(_ value: csObject) throws -> SwiftType {
//         let v0 = try env.CallObjectMethod(value, tuple4FirstMethod)
//         let v1 = try env.CallObjectMethod(value, tuple4SecondMethod)
//         let v2 = try env.CallObjectMethod(value, tuple4ThirdMethod)
//         let v3 = try env.CallObjectMethod(value, tuple4FourthMethod)
//         return (
//             try T0.fromCSharp(object: v0),
//             try T1.fromCSharp(object: v1),
//             try T2.fromCSharp(object: v2),
//             try T3.fromCSharp(object: v3)
//         )
//     }

//     public static func toCSharp(_ value: SwiftType) throws -> csObject {
//         let v0 = try jvalue(l: T0.toCSharpObject(value.0))
//         let v1 = try jvalue(l: T1.toCSharpObject(value.1))
//         let v2 = try jvalue(l: T2.toCSharpObject(value.2))
//         let v3 = try jvalue(l: T3.toCSharpObject(value.3))
//         let result = try env.NewObject(tuple4Class, tuple4Constructor, v0, v1, v2, v3)
//         env.DeleteLocalRef(v0.l)
//         env.DeleteLocalRef(v1.l)
//         env.DeleteLocalRef(v2.l)
//         env.DeleteLocalRef(v3.l)
//         return result
//     }

//     public static func cSharpSetup() throws {
//         try T0.cSharpSetup()
//         try T1.cSharpSetup()
//         try T2.cSharpSetup()
//         try T3.cSharpSetup()

//         guard cSharpClass == nil else { return }
//         tuple4Class = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/Tuple4"))
//         tuple4Constructor = try env.GetMethodID(cSharpClass, "<init>", "(LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;)V")
//         tuple4FirstMethod = try env.GetMethodID(cSharpClass, "getFirst", "()LcSharp/lang/Object;")
//         tuple4SecondMethod = try env.GetMethodID(cSharpClass, "getSecond", "()LcSharp/lang/Object;")
//         tuple4ThirdMethod = try env.GetMethodID(cSharpClass, "getThird", "()LcSharp/lang/Object;")
//         tuple4FourthMethod = try env.GetMethodID(cSharpClass, "getFourth", "()LcSharp/lang/Object;")
//     }
// }

// private var tuple5Class: csObject
// private var tuple5Constructor: jmethodID!
// private var tuple5FirstMethod: jmethodID!
// private var tuple5SecondMethod: jmethodID!
// private var tuple5ThirdMethod: jmethodID!
// private var tuple5FourthMethod: jmethodID!
// private var tuple5FifthMethod: jmethodID!

// extension Tuple5Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter, T3: CSharpConverter, T4: CSharpConverter {
//     public static var cSharpClass: csObject {
//         tuple5Class
//     }

//     public static func fromCSharp(_ value: csObject) throws -> SwiftType {
//         let v0 = try env.CallObjectMethod(value, tuple5FirstMethod)
//         let v1 = try env.CallObjectMethod(value, tuple5SecondMethod)
//         let v2 = try env.CallObjectMethod(value, tuple5ThirdMethod)
//         let v3 = try env.CallObjectMethod(value, tuple5FourthMethod)
//         let v4 = try env.CallObjectMethod(value, tuple5FifthMethod)
//         return (
//             try T0.fromCSharp(object: v0),
//             try T1.fromCSharp(object: v1),
//             try T2.fromCSharp(object: v2),
//             try T3.fromCSharp(object: v3),
//             try T4.fromCSharp(object: v4)
//         )
//     }

//     public static func toCSharp(_ value: SwiftType) throws -> csObject {
//         let v0 = try jvalue(l: T0.toCSharpObject(value.0))
//         let v1 = try jvalue(l: T1.toCSharpObject(value.1))
//         let v2 = try jvalue(l: T2.toCSharpObject(value.2))
//         let v3 = try jvalue(l: T3.toCSharpObject(value.3))
//         let v4 = try jvalue(l: T4.toCSharpObject(value.4))
//         let result = try env.NewObject(tuple5Class, tuple5Constructor, v0, v1, v2, v3, v4)
//         env.DeleteLocalRef(v0.l)
//         env.DeleteLocalRef(v1.l)
//         env.DeleteLocalRef(v2.l)
//         env.DeleteLocalRef(v3.l)
//         env.DeleteLocalRef(v4.l)
//         return result
//     }

//     public static func cSharpSetup() throws {
//         try T0.cSharpSetup()
//         try T1.cSharpSetup()
//         try T2.cSharpSetup()
//         try T3.cSharpSetup()
//         try T4.cSharpSetup()

//         guard cSharpClass == nil else { return }
//         tuple5Class = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/Tuple5"))
//         tuple5Constructor = try env.GetMethodID(cSharpClass, "<init>", "(LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;)V")
//         tuple5FirstMethod = try env.GetMethodID(cSharpClass, "getFirst", "()LcSharp/lang/Object;")
//         tuple5SecondMethod = try env.GetMethodID(cSharpClass, "getSecond", "()LcSharp/lang/Object;")
//         tuple5ThirdMethod = try env.GetMethodID(cSharpClass, "getThird", "()LcSharp/lang/Object;")
//         tuple5FourthMethod = try env.GetMethodID(cSharpClass, "getFourth", "()LcSharp/lang/Object;")
//         tuple5FifthMethod = try env.GetMethodID(cSharpClass, "getFifth", "()LcSharp/lang/Object;")
//     }
// }

// private var tuple6Class: csObject
// private var tuple6Constructor: jmethodID!
// private var tuple6FirstMethod: jmethodID!
// private var tuple6SecondMethod: jmethodID!
// private var tuple6ThirdMethod: jmethodID!
// private var tuple6FourthMethod: jmethodID!
// private var tuple6FifthMethod: jmethodID!
// private var tuple6SixthMethod: jmethodID!

// extension Tuple6Converter: CSharpConverter where T0: CSharpConverter, T1: CSharpConverter, T2: CSharpConverter, T3: CSharpConverter, T4: CSharpConverter, T5: CSharpConverter {
//     public static var cSharpClass: csObject {
//         tuple6Class
//     }

//     public static func fromCSharp(_ value: csObject) throws -> SwiftType {
//         let v0 = try env.CallObjectMethod(value, tuple6FirstMethod)
//         let v1 = try env.CallObjectMethod(value, tuple6SecondMethod)
//         let v2 = try env.CallObjectMethod(value, tuple6ThirdMethod)
//         let v3 = try env.CallObjectMethod(value, tuple6FourthMethod)
//         let v4 = try env.CallObjectMethod(value, tuple6FifthMethod)
//         let v5 = try env.CallObjectMethod(value, tuple6SixthMethod)
//         return (
//             try T0.fromCSharp(object: v0),
//             try T1.fromCSharp(object: v1),
//             try T2.fromCSharp(object: v2),
//             try T3.fromCSharp(object: v3),
//             try T4.fromCSharp(object: v4),
//             try T5.fromCSharp(object: v5)
//         )
//     }

//     public static func toCSharp(_ value: SwiftType) throws -> csObject {
//         let v0 = try jvalue(l: T0.toCSharpObject(value.0))
//         let v1 = try jvalue(l: T1.toCSharpObject(value.1))
//         let v2 = try jvalue(l: T2.toCSharpObject(value.2))
//         let v3 = try jvalue(l: T3.toCSharpObject(value.3))
//         let v4 = try jvalue(l: T4.toCSharpObject(value.4))
//         let v5 = try jvalue(l: T5.toCSharpObject(value.5))
//         let result = try env.NewObject(tuple6Class, tuple6Constructor, v0, v1, v2, v3, v4, v5)
//         env.DeleteLocalRef(v0.l)
//         env.DeleteLocalRef(v1.l)
//         env.DeleteLocalRef(v2.l)
//         env.DeleteLocalRef(v3.l)
//         env.DeleteLocalRef(v4.l)
//         env.DeleteLocalRef(v5.l)
//         return result
//     }

//     public static func cSharpSetup() throws {
//         try T0.cSharpSetup()
//         try T1.cSharpSetup()
//         try T2.cSharpSetup()
//         try T3.cSharpSetup()
//         try T4.cSharpSetup()
//         try T5.cSharpSetup()

//         guard cSharpClass == nil else { return }
//         tuple6Class = try env.globalRef(env.FindClass("com/cricut/fishyjoes/runtime/Tuple6"))
//         tuple6Constructor = try env.GetMethodID(cSharpClass, "<init>", "(LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;LcSharp/lang/Object;)V")
//         tuple6FirstMethod = try env.GetMethodID(cSharpClass, "getFirst", "()LcSharp/lang/Object;")
//         tuple6SecondMethod = try env.GetMethodID(cSharpClass, "getSecond", "()LcSharp/lang/Object;")
//         tuple6ThirdMethod = try env.GetMethodID(cSharpClass, "getThird", "()LcSharp/lang/Object;")
//         tuple6FourthMethod = try env.GetMethodID(cSharpClass, "getFourth", "()LcSharp/lang/Object;")
//         tuple6FifthMethod = try env.GetMethodID(cSharpClass, "getFifth", "()LcSharp/lang/Object;")
//         tuple6SixthMethod = try env.GetMethodID(cSharpClass, "getSixth", "()LcSharp/lang/Object;")
//     }
// }
