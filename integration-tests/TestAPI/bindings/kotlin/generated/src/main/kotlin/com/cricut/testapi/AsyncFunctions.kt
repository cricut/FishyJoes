/**
 * <!-- FishyJoes.export(AsyncFunctions) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class AsyncFunctions {

    companion object {
        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        val add3Things: (suspend (Float, Double, Long) -> Double)
          get() = __jni_get_add3Things()
        @JvmStatic
        @JvmName("__jni_get_add3Things")
        private external fun __jni_get_add3Things(): (suspend (Float, Double, Long) -> Double)

        /**
         * <!-- FishyJoes.export(const42) -->
         */
        val const42: (suspend () -> Long)
          get() = __jni_get_const42()
        @JvmStatic
        @JvmName("__jni_get_const42")
        private external fun __jni_get_const42(): (suspend () -> Long)

        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        val fifthThing: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
          get() = __jni_get_fifthThing()
        @JvmStatic
        @JvmName("__jni_get_fifthThing")
        private external fun __jni_get_fifthThing(): (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))

        /**
         * <!-- FishyJoes.export(abs) -->
         */
        val abs: (suspend (Long) -> Long)
          get() = __jni_get_abs()
        @JvmStatic
        @JvmName("__jni_get_abs")
        private external fun __jni_get_abs(): (suspend (Long) -> Long)

        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        val intCompose: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
          get() = __jni_get_intCompose()
        @JvmStatic
        @JvmName("__jni_get_intCompose")
        private external fun __jni_get_intCompose(): (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))

        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        val makeList: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
          get() = __jni_get_makeList()
        @JvmStatic
        @JvmName("__jni_get_makeList")
        private external fun __jni_get_makeList(): (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)

        /**
         * <!-- FishyJoes.export(sixthThing) -->
         */
        val sixthThing: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
          get() = __jni_get_sixthThing()
        @JvmStatic
        @JvmName("__jni_get_sixthThing")
        private external fun __jni_get_sixthThing(): (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)

        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        val willThrow: (suspend () -> Long)
          get() = __jni_get_willThrow()
        @JvmStatic
        @JvmName("__jni_get_willThrow")
        private external fun __jni_get_willThrow(): (suspend () -> Long)

        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        suspend fun exercise0(
            fn: (suspend () -> Long)
        ): kotlin.String = __jni_exercise0(fn).await()
        @JvmStatic
        @JvmName("__jni_exercise0")
        private external fun __jni_exercise0(
            fn: (suspend () -> Long)
        ): kotlinx.coroutines.Deferred<kotlin.String>

        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        suspend fun exercise1(
            fn: (suspend (Long) -> Long)
        ): kotlin.String = __jni_exercise1(fn).await()
        @JvmStatic
        @JvmName("__jni_exercise1")
        private external fun __jni_exercise1(
            fn: (suspend (Long) -> Long)
        ): kotlinx.coroutines.Deferred<kotlin.String>

        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        suspend fun exercise2(
            fn: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
        ): kotlin.String = __jni_exercise2(fn).await()
        @JvmStatic
        @JvmName("__jni_exercise2")
        private external fun __jni_exercise2(
            fn: (((suspend (Long) -> Long), (suspend (Long) -> Long)) -> (suspend (Long) -> Long))
        ): kotlinx.coroutines.Deferred<kotlin.String>

        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        suspend fun exercise3(
            fn: (suspend (Float, Double, Long) -> Double)
        ): kotlin.String = __jni_exercise3(fn).await()
        @JvmStatic
        @JvmName("__jni_exercise3")
        private external fun __jni_exercise3(
            fn: (suspend (Float, Double, Long) -> Double)
        ): kotlinx.coroutines.Deferred<kotlin.String>

        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        suspend fun exercise4(
            fn: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
        ): kotlin.String = __jni_exercise4(fn).await()
        @JvmStatic
        @JvmName("__jni_exercise4")
        private external fun __jni_exercise4(
            fn: (suspend (kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
        ): kotlinx.coroutines.Deferred<kotlin.String>

        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        suspend fun exercise5(
            fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
        ): kotlin.String = __jni_exercise5(fn).await()
        @JvmStatic
        @JvmName("__jni_exercise5")
        private external fun __jni_exercise5(
            fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long)) -> (suspend () -> Long))
        ): kotlinx.coroutines.Deferred<kotlin.String>

        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        suspend fun exercise6(
            fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
        ): kotlin.String = __jni_exercise6(fn).await()
        @JvmStatic
        @JvmName("__jni_exercise6")
        private external fun __jni_exercise6(
            fn: (suspend (kotlin.String, Long, Double, kotlin.String, (suspend () -> Long), Long) -> Long)
        ): kotlinx.coroutines.Deferred<kotlin.String>

        /**
         * <!-- FishyJoes.export(thunkTwiceMaker) -->
         */
        fun thunkTwiceMaker(
            thunk: (suspend () -> kotlin.Unit)
        ): (suspend () -> kotlin.Unit) = __jni_thunkTwiceMaker(thunk)
        @JvmStatic
        @JvmName("__jni_thunkTwiceMaker")
        private external fun __jni_thunkTwiceMaker(
            thunk: (suspend () -> kotlin.Unit)
        ): (suspend () -> kotlin.Unit)

        init { loadNativeLibs() }
    }
}

package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*
