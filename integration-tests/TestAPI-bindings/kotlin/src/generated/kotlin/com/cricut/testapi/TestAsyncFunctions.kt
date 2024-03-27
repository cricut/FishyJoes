package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestAsyncFunctions) -->
 */
interface TestAsyncFunctions {
    /**
     * <!-- FishyJoes.export(const42) -->
     */
    val const42: (suspend () -> Long)
    /**
     * <!-- FishyJoes.export(iabs) -->
     */
    val iabs: (suspend (Long) -> Long)
    /**
     * <!-- FishyJoes.export(intCompose) -->
     */
    val intCompose: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
    /**
     * <!-- FishyJoes.export(add3Things) -->
     */
    val add3Things: (suspend (Float, Double, Long) -> Double)
    /**
     * <!-- FishyJoes.export(makeList) -->
     */
    val makeList: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
    /**
     * <!-- FishyJoes.export(fifthThing) -->
     */
    val fifthThing: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
    /**
     * <!-- FishyJoes.export(six) -->
     */
    val six: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
    /**
     * <!-- FishyJoes.export(willThrow) -->
     */
    val willThrow: (suspend () -> Long)
    /**
     * <!-- FishyJoes.export(exercise0) -->
     */
    suspend fun exercise0(
        fn: (suspend () -> Long)
    ): kotlin.String

    companion object {
        @JvmStatic
        fun exercise0(
            self: TestAsyncFunctions,
            fn: (suspend () -> Long)
        ): Deferred<kotlin.String> = CoroutineScope(Dispatchers.Default).async { self.exercise0(fn) }
        init {
            loadNativeLibs()
        }
    }
}
