// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("Collections_CollectionHolderSetup")
private func cSharpSetup(
    constructorMethod: @escaping Collections.CollectionHolder._ConstructorMethod,
    _ boolArrayGetter: @escaping (csObject, _ exn: csOutExn) -> ArrayConverter<Bool>.CType,
    _ boolSetGetter: @escaping (csObject, _ exn: csOutExn) -> SetConverter<Bool>.CType,
    _ boolDictionaryGetter: @escaping (csObject, _ exn: csOutExn) -> DictionaryConverter<Bool, Bool>.CType,
    _ integerArrayGetter: @escaping (csObject, _ exn: csOutExn) -> ArrayConverter<Int>.CType,
    _ integerSetGetter: @escaping (csObject, _ exn: csOutExn) -> SetConverter<Int>.CType,
    _ integerDictionaryGetter: @escaping (csObject, _ exn: csOutExn) -> DictionaryConverter<Int, Int>.CType,
    _ stringArrayGetter: @escaping (csObject, _ exn: csOutExn) -> ArrayConverter<Swift.String>.CType,
    _ stringSetGetter: @escaping (csObject, _ exn: csOutExn) -> SetConverter<Swift.String>.CType,
    _ stringDictionaryGetter: @escaping (csObject, _ exn: csOutExn) -> DictionaryConverter<Swift.String, Swift.String>.CType,
    _ exn: csOutExn
) {
    guard Collections.CollectionHolder._constructorMethod == nil else { return }
    Collections.CollectionHolder._constructorMethod = constructorMethod
    Collections.CollectionHolder._boolArrayGetter = boolArrayGetter
    Collections.CollectionHolder._boolSetGetter = boolSetGetter
    Collections.CollectionHolder._boolDictionaryGetter = boolDictionaryGetter
    Collections.CollectionHolder._integerArrayGetter = integerArrayGetter
    Collections.CollectionHolder._integerSetGetter = integerSetGetter
    Collections.CollectionHolder._integerDictionaryGetter = integerDictionaryGetter
    Collections.CollectionHolder._stringArrayGetter = stringArrayGetter
    Collections.CollectionHolder._stringSetGetter = stringSetGetter
    Collections.CollectionHolder._stringDictionaryGetter = stringDictionaryGetter
}

extension Collections.CollectionHolder: CSharpConverter {
    fileprivate static var _boolArrayGetter: ((csObject, _ exn: csOutExn) -> ArrayConverter<Bool>.CType)!
    fileprivate static var _boolSetGetter: ((csObject, _ exn: csOutExn) -> SetConverter<Bool>.CType)!
    fileprivate static var _boolDictionaryGetter: ((csObject, _ exn: csOutExn) -> DictionaryConverter<Bool, Bool>.CType)!
    fileprivate static var _integerArrayGetter: ((csObject, _ exn: csOutExn) -> ArrayConverter<Int>.CType)!
    fileprivate static var _integerSetGetter: ((csObject, _ exn: csOutExn) -> SetConverter<Int>.CType)!
    fileprivate static var _integerDictionaryGetter: ((csObject, _ exn: csOutExn) -> DictionaryConverter<Int, Int>.CType)!
    fileprivate static var _stringArrayGetter: ((csObject, _ exn: csOutExn) -> ArrayConverter<Swift.String>.CType)!
    fileprivate static var _stringSetGetter: ((csObject, _ exn: csOutExn) -> SetConverter<Swift.String>.CType)!
    fileprivate static var _stringDictionaryGetter: ((csObject, _ exn: csOutExn) -> DictionaryConverter<Swift.String, Swift.String>.CType)!
    fileprivate typealias _ConstructorMethod = (
        ArrayConverter<Bool>.CType,
        SetConverter<Bool>.CType,
        DictionaryConverter<Bool, Bool>.CType,
        ArrayConverter<Int>.CType,
        SetConverter<Int>.CType,
        DictionaryConverter<Int, Int>.CType,
        ArrayConverter<Swift.String>.CType,
        SetConverter<Swift.String>.CType,
        DictionaryConverter<Swift.String, Swift.String>.CType,
        _ exn: csOutExn
    ) -> csObject
    fileprivate static var _constructorMethod: _ConstructorMethod!

    public static func fromCSharp(_ value: csObject) throws -> Self {
        Self(
            boolArray: try ArrayConverter<Bool>.fromCSharp(
                try Env.check { exn in _boolArrayGetter(value, exn) }
            ),
            boolSet: try SetConverter<Bool>.fromCSharp(
                try Env.check { exn in _boolSetGetter(value, exn) }
            ),
            boolDictionary: try DictionaryConverter<Bool, Bool>.fromCSharp(
                try Env.check { exn in _boolDictionaryGetter(value, exn) }
            ),
            integerArray: try ArrayConverter<Int>.fromCSharp(
                try Env.check { exn in _integerArrayGetter(value, exn) }
            ),
            integerSet: try SetConverter<Int>.fromCSharp(
                try Env.check { exn in _integerSetGetter(value, exn) }
            ),
            integerDictionary: try DictionaryConverter<Int, Int>.fromCSharp(
                try Env.check { exn in _integerDictionaryGetter(value, exn) }
            ),
            stringArray: try ArrayConverter<Swift.String>.fromCSharp(
                try Env.check { exn in _stringArrayGetter(value, exn) }
            ),
            stringSet: try SetConverter<Swift.String>.fromCSharp(
                try Env.check { exn in _stringSetGetter(value, exn) }
            ),
            stringDictionary: try DictionaryConverter<Swift.String, Swift.String>.fromCSharp(
                try Env.check { exn in _stringDictionaryGetter(value, exn) }
            )
        )
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        try Env.check { exn in
            _constructorMethod(
                try ArrayConverter<Bool>.toCSharp(value.boolArray),
                try SetConverter<Bool>.toCSharp(value.boolSet),
                try DictionaryConverter<Bool, Bool>.toCSharp(value.boolDictionary),
                try ArrayConverter<Int>.toCSharp(value.integerArray),
                try SetConverter<Int>.toCSharp(value.integerSet),
                try DictionaryConverter<Int, Int>.toCSharp(value.integerDictionary),
                try ArrayConverter<Swift.String>.toCSharp(value.stringArray),
                try SetConverter<Swift.String>.toCSharp(value.stringSet),
                try DictionaryConverter<Swift.String, Swift.String>.toCSharp(value.stringDictionary),
                exn
            )
        }
    }
}
