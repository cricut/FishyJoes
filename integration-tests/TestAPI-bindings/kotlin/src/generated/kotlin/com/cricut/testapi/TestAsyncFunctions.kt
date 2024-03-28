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

    /**
     * <!-- FishyJoes.export(exercise1) -->
     */
    suspend fun exercise1(
        fn: (suspend (Long) -> Long)
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(exercise2) -->
     */
    suspend fun exercise2(
        fn: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(exercise3) -->
     */
    suspend fun exercise3(
        fn: (suspend (Float, Double, Long) -> Double)
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(exercise4) -->
     */
    suspend fun exercise4(
        fn: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(exercise5) -->
     */
    suspend fun exercise5(
        fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(exercise6) -->
     */
    suspend fun exercise6(
        fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
    ): kotlin.String

    companion object {
        @JvmStatic
        fun exercise0(
            self: TestAsyncFunctions,
            fn: (suspend () -> Long)
        ): Deferred<kotlin.String> = CoroutineScope(Dispatchers.Default).async { self.exercise0(fn) }

        @JvmStatic
        fun exercise1(
            self: TestAsyncFunctions,
            fn: (suspend (Long) -> Long)
        ): Deferred<kotlin.String> = CoroutineScope(Dispatchers.Default).async { self.exercise1(fn) }

        @JvmStatic
        fun exercise2(
            self: TestAsyncFunctions,
            fn: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
        ): Deferred<kotlin.String> = CoroutineScope(Dispatchers.Default).async { self.exercise2(fn) }

        @JvmStatic
        fun exercise3(
            self: TestAsyncFunctions,
            fn: (suspend (Float, Double, Long) -> Double)
        ): Deferred<kotlin.String> = CoroutineScope(Dispatchers.Default).async { self.exercise3(fn) }

        @JvmStatic
        fun exercise4(
            self: TestAsyncFunctions,
            fn: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
        ): Deferred<kotlin.String> = CoroutineScope(Dispatchers.Default).async { self.exercise4(fn) }

        @JvmStatic
        fun exercise5(
            self: TestAsyncFunctions,
            fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
        ): Deferred<kotlin.String> = CoroutineScope(Dispatchers.Default).async { self.exercise5(fn) }

        @JvmStatic
        fun exercise6(
            self: TestAsyncFunctions,
            fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
        ): Deferred<kotlin.String> = CoroutineScope(Dispatchers.Default).async { self.exercise6(fn) }

        init {
            loadNativeLibs()
        }
    }
}
