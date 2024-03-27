package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct, conformances: [TestAsyncFunctions]) -->
 */
data class TestAsyncForeignSideFunctionsStruct(
    override val const42: (suspend () -> Long),
    override val iabs: (suspend (Long) -> Long),
    override val intCompose: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long)),
    override val add3Things: (suspend (Float, Double, Long) -> Double),
    override val makeList: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>),
    override val fifthThing: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long)),
    override val six: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long),
    override val willThrow: (suspend () -> Long),
    val exercise0Fun: (suspend ((suspend () -> Long)) -> kotlin.String),
    val exercise1Fun: (suspend ((suspend (Long) -> Long)) -> kotlin.String)
): TestAsyncFunctions {
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

    companion object {
        init { loadNativeLibs() }
    }
}
