// Generated using Sourcery 1.8.1 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Collections_CollectionHolder_setup")
public func TestAPI_Collections_CollectionHolder_setup(
    constructorMethod: @escaping Collections.CollectionHolder._ConstructorMethod,
    _ boolArrayGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Bool>.CType,
    _ boolArraySetter: @escaping @convention(c) (foreignObject, ArrayConverter<Bool>.CType, _ exn: foreignOutExn) -> Void,
    _ boolSetGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Bool>.CType,
    _ boolSetSetter: @escaping @convention(c) (foreignObject, SetConverter<Bool>.CType, _ exn: foreignOutExn) -> Void,
    _ boolDictionaryGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Bool, Bool>.CType,
    _ boolDictionarySetter: @escaping @convention(c) (foreignObject, DictionaryConverter<Bool, Bool>.CType, _ exn: foreignOutExn) -> Void,
    _ integerArrayGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Int>.CType,
    _ integerArraySetter: @escaping @convention(c) (foreignObject, ArrayConverter<Int>.CType, _ exn: foreignOutExn) -> Void,
    _ integerSetGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Int>.CType,
    _ integerSetSetter: @escaping @convention(c) (foreignObject, SetConverter<Int>.CType, _ exn: foreignOutExn) -> Void,
    _ integerDictionaryGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Int, Int>.CType,
    _ integerDictionarySetter: @escaping @convention(c) (foreignObject, DictionaryConverter<Int, Int>.CType, _ exn: foreignOutExn) -> Void,
    _ stringArrayGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.String>.CType,
    _ stringArraySetter: @escaping @convention(c) (foreignObject, ArrayConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void,
    _ stringSetGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Swift.String>.CType,
    _ stringSetSetter: @escaping @convention(c) (foreignObject, SetConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void,
    _ stringDictionaryGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Swift.String, Swift.String>.CType,
    _ stringDictionarySetter: @escaping @convention(c) (foreignObject, DictionaryConverter<Swift.String, Swift.String>.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    guard Collections.CollectionHolder._constructorMethod == nil else { return }
    Collections.CollectionHolder._constructorMethod = constructorMethod
    Collections.CollectionHolder._boolArrayGetter = boolArrayGetter
    Collections.CollectionHolder._boolArraySetter = boolArraySetter
    Collections.CollectionHolder._boolSetGetter = boolSetGetter
    Collections.CollectionHolder._boolSetSetter = boolSetSetter
    Collections.CollectionHolder._boolDictionaryGetter = boolDictionaryGetter
    Collections.CollectionHolder._boolDictionarySetter = boolDictionarySetter
    Collections.CollectionHolder._integerArrayGetter = integerArrayGetter
    Collections.CollectionHolder._integerArraySetter = integerArraySetter
    Collections.CollectionHolder._integerSetGetter = integerSetGetter
    Collections.CollectionHolder._integerSetSetter = integerSetSetter
    Collections.CollectionHolder._integerDictionaryGetter = integerDictionaryGetter
    Collections.CollectionHolder._integerDictionarySetter = integerDictionarySetter
    Collections.CollectionHolder._stringArrayGetter = stringArrayGetter
    Collections.CollectionHolder._stringArraySetter = stringArraySetter
    Collections.CollectionHolder._stringSetGetter = stringSetGetter
    Collections.CollectionHolder._stringSetSetter = stringSetSetter
    Collections.CollectionHolder._stringDictionaryGetter = stringDictionaryGetter
    Collections.CollectionHolder._stringDictionarySetter = stringDictionarySetter
}

extension Collections.CollectionHolder: IotaMutator {
    fileprivate static var _boolArrayGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Bool>.CType)!
    fileprivate static var _boolArraySetter: (@convention(c) (foreignObject, ArrayConverter<Bool>.CType, _ exn: foreignOutExn) -> Void)!
    fileprivate static var _boolSetGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Bool>.CType)!
    fileprivate static var _boolSetSetter: (@convention(c) (foreignObject, SetConverter<Bool>.CType, _ exn: foreignOutExn) -> Void)!
    fileprivate static var _boolDictionaryGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Bool, Bool>.CType)!
    fileprivate static var _boolDictionarySetter: (@convention(c) (foreignObject, DictionaryConverter<Bool, Bool>.CType, _ exn: foreignOutExn) -> Void)!
    fileprivate static var _integerArrayGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Int>.CType)!
    fileprivate static var _integerArraySetter: (@convention(c) (foreignObject, ArrayConverter<Int>.CType, _ exn: foreignOutExn) -> Void)!
    fileprivate static var _integerSetGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Int>.CType)!
    fileprivate static var _integerSetSetter: (@convention(c) (foreignObject, SetConverter<Int>.CType, _ exn: foreignOutExn) -> Void)!
    fileprivate static var _integerDictionaryGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Int, Int>.CType)!
    fileprivate static var _integerDictionarySetter: (@convention(c) (foreignObject, DictionaryConverter<Int, Int>.CType, _ exn: foreignOutExn) -> Void)!
    fileprivate static var _stringArrayGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.String>.CType)!
    fileprivate static var _stringArraySetter: (@convention(c) (foreignObject, ArrayConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void)!
    fileprivate static var _stringSetGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Swift.String>.CType)!
    fileprivate static var _stringSetSetter: (@convention(c) (foreignObject, SetConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void)!
    fileprivate static var _stringDictionaryGetter: (@convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Swift.String, Swift.String>.CType)!
    fileprivate static var _stringDictionarySetter: (@convention(c) (foreignObject, DictionaryConverter<Swift.String, Swift.String>.CType, _ exn: foreignOutExn) -> Void)!
    public typealias _ConstructorMethod = @convention(c) (
        ArrayConverter<Bool>.CType,
        SetConverter<Bool>.CType,
        DictionaryConverter<Bool, Bool>.CType,
        ArrayConverter<Int>.CType,
        SetConverter<Int>.CType,
        DictionaryConverter<Int, Int>.CType,
        ArrayConverter<Swift.String>.CType,
        SetConverter<Swift.String>.CType,
        DictionaryConverter<Swift.String, Swift.String>.CType,
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static var _constructorMethod: _ConstructorMethod!

    public static func peekIota(_ value: foreignObject) throws -> Self {
        Self(
            boolArray: try ArrayConverter<Bool>.consumeIota(
                try Env.check { exn in _boolArrayGetter(value, exn) }
            ),
            boolSet: try SetConverter<Bool>.consumeIota(
                try Env.check { exn in _boolSetGetter(value, exn) }
            ),
            boolDictionary: try DictionaryConverter<Bool, Bool>.consumeIota(
                try Env.check { exn in _boolDictionaryGetter(value, exn) }
            ),
            integerArray: try ArrayConverter<Int>.consumeIota(
                try Env.check { exn in _integerArrayGetter(value, exn) }
            ),
            integerSet: try SetConverter<Int>.consumeIota(
                try Env.check { exn in _integerSetGetter(value, exn) }
            ),
            integerDictionary: try DictionaryConverter<Int, Int>.consumeIota(
                try Env.check { exn in _integerDictionaryGetter(value, exn) }
            ),
            stringArray: try ArrayConverter<Swift.String>.consumeIota(
                try Env.check { exn in _stringArrayGetter(value, exn) }
            ),
            stringSet: try SetConverter<Swift.String>.consumeIota(
                try Env.check { exn in _stringSetGetter(value, exn) }
            ),
            stringDictionary: try DictionaryConverter<Swift.String, Swift.String>.consumeIota(
                try Env.check { exn in _stringDictionaryGetter(value, exn) }
            )
        )
    }

    public static func toIota(_ value: Self) throws -> foreignObject {
        try Env.check { exn in
            _constructorMethod(
                try ArrayConverter<Bool>.toIota(value.boolArray),
                try SetConverter<Bool>.toIota(value.boolSet),
                try DictionaryConverter<Bool, Bool>.toIota(value.boolDictionary),
                try ArrayConverter<Int>.toIota(value.integerArray),
                try SetConverter<Int>.toIota(value.integerSet),
                try DictionaryConverter<Int, Int>.toIota(value.integerDictionary),
                try ArrayConverter<Swift.String>.toIota(value.stringArray),
                try SetConverter<Swift.String>.toIota(value.stringSet),
                try DictionaryConverter<Swift.String, Swift.String>.toIota(value.stringDictionary),
                exn
            )
        }
    }

    public static func mutateIota<R>(_ this: foreignObject, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekIota(this)
        let result = try body(&mutatingSelf)
        try Env.check { exn in _boolArraySetter(
            this,
            try ArrayConverter<Bool>.toIota(mutatingSelf.boolArray),
            exn
        )}
        try Env.check { exn in _boolSetSetter(
            this,
            try SetConverter<Bool>.toIota(mutatingSelf.boolSet),
            exn
        )}
        try Env.check { exn in _boolDictionarySetter(
            this,
            try DictionaryConverter<Bool, Bool>.toIota(mutatingSelf.boolDictionary),
            exn
        )}
        try Env.check { exn in _integerArraySetter(
            this,
            try ArrayConverter<Int>.toIota(mutatingSelf.integerArray),
            exn
        )}
        try Env.check { exn in _integerSetSetter(
            this,
            try SetConverter<Int>.toIota(mutatingSelf.integerSet),
            exn
        )}
        try Env.check { exn in _integerDictionarySetter(
            this,
            try DictionaryConverter<Int, Int>.toIota(mutatingSelf.integerDictionary),
            exn
        )}
        try Env.check { exn in _stringArraySetter(
            this,
            try ArrayConverter<Swift.String>.toIota(mutatingSelf.stringArray),
            exn
        )}
        try Env.check { exn in _stringSetSetter(
            this,
            try SetConverter<Swift.String>.toIota(mutatingSelf.stringSet),
            exn
        )}
        try Env.check { exn in _stringDictionarySetter(
            this,
            try DictionaryConverter<Swift.String, Swift.String>.toIota(mutatingSelf.stringDictionary),
            exn
        )}
        return result
    }
}
