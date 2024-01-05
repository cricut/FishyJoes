package com.cricut.testapi

import kotlinx.coroutines.*
import kotlinx.coroutines.future.future
import java.lang.Exception
import java.util.concurrent.CompletionException

/**
 * <!-- FishyJoes.export(Functions) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class Functions {

    companion object {
        /**
         * <!-- FishyJoes.export(const42) -->
         */
        val const42: (() -> Long)
          get() = __jni_get_const42()
        @JvmStatic
        @JvmName("__jni_get_const42")
        private external fun __jni_get_const42(): (() -> Long)

        /**
         * <!-- FishyJoes.export(abs) -->
         */
        val abs: ((Long) -> Long)
          get() = __jni_get_abs()
        @JvmStatic
        @JvmName("__jni_get_abs")
        private external fun __jni_get_abs(): ((Long) -> Long)

        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        val intCompose: ((((Long) -> Long), ((Long) -> Long)) -> ((Long) -> Long))
          get() = __jni_get_intCompose()
        @JvmStatic
        @JvmName("__jni_get_intCompose")
        private external fun __jni_get_intCompose(): ((((Long) -> Long), ((Long) -> Long)) -> ((Long) -> Long))

        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        val add3Things: ((Float, Double, Long) -> Double)
          get() = __jni_get_add3Things()
        @JvmStatic
        @JvmName("__jni_get_add3Things")
        private external fun __jni_get_add3Things(): ((Float, Double, Long) -> Double)

        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        val makeList: ((kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
          get() = __jni_get_makeList()
        @JvmStatic
        @JvmName("__jni_get_makeList")
        private external fun __jni_get_makeList(): ((kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)

        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        val fifthThing: ((kotlin.String, Long, Double, kotlin.String, (() -> Long)) -> (() -> Long))
          get() = __jni_get_fifthThing()
        @JvmStatic
        @JvmName("__jni_get_fifthThing")
        private external fun __jni_get_fifthThing(): ((kotlin.String, Long, Double, kotlin.String, (() -> Long)) -> (() -> Long))

        /**
         * <!-- FishyJoes.export(sixthThing) -->
         */
        val sixthThing: ((kotlin.String, Long, Double, kotlin.String, (() -> Long), Long) -> Long)
          get() = __jni_get_sixthThing()
        @JvmStatic
        @JvmName("__jni_get_sixthThing")
        private external fun __jni_get_sixthThing(): ((kotlin.String, Long, Double, kotlin.String, (() -> Long), Long) -> Long)

        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        fun exercise0(
            fn: (() -> Long)
        ): kotlin.String = __jni_exercise0(fn)
        @JvmStatic
        @JvmName("__jni_exercise0")
        private external fun __jni_exercise0(
            fn: (() -> Long)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        fun exercise1(
            fn: ((Long) -> Long)
        ): kotlin.String = __jni_exercise1(fn)
        @JvmStatic
        @JvmName("__jni_exercise1")
        private external fun __jni_exercise1(
            fn: ((Long) -> Long)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        fun exercise2(
            fn: ((((Long) -> Long), ((Long) -> Long)) -> ((Long) -> Long))
        ): kotlin.String = __jni_exercise2(fn)
        @JvmStatic
        @JvmName("__jni_exercise2")
        private external fun __jni_exercise2(
            fn: ((((Long) -> Long), ((Long) -> Long)) -> ((Long) -> Long))
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        fun exercise3(
            fn: ((Float, Double, Long) -> Double)
        ): kotlin.String = __jni_exercise3(fn)
        @JvmStatic
        @JvmName("__jni_exercise3")
        private external fun __jni_exercise3(
            fn: ((Float, Double, Long) -> Double)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        fun exercise4(
            fn: ((kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
        ): kotlin.String = __jni_exercise4(fn)
        @JvmStatic
        @JvmName("__jni_exercise4")
        private external fun __jni_exercise4(
            fn: ((kotlin.String, kotlin.String, kotlin.String, kotlin.String) -> kotlin.collections.List<kotlin.String>)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        fun exercise5(
            fn: ((kotlin.String, Long, Double, kotlin.String, (() -> Long)) -> (() -> Long))
        ): kotlin.String = __jni_exercise5(fn)
        @JvmStatic
        @JvmName("__jni_exercise5")
        private external fun __jni_exercise5(
            fn: ((kotlin.String, Long, Double, kotlin.String, (() -> Long)) -> (() -> Long))
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        fun exercise6(
            fn: ((kotlin.String, Long, Double, kotlin.String, (() -> Long), Long) -> Long)
        ): kotlin.String = __jni_exercise6(fn)
        @JvmStatic
        @JvmName("__jni_exercise6")
        private external fun __jni_exercise6(
            fn: ((kotlin.String, Long, Double, kotlin.String, (() -> Long), Long) -> Long)
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        fun willThrow(
        ): kotlin.String = __jni_willThrow()
        @JvmStatic
        @JvmName("__jni_willThrow")
        private external fun __jni_willThrow(
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(async42Func) -->
         */
        suspend fun async42Func(
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_async42Func(
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_async42Func")
        private external fun __jni_async42Func(
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncYieldFunc) -->
         */
        suspend fun asyncYieldFunc(
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncYieldFunc(
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncYieldFunc")
        private external fun __jni_asyncYieldFunc(
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncSleepFunc) -->
         */
        suspend fun asyncSleepFunc(
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncSleepFunc(
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncSleepFunc")
        private external fun __jni_asyncSleepFunc(
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncVoidFunc) -->
         */
        suspend fun asyncVoidFunc(
        ): kotlin.Unit {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<kotlin.Unit?> ->
                        __jni_asyncVoidFunc(
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncVoidFunc")
        private external fun __jni_asyncVoidFunc(
            successContinuation: (kotlin.Unit?) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncCallbackFunc0) -->
         */
        suspend fun asyncCallbackFunc0(
            callback: (suspend () -> Long)
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncCallbackFunc0(
                            {
                                try {
                                    CoroutineScope(Dispatchers.Default).future {
                                        callback()
                                    }.join()
                                } catch (e: CompletionException) {
                                    throw e.cause ?: e
                                }
                            },
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncCallbackFunc0")
        private external fun __jni_asyncCallbackFunc0(
            callback: (() -> Long),
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncCallbackFunc1) -->
         */
        suspend fun asyncCallbackFunc1(
            callback: (suspend (Long) -> Long)
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncCallbackFunc1(
                            { p0 ->
                                try {
                                    CoroutineScope(Dispatchers.Default).future {
                                        callback( p0)
                                    }.join()
                                } catch (e: Exception) {
                                    throw e.cause ?: e
                                }
                            },
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncCallbackFunc1")
        private external fun __jni_asyncCallbackFunc1(
            callback: ((Long) -> Long),
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncCallbackFunc2) -->
         */
        suspend fun asyncCallbackFunc2(
            callback: (suspend (Long, Long) -> Long)
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncCallbackFunc2(
                            { p0, p1 ->
                                try {
                                    CoroutineScope(Dispatchers.Default).future {
                                        callback( p0, p1)
                                    }.join()
                                } catch (e: Exception) {
                                    throw e.cause ?: e
                                }
                            },
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncCallbackFunc2")
        private external fun __jni_asyncCallbackFunc2(
            callback: ((Long, Long) -> Long),
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncCallbackFunc3) -->
         */
        suspend fun asyncCallbackFunc3(
            callback: (suspend (Long, Long, Long) -> Long)
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncCallbackFunc3(
                            { p0, p1, p2 ->
                                try {
                                    CoroutineScope(Dispatchers.Default).future {
                                        callback( p0, p1, p2)
                                    }.join()
                                } catch (e: Exception) {
                                    throw e.cause ?: e
                                }
                            },
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncCallbackFunc3")
        private external fun __jni_asyncCallbackFunc3(
            callback: ((Long, Long, Long) -> Long),
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncCallbackFunc4) -->
         */
        suspend fun asyncCallbackFunc4(
            callback: (suspend (Long, Long, Long, Long) -> Long)
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncCallbackFunc4(
                            { p0, p1, p2, p3 ->
                                try {
                                    CoroutineScope(Dispatchers.Default).future {
                                        callback( p0, p1, p2, p3)
                                    }.join()
                                } catch (e: Exception) {
                                    throw e.cause ?: e
                                }
                            },
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncCallbackFunc4")
        private external fun __jni_asyncCallbackFunc4(
            callback: ((Long, Long, Long, Long) -> Long),
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncCallbackFunc5) -->
         */
        suspend fun asyncCallbackFunc5(
            callback: (suspend (Long, Long, Long, Long, Long) -> Long)
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncCallbackFunc5(
                            { p0, p1, p2, p3, p4 ->
                                try {
                                    CoroutineScope(Dispatchers.Default).future {
                                        callback( p0, p1, p2, p3, p4)
                                    }.join()
                                } catch (e: Exception) {
                                    throw e.cause ?: e
                                }
                            },
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncCallbackFunc5")
        private external fun __jni_asyncCallbackFunc5(
            callback: ((Long, Long, Long, Long, Long) -> Long),
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncCallbackFunc6) -->
         */
        suspend fun asyncCallbackFunc6(
            callback: (suspend (Long, Long, Long, Long, Long, Long) -> Long)
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncCallbackFunc6(
                            { p0, p1, p2, p3, p4, p5 ->
                                try {
                                    CoroutineScope(Dispatchers.Default).future {
                                        callback( p0, p1, p2, p3, p4, p5)
                                    }.join()
                                } catch (e: Exception) {
                                    throw e.cause ?: e
                                }
                            },
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncCallbackFunc6")
        private external fun __jni_asyncCallbackFunc6(
            callback: ((Long, Long, Long, Long, Long, Long) -> Long),
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncDoubleFunc) -->
         */
        suspend fun asyncDoubleFunc(
            d: Double
        ): Double {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Double> ->
                        __jni_asyncDoubleFunc(
                            d,
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncDoubleFunc")
        private external fun __jni_asyncDoubleFunc(
            d: Double,
            successContinuation: (Double) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncMultipleArgs) -->
         */
        suspend fun asyncMultipleArgs(
            i: Long,
            j: (suspend () -> Long)
        ): Long {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<Long> ->
                        __jni_asyncMultipleArgs(
                            i,
                            {
                                try {
                                    CoroutineScope(Dispatchers.Default).future {
                                        j()
                                    }.join()
                                } catch (e: Exception) {
                                    throw e.cause ?: e
                                }
                            },
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncMultipleArgs")
        private external fun __jni_asyncMultipleArgs(
            i: Long,
            j: (() -> Long),
            successContinuation: (Long) -> Unit,
            failureContinuation: (String) -> Unit
        )

        /**
         * <!-- FishyJoes.export(asyncThrowingFunc) -->
         */
        suspend fun asyncThrowingFunc(
        ): kotlin.Unit {
            return coroutineScope {
                async {
                    suspendCancellableCoroutine { continuation: CancellableContinuation<kotlin.Unit?> ->
                        __jni_asyncThrowingFunc(
                            { value ->
                                continuation.resume(value, null)
                            }
                        ) { message ->
                            continuation.cancel(Error(message))
                        }
                    }
                }.await()
            }
        }
        @JvmStatic
        @JvmName("__jni_asyncThrowingFunc")
        private external fun __jni_asyncThrowingFunc(
            successContinuation: (kotlin.Unit?) -> Unit,
            failureContinuation: (String) -> Unit
        )

        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.exportReference(Functions.TheError) -->
     */
    class TheError private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {

        companion object {
            init { loadNativeLibs() }
        }
    }
}
