// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesIotaRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Collections_CollectionHolder_setup")
public func TestAPI_Collections_CollectionHolder_setup(
    envRef: EnvRef,
    constructorMethod: @escaping TestAPI.Collections.CollectionHolder._ConstructorMethod,
    _ boolArrayGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.Bool>.CType,
    _ boolArraySetter: @escaping @convention(c) (foreignObject, ArrayConverter<Swift.Bool>.CType, _ exn: foreignOutExn) -> Void,
    _ boolSetGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Swift.Bool>.CType,
    _ boolSetSetter: @escaping @convention(c) (foreignObject, SetConverter<Swift.Bool>.CType, _ exn: foreignOutExn) -> Void,
    _ boolDictionaryGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Swift.Bool, Swift.Bool>.CType,
    _ boolDictionarySetter: @escaping @convention(c) (foreignObject, DictionaryConverter<Swift.Bool, Swift.Bool>.CType, _ exn: foreignOutExn) -> Void,
    _ integerArrayGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.Int>.CType,
    _ integerArraySetter: @escaping @convention(c) (foreignObject, ArrayConverter<Swift.Int>.CType, _ exn: foreignOutExn) -> Void,
    _ integerSetGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Swift.Int>.CType,
    _ integerSetSetter: @escaping @convention(c) (foreignObject, SetConverter<Swift.Int>.CType, _ exn: foreignOutExn) -> Void,
    _ integerDictionaryGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Swift.Int, Swift.Int>.CType,
    _ integerDictionarySetter: @escaping @convention(c) (foreignObject, DictionaryConverter<Swift.Int, Swift.Int>.CType, _ exn: foreignOutExn) -> Void,
    _ stringArrayGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.String>.CType,
    _ stringArraySetter: @escaping @convention(c) (foreignObject, ArrayConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void,
    _ stringSetGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Swift.String>.CType,
    _ stringSetSetter: @escaping @convention(c) (foreignObject, SetConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void,
    _ stringDictionaryGetter: @escaping @convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Swift.String, Swift.String>.CType,
    _ stringDictionarySetter: @escaping @convention(c) (foreignObject, DictionaryConverter<Swift.String, Swift.String>.CType, _ exn: foreignOutExn) -> Void,
    _ exn: foreignOutExn
) {
    let env = Env(envRef)
    if TestAPI.Collections.CollectionHolder._constructorMethod.isInitialized(env) { return }
    TestAPI.Collections.CollectionHolder._constructorMethod[env] = constructorMethod
    TestAPI.Collections.CollectionHolder._boolArrayGetter[env] = boolArrayGetter
    TestAPI.Collections.CollectionHolder._boolArraySetter[env] = boolArraySetter
    TestAPI.Collections.CollectionHolder._boolSetGetter[env] = boolSetGetter
    TestAPI.Collections.CollectionHolder._boolSetSetter[env] = boolSetSetter
    TestAPI.Collections.CollectionHolder._boolDictionaryGetter[env] = boolDictionaryGetter
    TestAPI.Collections.CollectionHolder._boolDictionarySetter[env] = boolDictionarySetter
    TestAPI.Collections.CollectionHolder._integerArrayGetter[env] = integerArrayGetter
    TestAPI.Collections.CollectionHolder._integerArraySetter[env] = integerArraySetter
    TestAPI.Collections.CollectionHolder._integerSetGetter[env] = integerSetGetter
    TestAPI.Collections.CollectionHolder._integerSetSetter[env] = integerSetSetter
    TestAPI.Collections.CollectionHolder._integerDictionaryGetter[env] = integerDictionaryGetter
    TestAPI.Collections.CollectionHolder._integerDictionarySetter[env] = integerDictionarySetter
    TestAPI.Collections.CollectionHolder._stringArrayGetter[env] = stringArrayGetter
    TestAPI.Collections.CollectionHolder._stringArraySetter[env] = stringArraySetter
    TestAPI.Collections.CollectionHolder._stringSetGetter[env] = stringSetGetter
    TestAPI.Collections.CollectionHolder._stringSetSetter[env] = stringSetSetter
    TestAPI.Collections.CollectionHolder._stringDictionaryGetter[env] = stringDictionaryGetter
    TestAPI.Collections.CollectionHolder._stringDictionarySetter[env] = stringDictionarySetter
}

extension TestAPI.Collections.CollectionHolder: IotaMutator {
    fileprivate static let _boolArrayGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.Bool>.CType>()
    fileprivate static let _boolArraySetter = Env.CallbackMap<@convention(c) (foreignObject, ArrayConverter<Swift.Bool>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _boolSetGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Swift.Bool>.CType>()
    fileprivate static let _boolSetSetter = Env.CallbackMap<@convention(c) (foreignObject, SetConverter<Swift.Bool>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _boolDictionaryGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Swift.Bool, Swift.Bool>.CType>()
    fileprivate static let _boolDictionarySetter = Env.CallbackMap<@convention(c) (foreignObject, DictionaryConverter<Swift.Bool, Swift.Bool>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _integerArrayGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.Int>.CType>()
    fileprivate static let _integerArraySetter = Env.CallbackMap<@convention(c) (foreignObject, ArrayConverter<Swift.Int>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _integerSetGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Swift.Int>.CType>()
    fileprivate static let _integerSetSetter = Env.CallbackMap<@convention(c) (foreignObject, SetConverter<Swift.Int>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _integerDictionaryGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Swift.Int, Swift.Int>.CType>()
    fileprivate static let _integerDictionarySetter = Env.CallbackMap<@convention(c) (foreignObject, DictionaryConverter<Swift.Int, Swift.Int>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _stringArrayGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.String>.CType>()
    fileprivate static let _stringArraySetter = Env.CallbackMap<@convention(c) (foreignObject, ArrayConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _stringSetGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Swift.String>.CType>()
    fileprivate static let _stringSetSetter = Env.CallbackMap<@convention(c) (foreignObject, SetConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _stringDictionaryGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Swift.String, Swift.String>.CType>()
    fileprivate static let _stringDictionarySetter = Env.CallbackMap<@convention(c) (foreignObject, DictionaryConverter<Swift.String, Swift.String>.CType, _ exn: foreignOutExn) -> Void>()
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
        _ exn: foreignOutExn
    ) -> foreignObject
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekIota(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            boolArray: try ArrayConverter<Swift.Bool>.consumeIota(
                try env.check { exn in _boolArrayGetter[env](value, exn) },
                env: env
            ),
            boolSet: try SetConverter<Swift.Bool>.consumeIota(
                try env.check { exn in _boolSetGetter[env](value, exn) },
                env: env
            ),
            boolDictionary: try DictionaryConverter<Swift.Bool, Swift.Bool>.consumeIota(
                try env.check { exn in _boolDictionaryGetter[env](value, exn) },
                env: env
            ),
            integerArray: try ArrayConverter<Swift.Int>.consumeIota(
                try env.check { exn in _integerArrayGetter[env](value, exn) },
                env: env
            ),
            integerSet: try SetConverter<Swift.Int>.consumeIota(
                try env.check { exn in _integerSetGetter[env](value, exn) },
                env: env
            ),
            integerDictionary: try DictionaryConverter<Swift.Int, Swift.Int>.consumeIota(
                try env.check { exn in _integerDictionaryGetter[env](value, exn) },
                env: env
            ),
            stringArray: try ArrayConverter<Swift.String>.consumeIota(
                try env.check { exn in _stringArrayGetter[env](value, exn) },
                env: env
            ),
            stringSet: try SetConverter<Swift.String>.consumeIota(
                try env.check { exn in _stringSetGetter[env](value, exn) },
                env: env
            ),
            stringDictionary: try DictionaryConverter<Swift.String, Swift.String>.consumeIota(
                try env.check { exn in _stringDictionaryGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toIota(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try ArrayConverter<Swift.Bool>.toIota(value.boolArray, env: env),
                try SetConverter<Swift.Bool>.toIota(value.boolSet, env: env),
                try DictionaryConverter<Swift.Bool, Swift.Bool>.toIota(value.boolDictionary, env: env),
                try ArrayConverter<Swift.Int>.toIota(value.integerArray, env: env),
                try SetConverter<Swift.Int>.toIota(value.integerSet, env: env),
                try DictionaryConverter<Swift.Int, Swift.Int>.toIota(value.integerDictionary, env: env),
                try ArrayConverter<Swift.String>.toIota(value.stringArray, env: env),
                try SetConverter<Swift.String>.toIota(value.stringSet, env: env),
                try DictionaryConverter<Swift.String, Swift.String>.toIota(value.stringDictionary, env: env),
                exn
            )
        }
    }

    public static func mutateIota(_ this: foreignObject, to value: Self, env: Env) throws {
        try env.check { exn in _boolArraySetter[env](
            this,
            try ArrayConverter<Swift.Bool>.toIota(value.boolArray, env: env),
            exn
        )}
        try env.check { exn in _boolSetSetter[env](
            this,
            try SetConverter<Swift.Bool>.toIota(value.boolSet, env: env),
            exn
        )}
        try env.check { exn in _boolDictionarySetter[env](
            this,
            try DictionaryConverter<Swift.Bool, Swift.Bool>.toIota(value.boolDictionary, env: env),
            exn
        )}
        try env.check { exn in _integerArraySetter[env](
            this,
            try ArrayConverter<Swift.Int>.toIota(value.integerArray, env: env),
            exn
        )}
        try env.check { exn in _integerSetSetter[env](
            this,
            try SetConverter<Swift.Int>.toIota(value.integerSet, env: env),
            exn
        )}
        try env.check { exn in _integerDictionarySetter[env](
            this,
            try DictionaryConverter<Swift.Int, Swift.Int>.toIota(value.integerDictionary, env: env),
            exn
        )}
        try env.check { exn in _stringArraySetter[env](
            this,
            try ArrayConverter<Swift.String>.toIota(value.stringArray, env: env),
            exn
        )}
        try env.check { exn in _stringSetSetter[env](
            this,
            try SetConverter<Swift.String>.toIota(value.stringSet, env: env),
            exn
        )}
        try env.check { exn in _stringDictionarySetter[env](
            this,
            try DictionaryConverter<Swift.String, Swift.String>.toIota(value.stringDictionary, env: env),
            exn
        )}
    }
}
