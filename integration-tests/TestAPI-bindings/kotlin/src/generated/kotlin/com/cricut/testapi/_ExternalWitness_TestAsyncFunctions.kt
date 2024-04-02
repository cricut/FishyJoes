package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

private class _ExternalWitness_TestAsyncFunctions private constructor(_swiftReference: Long): TestAsyncFunctions, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(const42) -->
     */
    override val const42: (suspend () -> Long)
      get() = __jni_get_const42()
    @JvmName("__jni_get_const42")
    private external fun __jni_get_const42(): (suspend () -> Long)

    /**
     * <!-- FishyJoes.export(iabs) -->
     */
    override val iabs: (suspend (Long) -> Long)
      get() = __jni_get_iabs()
    @JvmName("__jni_get_iabs")
    private external fun __jni_get_iabs(): (suspend (Long) -> Long)

    /**
     * <!-- FishyJoes.export(intCompose) -->
     */
    override val intCompose: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
      get() = __jni_get_intCompose()
    @JvmName("__jni_get_intCompose")
    private external fun __jni_get_intCompose(): (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))

    /**
     * <!-- FishyJoes.export(add3Things) -->
     */
    override val add3Things: (suspend (Float, Double, Long) -> Double)
      get() = __jni_get_add3Things()
    @JvmName("__jni_get_add3Things")
    private external fun __jni_get_add3Things(): (suspend (Float, Double, Long) -> Double)

    /**
     * <!-- FishyJoes.export(makeList) -->
     */
    override val makeList: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
      get() = __jni_get_makeList()
    @JvmName("__jni_get_makeList")
    private external fun __jni_get_makeList(): (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)

    /**
     * <!-- FishyJoes.export(fifthThing) -->
     */
    override val fifthThing: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
      get() = __jni_get_fifthThing()
    @JvmName("__jni_get_fifthThing")
    private external fun __jni_get_fifthThing(): (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))

    /**
     * <!-- FishyJoes.export(six) -->
     */
    override val six: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
      get() = __jni_get_six()
    @JvmName("__jni_get_six")
    private external fun __jni_get_six(): (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)

    /**
     * <!-- FishyJoes.export(willThrow) -->
     */
    override val willThrow: (suspend () -> Long)
      get() = __jni_get_willThrow()
    @JvmName("__jni_get_willThrow")
    private external fun __jni_get_willThrow(): (suspend () -> Long)

    /**
     * <!-- FishyJoes.export(exercise0) -->
     */
    override suspend fun exercise0(
        fn: (suspend () -> Long)
    ): kotlin.String = __jni_exercise0(fn).await()
    @JvmName("__jni_exercise0")
    private external fun __jni_exercise0(
        fn: (suspend () -> Long)
    ): kotlinx.coroutines.Deferred<kotlin.String>

    /**
     * <!-- FishyJoes.export(exercise1) -->
     */
    override suspend fun exercise1(
        fn: (suspend (Long) -> Long)
    ): kotlin.String = __jni_exercise1(fn).await()
    @JvmName("__jni_exercise1")
    private external fun __jni_exercise1(
        fn: (suspend (Long) -> Long)
    ): kotlinx.coroutines.Deferred<kotlin.String>

    /**
     * <!-- FishyJoes.export(exercise2) -->
     */
    override suspend fun exercise2(
        fn: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
    ): kotlin.String = __jni_exercise2(fn).await()
    @JvmName("__jni_exercise2")
    private external fun __jni_exercise2(
        fn: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
    ): kotlinx.coroutines.Deferred<kotlin.String>

    /**
     * <!-- FishyJoes.export(exercise3) -->
     */
    override suspend fun exercise3(
        fn: (suspend (Float, Double, Long) -> Double)
    ): kotlin.String = __jni_exercise3(fn).await()
    @JvmName("__jni_exercise3")
    private external fun __jni_exercise3(
        fn: (suspend (Float, Double, Long) -> Double)
    ): kotlinx.coroutines.Deferred<kotlin.String>

    /**
     * <!-- FishyJoes.export(exercise4) -->
     */
    override suspend fun exercise4(
        fn: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
    ): kotlin.String = __jni_exercise4(fn).await()
    @JvmName("__jni_exercise4")
    private external fun __jni_exercise4(
        fn: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
    ): kotlinx.coroutines.Deferred<kotlin.String>

    /**
     * <!-- FishyJoes.export(exercise5) -->
     */
    override suspend fun exercise5(
        fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
    ): kotlin.String = __jni_exercise5(fn).await()
    @JvmName("__jni_exercise5")
    private external fun __jni_exercise5(
        fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
    ): kotlinx.coroutines.Deferred<kotlin.String>

    /**
     * <!-- FishyJoes.export(exercise6) -->
     */
    override suspend fun exercise6(
        fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
    ): kotlin.String = __jni_exercise6(fn).await()
    @JvmName("__jni_exercise6")
    private external fun __jni_exercise6(
        fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
    ): kotlinx.coroutines.Deferred<kotlin.String>

    /**
     * <!-- FishyJoes.export(thunkTwiceMaker) -->
     */
    override fun thunkTwiceMaker(
        thunk: (suspend () -> kotlin.Unit)
    ): (suspend () -> kotlin.Unit) = __jni_thunkTwiceMaker(thunk)
    @JvmName("__jni_thunkTwiceMaker")
    private external fun __jni_thunkTwiceMaker(
        thunk: (suspend () -> kotlin.Unit)
    ): (suspend () -> kotlin.Unit)

    /**
     * <!-- FishyJoes.export(witness) -->
     */
    override fun witness(
    ): com.cricut.testapi.TestAsyncFunctions = __jni_witness()
    @JvmName("__jni_witness")
    private external fun __jni_witness(
    ): com.cricut.testapi.TestAsyncFunctions

    companion object {
        init { loadNativeLibs() }
    }
}
