// Generated using Sourcery 2.0.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable superfluous_disable_command unused_closure_parameter syntactic_sugar attributes
import FishyJoesDartRuntime
import Foundation
import TestAPI

@_cdecl("TestAPI_Collections_CollectionHolder_setup")
public func TestAPI_Collections_CollectionHolder_setup(
    envRef: EnvRef,
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
    let env = Env(envRef)
    if Collections.CollectionHolder._constructorMethod.isInitialized(env) { return }
    Collections.CollectionHolder._constructorMethod[env] = constructorMethod
    Collections.CollectionHolder._boolArrayGetter[env] = boolArrayGetter
    Collections.CollectionHolder._boolArraySetter[env] = boolArraySetter
    Collections.CollectionHolder._boolSetGetter[env] = boolSetGetter
    Collections.CollectionHolder._boolSetSetter[env] = boolSetSetter
    Collections.CollectionHolder._boolDictionaryGetter[env] = boolDictionaryGetter
    Collections.CollectionHolder._boolDictionarySetter[env] = boolDictionarySetter
    Collections.CollectionHolder._integerArrayGetter[env] = integerArrayGetter
    Collections.CollectionHolder._integerArraySetter[env] = integerArraySetter
    Collections.CollectionHolder._integerSetGetter[env] = integerSetGetter
    Collections.CollectionHolder._integerSetSetter[env] = integerSetSetter
    Collections.CollectionHolder._integerDictionaryGetter[env] = integerDictionaryGetter
    Collections.CollectionHolder._integerDictionarySetter[env] = integerDictionarySetter
    Collections.CollectionHolder._stringArrayGetter[env] = stringArrayGetter
    Collections.CollectionHolder._stringArraySetter[env] = stringArraySetter
    Collections.CollectionHolder._stringSetGetter[env] = stringSetGetter
    Collections.CollectionHolder._stringSetSetter[env] = stringSetSetter
    Collections.CollectionHolder._stringDictionaryGetter[env] = stringDictionaryGetter
    Collections.CollectionHolder._stringDictionarySetter[env] = stringDictionarySetter
}

