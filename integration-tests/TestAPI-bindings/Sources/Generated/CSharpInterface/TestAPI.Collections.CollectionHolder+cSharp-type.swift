// Generated using Sourcery 1.9.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesCSharpRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Collections_CollectionHolder_setup")
public func TestAPI_Collections_CollectionHolder_setup(
    constructorMethod: @escaping TestAPI.Collections.CollectionHolder._ConstructorMethod,
    _ boolArrayGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> ArrayConverter<Swift.Bool>.CType,
    _ boolArraySetter: @escaping @convention(c) (csObject, ArrayConverter<Swift.Bool>.CType, _ exn: csOutExn) -> Void,
    _ boolSetGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> SetConverter<Swift.Bool>.CType,
    _ boolSetSetter: @escaping @convention(c) (csObject, SetConverter<Swift.Bool>.CType, _ exn: csOutExn) -> Void,
    _ boolDictionaryGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> DictionaryConverter<Swift.Bool, Swift.Bool>.CType,
    _ boolDictionarySetter: @escaping @convention(c) (csObject, DictionaryConverter<Swift.Bool, Swift.Bool>.CType, _ exn: csOutExn) -> Void,
    _ integerArrayGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> ArrayConverter<Swift.Int>.CType,
    _ integerArraySetter: @escaping @convention(c) (csObject, ArrayConverter<Swift.Int>.CType, _ exn: csOutExn) -> Void,
    _ integerSetGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> SetConverter<Swift.Int>.CType,
    _ integerSetSetter: @escaping @convention(c) (csObject, SetConverter<Swift.Int>.CType, _ exn: csOutExn) -> Void,
    _ integerDictionaryGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> DictionaryConverter<Swift.Int, Swift.Int>.CType,
    _ integerDictionarySetter: @escaping @convention(c) (csObject, DictionaryConverter<Swift.Int, Swift.Int>.CType, _ exn: csOutExn) -> Void,
    _ stringArrayGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> ArrayConverter<Swift.String>.CType,
    _ stringArraySetter: @escaping @convention(c) (csObject, ArrayConverter<Swift.String>.CType, _ exn: csOutExn) -> Void,
    _ stringSetGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> SetConverter<Swift.String>.CType,
    _ stringSetSetter: @escaping @convention(c) (csObject, SetConverter<Swift.String>.CType, _ exn: csOutExn) -> Void,
    _ stringDictionaryGetter: @escaping @convention(c) (csObject, _ exn: csOutExn) -> DictionaryConverter<Swift.String, Swift.String>.CType,
    _ stringDictionarySetter: @escaping @convention(c) (csObject, DictionaryConverter<Swift.String, Swift.String>.CType, _ exn: csOutExn) -> Void,
    _ exn: csOutExn
) {
    guard TestAPI.Collections.CollectionHolder._constructorMethod == nil else { return }
    TestAPI.Collections.CollectionHolder._constructorMethod = constructorMethod
    TestAPI.Collections.CollectionHolder._boolArrayGetter = boolArrayGetter
    TestAPI.Collections.CollectionHolder._boolArraySetter = boolArraySetter
    TestAPI.Collections.CollectionHolder._boolSetGetter = boolSetGetter
    TestAPI.Collections.CollectionHolder._boolSetSetter = boolSetSetter
    TestAPI.Collections.CollectionHolder._boolDictionaryGetter = boolDictionaryGetter
    TestAPI.Collections.CollectionHolder._boolDictionarySetter = boolDictionarySetter
    TestAPI.Collections.CollectionHolder._integerArrayGetter = integerArrayGetter
    TestAPI.Collections.CollectionHolder._integerArraySetter = integerArraySetter
    TestAPI.Collections.CollectionHolder._integerSetGetter = integerSetGetter
    TestAPI.Collections.CollectionHolder._integerSetSetter = integerSetSetter
    TestAPI.Collections.CollectionHolder._integerDictionaryGetter = integerDictionaryGetter
    TestAPI.Collections.CollectionHolder._integerDictionarySetter = integerDictionarySetter
    TestAPI.Collections.CollectionHolder._stringArrayGetter = stringArrayGetter
    TestAPI.Collections.CollectionHolder._stringArraySetter = stringArraySetter
    TestAPI.Collections.CollectionHolder._stringSetGetter = stringSetGetter
    TestAPI.Collections.CollectionHolder._stringSetSetter = stringSetSetter
    TestAPI.Collections.CollectionHolder._stringDictionaryGetter = stringDictionaryGetter
    TestAPI.Collections.CollectionHolder._stringDictionarySetter = stringDictionarySetter
}

