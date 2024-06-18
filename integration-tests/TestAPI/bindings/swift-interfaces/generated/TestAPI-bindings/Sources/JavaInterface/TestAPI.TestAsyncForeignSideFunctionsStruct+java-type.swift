// Generated using Sourcery 2.1.7 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT
// swiftlint:disable:next blanket_disable_command superfluous_disable_command
// swiftlint:disable unused_closure_parameter syntactic_sugar attributes
import FishyJoesJavaRuntime
import Foundation
import TestAPI

extension TestAPI.TestAsyncForeignSideFunctionsStruct: JavaMutator {
    public typealias SwiftType = Self
    public typealias CType = jobject?

    public static var javaClass: jclass?
    private static var _java_const42_id: jfieldID!
    private static var _java_iabs_id: jfieldID!
    private static var _java_intCompose_id: jfieldID!
    private static var _java_add3Things_id: jfieldID!
    private static var _java_makeList_id: jfieldID!
    private static var _java_fifthThing_id: jfieldID!
    private static var _java_six_id: jfieldID!
    private static var _java_willThrow_id: jfieldID!
    private static var _java_exercise0Fun_id: jfieldID!
    private static var _java_exercise1Fun_id: jfieldID!
    private static var _java_exercise2Fun_id: jfieldID!
    private static var _java_exercise3Fun_id: jfieldID!
    private static var _java_exercise4Fun_id: jfieldID!
    private static var _java_exercise5Fun_id: jfieldID!
    private static var _java_exercise6Fun_id: jfieldID!
    private static var _java_thunkTwiceMakerFun_id: jfieldID!
    private static var _constructorMethodID: jmethodID!
    public static func fromJava(_ value: jobject?, env: Env) throws -> Self {
        Self(
            const42: try AsyncFunction0Converter<Swift.Int>.fromJava(
                env.GetObjectField(value, Self._java_const42_id),
                env: env
            ),
            iabs: try AsyncFunction1Converter<Swift.Int, Swift.Int>.fromJava(
                env.GetObjectField(value, Self._java_iabs_id),
                env: env
            ),
            intCompose: try Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.fromJava(
                env.GetObjectField(value, Self._java_intCompose_id),
                env: env
            ),
            add3Things: try AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.fromJava(
                env.GetObjectField(value, Self._java_add3Things_id),
                env: env
            ),
            makeList: try AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.fromJava(
                env.GetObjectField(value, Self._java_makeList_id),
                env: env
            ),
            fifthThing: try AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.fromJava(
                env.GetObjectField(value, Self._java_fifthThing_id),
                env: env
            ),
            six: try AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.fromJava(
                env.GetObjectField(value, Self._java_six_id),
                env: env
            ),
            willThrow: try AsyncFunction0Converter<Swift.Int>.fromJava(
                env.GetObjectField(value, Self._java_willThrow_id),
                env: env
            ),
            exercise0Fun: try AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_exercise0Fun_id),
                env: env
            ),
            exercise1Fun: try AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_exercise1Fun_id),
                env: env
            ),
            exercise2Fun: try AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_exercise2Fun_id),
                env: env
            ),
            exercise3Fun: try AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_exercise3Fun_id),
                env: env
            ),
            exercise4Fun: try AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_exercise4Fun_id),
                env: env
            ),
            exercise5Fun: try AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_exercise5Fun_id),
                env: env
            ),
            exercise6Fun: try AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>.fromJava(
                env.GetObjectField(value, Self._java_exercise6Fun_id),
                env: env
            ),
            thunkTwiceMakerFun: try Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.fromJava(
                env.GetObjectField(value, Self._java_thunkTwiceMakerFun_id),
                env: env
            )
        )
    }
    public static func toJava(_ value: Self, env: Env) throws -> jobject? {
        try env.NewObject(
            Self.javaClass,
            Self._constructorMethodID,
            jvalue(AsyncFunction0Converter<Swift.Int>.toJava(value.const42, env: env)),
            jvalue(AsyncFunction1Converter<Swift.Int, Swift.Int>.toJava(value.iabs, env: env)),
            jvalue(Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toJava(value.intCompose, env: env)),
            jvalue(AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toJava(value.add3Things, env: env)),
            jvalue(AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toJava(value.makeList, env: env)),
            jvalue(AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toJava(value.fifthThing, env: env)),
            jvalue(AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toJava(value.six, env: env)),
            jvalue(AsyncFunction0Converter<Swift.Int>.toJava(value.willThrow, env: env)),
            jvalue(AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>.toJava(value.exercise0Fun, env: env)),
            jvalue(AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>.toJava(value.exercise1Fun, env: env)),
            jvalue(AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>.toJava(value.exercise2Fun, env: env)),
            jvalue(AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>.toJava(value.exercise3Fun, env: env)),
            jvalue(AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>.toJava(value.exercise4Fun, env: env)),
            jvalue(AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>.toJava(value.exercise5Fun, env: env)),
            jvalue(AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>.toJava(value.exercise6Fun, env: env)),
            jvalue(Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.toJava(value.thunkTwiceMakerFun, env: env))
        )
    }
    public static func javaSetup(env: Env) throws {
        guard javaClass == nil else { return }
        javaClass = try env.globalRef(env.FindClass("com/cricut/testapi/TestAsyncForeignSideFunctionsStruct"))
        _java_const42_id = try env.GetFieldID(javaClass, "const42", "Lkotlin/jvm/functions/Function1;")
        _java_iabs_id = try env.GetFieldID(javaClass, "iabs", "Lkotlin/jvm/functions/Function2;")
        _java_intCompose_id = try env.GetFieldID(javaClass, "intCompose", "Lkotlin/jvm/functions/Function2;")
        _java_add3Things_id = try env.GetFieldID(javaClass, "add3Things", "Lkotlin/jvm/functions/Function4;")
        _java_makeList_id = try env.GetFieldID(javaClass, "makeList", "Lkotlin/jvm/functions/Function5;")
        _java_fifthThing_id = try env.GetFieldID(javaClass, "fifthThing", "Lkotlin/jvm/functions/Function6;")
        _java_six_id = try env.GetFieldID(javaClass, "six", "Lkotlin/jvm/functions/Function7;")
        _java_willThrow_id = try env.GetFieldID(javaClass, "willThrow", "Lkotlin/jvm/functions/Function1;")
        _java_exercise0Fun_id = try env.GetFieldID(javaClass, "exercise0Fun", "Lkotlin/jvm/functions/Function2;")
        _java_exercise1Fun_id = try env.GetFieldID(javaClass, "exercise1Fun", "Lkotlin/jvm/functions/Function2;")
        _java_exercise2Fun_id = try env.GetFieldID(javaClass, "exercise2Fun", "Lkotlin/jvm/functions/Function2;")
        _java_exercise3Fun_id = try env.GetFieldID(javaClass, "exercise3Fun", "Lkotlin/jvm/functions/Function2;")
        _java_exercise4Fun_id = try env.GetFieldID(javaClass, "exercise4Fun", "Lkotlin/jvm/functions/Function2;")
        _java_exercise5Fun_id = try env.GetFieldID(javaClass, "exercise5Fun", "Lkotlin/jvm/functions/Function2;")
        _java_exercise6Fun_id = try env.GetFieldID(javaClass, "exercise6Fun", "Lkotlin/jvm/functions/Function2;")
        _java_thunkTwiceMakerFun_id = try env.GetFieldID(javaClass, "thunkTwiceMakerFun", "Lkotlin/jvm/functions/Function1;")
        _constructorMethodID = try env.GetMethodID(javaClass, "<init>", "(Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function4;Lkotlin/jvm/functions/Function5;Lkotlin/jvm/functions/Function6;Lkotlin/jvm/functions/Function7;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function2;Lkotlin/jvm/functions/Function1;)V")
    }
    public static func mutateJava<R>(_ this: jobject?, env: Env, body: (inout Self) throws -> R) throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try body(&mutatingSelf)
        try env.SetObjectField(
            this, Self._java_const42_id,
            AsyncFunction0Converter<Swift.Int>.toJava(mutatingSelf.const42, env: env)
        )
        try env.SetObjectField(
            this, Self._java_iabs_id,
            AsyncFunction1Converter<Swift.Int, Swift.Int>.toJava(mutatingSelf.iabs, env: env)
        )
        try env.SetObjectField(
            this, Self._java_intCompose_id,
            Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toJava(mutatingSelf.intCompose, env: env)
        )
        try env.SetObjectField(
            this, Self._java_add3Things_id,
            AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toJava(mutatingSelf.add3Things, env: env)
        )
        try env.SetObjectField(
            this, Self._java_makeList_id,
            AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toJava(mutatingSelf.makeList, env: env)
        )
        try env.SetObjectField(
            this, Self._java_fifthThing_id,
            AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toJava(mutatingSelf.fifthThing, env: env)
        )
        try env.SetObjectField(
            this, Self._java_six_id,
            AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toJava(mutatingSelf.six, env: env)
        )
        try env.SetObjectField(
            this, Self._java_willThrow_id,
            AsyncFunction0Converter<Swift.Int>.toJava(mutatingSelf.willThrow, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise0Fun_id,
            AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>.toJava(mutatingSelf.exercise0Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise1Fun_id,
            AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>.toJava(mutatingSelf.exercise1Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise2Fun_id,
            AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>.toJava(mutatingSelf.exercise2Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise3Fun_id,
            AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>.toJava(mutatingSelf.exercise3Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise4Fun_id,
            AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>.toJava(mutatingSelf.exercise4Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise5Fun_id,
            AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>.toJava(mutatingSelf.exercise5Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise6Fun_id,
            AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>.toJava(mutatingSelf.exercise6Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_thunkTwiceMakerFun_id,
            Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.toJava(mutatingSelf.thunkTwiceMakerFun, env: env)
        )
        return result
    }
    public static func mutateJava<R>(_ this: jobject?, env: inout Env, body: (inout Self, inout Env) async throws -> R) async throws -> R {
        var mutatingSelf = try fromJava(this, env: env)
        let result = try await body(&mutatingSelf, &env)
        try env.SetObjectField(
            this, Self._java_const42_id,
            AsyncFunction0Converter<Swift.Int>.toJava(mutatingSelf.const42, env: env)
        )
        try env.SetObjectField(
            this, Self._java_iabs_id,
            AsyncFunction1Converter<Swift.Int, Swift.Int>.toJava(mutatingSelf.iabs, env: env)
        )
        try env.SetObjectField(
            this, Self._java_intCompose_id,
            Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>.toJava(mutatingSelf.intCompose, env: env)
        )
        try env.SetObjectField(
            this, Self._java_add3Things_id,
            AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>.toJava(mutatingSelf.add3Things, env: env)
        )
        try env.SetObjectField(
            this, Self._java_makeList_id,
            AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>.toJava(mutatingSelf.makeList, env: env)
        )
        try env.SetObjectField(
            this, Self._java_fifthThing_id,
            AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>.toJava(mutatingSelf.fifthThing, env: env)
        )
        try env.SetObjectField(
            this, Self._java_six_id,
            AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>.toJava(mutatingSelf.six, env: env)
        )
        try env.SetObjectField(
            this, Self._java_willThrow_id,
            AsyncFunction0Converter<Swift.Int>.toJava(mutatingSelf.willThrow, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise0Fun_id,
            AsyncFunction1Converter<AsyncFunction0Converter<Swift.Int>, Swift.String>.toJava(mutatingSelf.exercise0Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise1Fun_id,
            AsyncFunction1Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, Swift.String>.toJava(mutatingSelf.exercise1Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise2Fun_id,
            AsyncFunction1Converter<Function2Converter<AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>, AsyncFunction1Converter<Swift.Int, Swift.Int>>, Swift.String>.toJava(mutatingSelf.exercise2Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise3Fun_id,
            AsyncFunction1Converter<AsyncFunction3Converter<Swift.Float, Swift.Double, Swift.Int, Swift.Double>, Swift.String>.toJava(mutatingSelf.exercise3Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise4Fun_id,
            AsyncFunction1Converter<AsyncFunction4Converter<Swift.String, Swift.String, Swift.String, Swift.String, ArrayConverter<Swift.String>>, Swift.String>.toJava(mutatingSelf.exercise4Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise5Fun_id,
            AsyncFunction1Converter<AsyncFunction5Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, AsyncFunction0Converter<Swift.Int>>, Swift.String>.toJava(mutatingSelf.exercise5Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_exercise6Fun_id,
            AsyncFunction1Converter<AsyncFunction6Converter<Swift.String, Swift.Int, Swift.Double, Swift.String, AsyncFunction0Converter<Swift.Int>, Swift.Int, Swift.Int>, Swift.String>.toJava(mutatingSelf.exercise6Fun, env: env)
        )
        try env.SetObjectField(
            this, Self._java_thunkTwiceMakerFun_id,
            Function1Converter<AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>, AsyncFunction0Converter<FishyJoesCommonRuntime.VoidConverter>>.toJava(mutatingSelf.thunkTwiceMakerFun, env: env)
        )
        return result
    }
}