extension Collections.CollectionHolder: DartMutator {
    fileprivate static let _boolArrayGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Bool>.CType>()
    fileprivate static let _boolArraySetter = Env.CallbackMap<@convention(c) (foreignObject, ArrayConverter<Bool>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _boolSetGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Bool>.CType>()
    fileprivate static let _boolSetSetter = Env.CallbackMap<@convention(c) (foreignObject, SetConverter<Bool>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _boolDictionaryGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Bool, Bool>.CType>()
    fileprivate static let _boolDictionarySetter = Env.CallbackMap<@convention(c) (foreignObject, DictionaryConverter<Bool, Bool>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _integerArrayGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Int>.CType>()
    fileprivate static let _integerArraySetter = Env.CallbackMap<@convention(c) (foreignObject, ArrayConverter<Int>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _integerSetGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Int>.CType>()
    fileprivate static let _integerSetSetter = Env.CallbackMap<@convention(c) (foreignObject, SetConverter<Int>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _integerDictionaryGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Int, Int>.CType>()
    fileprivate static let _integerDictionarySetter = Env.CallbackMap<@convention(c) (foreignObject, DictionaryConverter<Int, Int>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _stringArrayGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> ArrayConverter<Swift.String>.CType>()
    fileprivate static let _stringArraySetter = Env.CallbackMap<@convention(c) (foreignObject, ArrayConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _stringSetGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> SetConverter<Swift.String>.CType>()
    fileprivate static let _stringSetSetter = Env.CallbackMap<@convention(c) (foreignObject, SetConverter<Swift.String>.CType, _ exn: foreignOutExn) -> Void>()
    fileprivate static let _stringDictionaryGetter = Env.CallbackMap<@convention(c) (foreignObject, _ exn: foreignOutExn) -> DictionaryConverter<Swift.String, Swift.String>.CType>()
    fileprivate static let _stringDictionarySetter = Env.CallbackMap<@convention(c) (foreignObject, DictionaryConverter<Swift.String, Swift.String>.CType, _ exn: foreignOutExn) -> Void>()
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
    fileprivate static let _constructorMethod = Env.CallbackMap<_ConstructorMethod>()

    public static func peekDart(_ value: foreignObject, env: Env) throws -> Self {
        Self(
            boolArray: try ArrayConverter<Bool>.consumeDart(
                try env.check { exn in _boolArrayGetter[env](value, exn) },
                env: env
            ),
            boolSet: try SetConverter<Bool>.consumeDart(
                try env.check { exn in _boolSetGetter[env](value, exn) },
                env: env
            ),
            boolDictionary: try DictionaryConverter<Bool, Bool>.consumeDart(
                try env.check { exn in _boolDictionaryGetter[env](value, exn) },
                env: env
            ),
            integerArray: try ArrayConverter<Int>.consumeDart(
                try env.check { exn in _integerArrayGetter[env](value, exn) },
                env: env
            ),
            integerSet: try SetConverter<Int>.consumeDart(
                try env.check { exn in _integerSetGetter[env](value, exn) },
                env: env
            ),
            integerDictionary: try DictionaryConverter<Int, Int>.consumeDart(
                try env.check { exn in _integerDictionaryGetter[env](value, exn) },
                env: env
            ),
            stringArray: try ArrayConverter<Swift.String>.consumeDart(
                try env.check { exn in _stringArrayGetter[env](value, exn) },
                env: env
            ),
            stringSet: try SetConverter<Swift.String>.consumeDart(
                try env.check { exn in _stringSetGetter[env](value, exn) },
                env: env
            ),
            stringDictionary: try DictionaryConverter<Swift.String, Swift.String>.consumeDart(
                try env.check { exn in _stringDictionaryGetter[env](value, exn) },
                env: env
            )
        )
    }

    public static func toDart(_ value: Self, env: Env) throws -> foreignObject {
        try env.check { exn in
            _constructorMethod[env](
                try ArrayConverter<Bool>.toDart(value.boolArray, env: env),
                try SetConverter<Bool>.toDart(value.boolSet, env: env),
                try DictionaryConverter<Bool, Bool>.toDart(value.boolDictionary, env: env),
                try ArrayConverter<Int>.toDart(value.integerArray, env: env),
                try SetConverter<Int>.toDart(value.integerSet, env: env),
                try DictionaryConverter<Int, Int>.toDart(value.integerDictionary, env: env),
                try ArrayConverter<Swift.String>.toDart(value.stringArray, env: env),
                try SetConverter<Swift.String>.toDart(value.stringSet, env: env),
                try DictionaryConverter<Swift.String, Swift.String>.toDart(value.stringDictionary, env: env),
                exn
            )
        }
    }

    public static func mutateDart<R>(_ this: foreignObject, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try peekDart(this, env: env)
        let result = try body(&mutatingSelf)
        try env.check { exn in _boolArraySetter[env](
            this,
            try ArrayConverter<Bool>.toDart(mutatingSelf.boolArray, env: env),
            exn
        )}
        try env.check { exn in _boolSetSetter[env](
            this,
            try SetConverter<Bool>.toDart(mutatingSelf.boolSet, env: env),
            exn
        )}
        try env.check { exn in _boolDictionarySetter[env](
            this,
            try DictionaryConverter<Bool, Bool>.toDart(mutatingSelf.boolDictionary, env: env),
            exn
        )}
        try env.check { exn in _integerArraySetter[env](
            this,
            try ArrayConverter<Int>.toDart(mutatingSelf.integerArray, env: env),
            exn
        )}
        try env.check { exn in _integerSetSetter[env](
            this,
            try SetConverter<Int>.toDart(mutatingSelf.integerSet, env: env),
            exn
        )}
        try env.check { exn in _integerDictionarySetter[env](
            this,
            try DictionaryConverter<Int, Int>.toDart(mutatingSelf.integerDictionary, env: env),
            exn
        )}
        try env.check { exn in _stringArraySetter[env](
            this,
            try ArrayConverter<Swift.String>.toDart(mutatingSelf.stringArray, env: env),
            exn
        )}
        try env.check { exn in _stringSetSetter[env](
            this,
            try SetConverter<Swift.String>.toDart(mutatingSelf.stringSet, env: env),
            exn
        )}
        try env.check { exn in _stringDictionarySetter[env](
            this,
            try DictionaryConverter<Swift.String, Swift.String>.toDart(mutatingSelf.stringDictionary, env: env),
            exn
        )}
        return result
    }
}