extension TestAPI.Collections.CollectionHolder: CSharpMutator {
    fileprivate static var _boolArrayGetter: (@convention(c) (csObject, _ exn: csOutExn) -> ArrayConverter<Swift.Bool>.CType)!
    fileprivate static var _boolArraySetter: (@convention(c) (csObject, ArrayConverter<Swift.Bool>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _boolSetGetter: (@convention(c) (csObject, _ exn: csOutExn) -> SetConverter<Swift.Bool>.CType)!
    fileprivate static var _boolSetSetter: (@convention(c) (csObject, SetConverter<Swift.Bool>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _boolDictionaryGetter: (@convention(c) (csObject, _ exn: csOutExn) -> DictionaryConverter<Swift.Bool, Swift.Bool>.CType)!
    fileprivate static var _boolDictionarySetter: (@convention(c) (csObject, DictionaryConverter<Swift.Bool, Swift.Bool>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _integerArrayGetter: (@convention(c) (csObject, _ exn: csOutExn) -> ArrayConverter<Swift.Int>.CType)!
    fileprivate static var _integerArraySetter: (@convention(c) (csObject, ArrayConverter<Swift.Int>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _integerSetGetter: (@convention(c) (csObject, _ exn: csOutExn) -> SetConverter<Swift.Int>.CType)!
    fileprivate static var _integerSetSetter: (@convention(c) (csObject, SetConverter<Swift.Int>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _integerDictionaryGetter: (@convention(c) (csObject, _ exn: csOutExn) -> DictionaryConverter<Swift.Int, Swift.Int>.CType)!
    fileprivate static var _integerDictionarySetter: (@convention(c) (csObject, DictionaryConverter<Swift.Int, Swift.Int>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _stringArrayGetter: (@convention(c) (csObject, _ exn: csOutExn) -> ArrayConverter<Swift.String>.CType)!
    fileprivate static var _stringArraySetter: (@convention(c) (csObject, ArrayConverter<Swift.String>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _stringSetGetter: (@convention(c) (csObject, _ exn: csOutExn) -> SetConverter<Swift.String>.CType)!
    fileprivate static var _stringSetSetter: (@convention(c) (csObject, SetConverter<Swift.String>.CType, _ exn: csOutExn) -> Void)!
    fileprivate static var _stringDictionaryGetter: (@convention(c) (csObject, _ exn: csOutExn) -> DictionaryConverter<Swift.String, Swift.String>.CType)!
    fileprivate static var _stringDictionarySetter: (@convention(c) (csObject, DictionaryConverter<Swift.String, Swift.String>.CType, _ exn: csOutExn) -> Void)!
    public typealias _ConstructorMethod = @convention(c) (
        ArrayConverter<Swift.Bool>.CType,
        SetConverter<Swift.Bool>.CType,
        DictionaryConverter<Swift.Bool, Swift.Bool>.CType,
        ArrayConverter<Swift.Int>.CType,
        SetConverter<Swift.Int>.CType,
        DictionaryConverter<Swift.Int, Swift.Int>.CType,
        ArrayConverter<Swift.String>.CType,
        SetConverter<Swift.String>.CType,
        DictionaryConverter<Swift.String, Swift.String>.CType,
        _ exn: csOutExn
    ) -> csObject
    fileprivate static var _constructorMethod: _ConstructorMethod!

    public static func peekCSharp(_ value: csObject) throws -> Self {
        Self(
            boolArray: try ArrayConverter<Swift.Bool>.consumeCSharp(
                try Env.check { exn in _boolArrayGetter(value, exn) }
            ),
            boolSet: try SetConverter<Swift.Bool>.consumeCSharp(
                try Env.check { exn in _boolSetGetter(value, exn) }
            ),
            boolDictionary: try DictionaryConverter<Swift.Bool, Swift.Bool>.consumeCSharp(
                try Env.check { exn in _boolDictionaryGetter(value, exn) }
            ),
            integerArray: try ArrayConverter<Swift.Int>.consumeCSharp(
                try Env.check { exn in _integerArrayGetter(value, exn) }
            ),
            integerSet: try SetConverter<Swift.Int>.consumeCSharp(
                try Env.check { exn in _integerSetGetter(value, exn) }
            ),
            integerDictionary: try DictionaryConverter<Swift.Int, Swift.Int>.consumeCSharp(
                try Env.check { exn in _integerDictionaryGetter(value, exn) }
            ),
            stringArray: try ArrayConverter<Swift.String>.consumeCSharp(
                try Env.check { exn in _stringArrayGetter(value, exn) }
            ),
            stringSet: try SetConverter<Swift.String>.consumeCSharp(
                try Env.check { exn in _stringSetGetter(value, exn) }
            ),
            stringDictionary: try DictionaryConverter<Swift.String, Swift.String>.consumeCSharp(
                try Env.check { exn in _stringDictionaryGetter(value, exn) }
            )
        )
    }

    public static func toCSharp(_ value: Self) throws -> csObject {
        try Env.check { exn in
            _constructorMethod(
                try ArrayConverter<Swift.Bool>.toCSharp(value.boolArray),
                try SetConverter<Swift.Bool>.toCSharp(value.boolSet),
                try DictionaryConverter<Swift.Bool, Swift.Bool>.toCSharp(value.boolDictionary),
                try ArrayConverter<Swift.Int>.toCSharp(value.integerArray),
                try SetConverter<Swift.Int>.toCSharp(value.integerSet),
                try DictionaryConverter<Swift.Int, Swift.Int>.toCSharp(value.integerDictionary),
                try ArrayConverter<Swift.String>.toCSharp(value.stringArray),
                try SetConverter<Swift.String>.toCSharp(value.stringSet),
                try DictionaryConverter<Swift.String, Swift.String>.toCSharp(value.stringDictionary),
                exn
            )
        }
    }

    public static func mutateCSharp<R>(_ this: csObject, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekCSharp(this)
        let result = try body(&mutatingSelf)
        try Env.check { exn in _boolArraySetter(
            this,
            try ArrayConverter<Swift.Bool>.toCSharp(mutatingSelf.boolArray),
            exn
        )}
        try Env.check { exn in _boolSetSetter(
            this,
            try SetConverter<Swift.Bool>.toCSharp(mutatingSelf.boolSet),
            exn
        )}
        try Env.check { exn in _boolDictionarySetter(
            this,
            try DictionaryConverter<Swift.Bool, Swift.Bool>.toCSharp(mutatingSelf.boolDictionary),
            exn
        )}
        try Env.check { exn in _integerArraySetter(
            this,
            try ArrayConverter<Swift.Int>.toCSharp(mutatingSelf.integerArray),
            exn
        )}
        try Env.check { exn in _integerSetSetter(
            this,
            try SetConverter<Swift.Int>.toCSharp(mutatingSelf.integerSet),
            exn
        )}
        try Env.check { exn in _integerDictionarySetter(
            this,
            try DictionaryConverter<Swift.Int, Swift.Int>.toCSharp(mutatingSelf.integerDictionary),
            exn
        )}
        try Env.check { exn in _stringArraySetter(
            this,
            try ArrayConverter<Swift.String>.toCSharp(mutatingSelf.stringArray),
            exn
        )}
        try Env.check { exn in _stringSetSetter(
            this,
            try SetConverter<Swift.String>.toCSharp(mutatingSelf.stringSet),
            exn
        )}
        try Env.check { exn in _stringDictionarySetter(
            this,
            try DictionaryConverter<Swift.String, Swift.String>.toCSharp(mutatingSelf.stringDictionary),
            exn
        )}
        return result
    }
}
