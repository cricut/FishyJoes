package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.exportReference(Methods) -->
 */
class Methods private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
    /**
     * <!-- FishyJoes.export(instanceGet) -->
     */
    val instanceGet: Long
      get() = __jni_get_instanceGet()
    @JvmName("__jni_get_instanceGet")
    private external fun __jni_get_instanceGet(): Long

    /**
     * <!-- FishyJoes.export(garply) -->
     */
    val garply: Long
      get() = __jni_get_garply()
    @JvmName("__jni_get_garply")
    private external fun __jni_get_garply(): Long

    /**
     * <!-- FishyJoes.export(instanceModifiable) -->
     */
    var instanceModifiable: Long
      get() = __jni_get_instanceModifiable()
      set(value) { __jni_set_instanceModifiable(value) } 
    @JvmName("__jni_get_instanceModifiable")
    private external fun __jni_get_instanceModifiable(): Long
    @JvmName("__jni_set_instanceModifiable")
    private external fun __jni_set_instanceModifiable(newValue: Long)

    /**
     * <!-- FishyJoes.export(instanceStored) -->
     */
    var instanceStored: Long
      get() = __jni_get_instanceStored()
      set(value) { __jni_set_instanceStored(value) } 
    @JvmName("__jni_get_instanceStored")
    private external fun __jni_get_instanceStored(): Long
    @JvmName("__jni_set_instanceStored")
    private external fun __jni_set_instanceStored(newValue: Long)

    /**
     * <!-- FishyJoes.exportAsMethod(instanceGetMethod) -->
     */
    fun instanceGetMethod(
    ): Long = __jni_instanceGetMethod()
    @JvmName("__jni_instanceGetMethod")
    private external fun __jni_instanceGetMethod(
    ): Long

    /**
     * <!-- FishyJoes.export(doublePlusGood) -->
     */
    fun doublePlusGood(
        a: Long,
        b: Double
    ): Long = __jni_doublePlusGood(a, b)
    @JvmName("__jni_doublePlusGood")
    private external fun __jni_doublePlusGood(
        a: Long,
        b: Double
    ): Long

    /**
     * <!-- FishyJoes.export(async42) -->
     */
    suspend fun async42(
    ): Long = __jni_async42().await()
    @JvmName("__jni_async42")
    private external fun __jni_async42(
    ): kotlinx.coroutines.Deferred<Long>

    /**
     * <!-- FishyJoes.export(asyncYield) -->
     */
    suspend fun asyncYield(
    ): Long = __jni_asyncYield().await()
    @JvmName("__jni_asyncYield")
    private external fun __jni_asyncYield(
    ): kotlinx.coroutines.Deferred<Long>

    /**
     * <!-- FishyJoes.export(asyncSleep) -->
     */
    suspend fun asyncSleep(
    ): Long = __jni_asyncSleep().await()
    @JvmName("__jni_asyncSleep")
    private external fun __jni_asyncSleep(
    ): kotlinx.coroutines.Deferred<Long>

    /**
     * <!-- FishyJoes.export(asyncVoid) -->
     */
    suspend fun asyncVoid(
    ): kotlin.Unit = __jni_asyncVoid().await()
    @JvmName("__jni_asyncVoid")
    private external fun __jni_asyncVoid(
    ): kotlinx.coroutines.Deferred<kotlin.Unit>

    /**
     * <!-- FishyJoes.export(asyncDouble) -->
     */
    suspend fun asyncDouble(
        d: Double
    ): Double = __jni_asyncDouble(d).await()
    @JvmName("__jni_asyncDouble")
    private external fun __jni_asyncDouble(
        d: Double
    ): kotlinx.coroutines.Deferred<Double>

    /**
     * <!-- FishyJoes.export(asyncMultipleArgs) -->
     */
    suspend fun asyncMultipleArgs(
        i: Long,
        j: (suspend () -> Long)
    ): Long = __jni_asyncMultipleArgs(i, j).await()
    @JvmName("__jni_asyncMultipleArgs")
    private external fun __jni_asyncMultipleArgs(
        i: Long,
        j: (suspend () -> Long)
    ): kotlinx.coroutines.Deferred<Long>

    /**
     * <!-- FishyJoes.export(asyncThrowing) -->
     */
    suspend fun asyncThrowing(
    ): kotlin.Unit = __jni_asyncThrowing().await()
    @JvmName("__jni_asyncThrowing")
    private external fun __jni_asyncThrowing(
    ): kotlinx.coroutines.Deferred<kotlin.Unit>

    /**
     * <!-- FishyJoes.export(asyncCallbackFunc0) -->
     */
    suspend fun asyncCallbackFunc0(
        callback: (suspend () -> Long)
    ): Long = __jni_asyncCallbackFunc0(callback).await()
    @JvmName("__jni_asyncCallbackFunc0")
    private external fun __jni_asyncCallbackFunc0(
        callback: (suspend () -> Long)
    ): kotlinx.coroutines.Deferred<Long>

    companion object {
        /**
         * <!-- FishyJoes.export(staticGet) -->
         */
        val staticGet: Long
          get() = __jni_get_staticGet()
        @JvmStatic
        @JvmName("__jni_get_staticGet")
        private external fun __jni_get_staticGet(): Long

        /**
         * <!-- FishyJoes.export(staticModifiable) -->
         */
        var staticModifiable: Long
          get() = __jni_get_staticModifiable()
          set(value) { __jni_set_staticModifiable(value) } 
        @JvmStatic
        @JvmName("__jni_get_staticModifiable")
        private external fun __jni_get_staticModifiable(): Long
        @JvmStatic
        @JvmName("__jni_set_staticModifiable")
        private external fun __jni_set_staticModifiable(newValue: Long)

        /**
         * <!-- FishyJoes.export(staticStored) -->
         */
        var staticStored: Long
          get() = __jni_get_staticStored()
          set(value) { __jni_set_staticStored(value) } 
        @JvmStatic
        @JvmName("__jni_get_staticStored")
        private external fun __jni_get_staticStored(): Long
        @JvmStatic
        @JvmName("__jni_set_staticStored")
        private external fun __jni_set_staticStored(newValue: Long)

        /**
         * <!-- FishyJoes.exportAsMethod(staticGetMethod) -->
         */
        fun staticGetMethod(
        ): Long = __jni_staticGetMethod()
        @JvmStatic
        @JvmName("__jni_staticGetMethod")
        private external fun __jni_staticGetMethod(
        ): Long

        /**
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
        ): com.cricut.testapi.Methods = __jni_create()
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
        ): com.cricut.testapi.Methods

        /**
         * <!-- FishyJoes.export(staticAsync42) -->
         */
        suspend fun staticAsync42(
        ): Long = __jni_staticAsync42().await()
        @JvmStatic
        @JvmName("__jni_staticAsync42")
        private external fun __jni_staticAsync42(
        ): kotlinx.coroutines.Deferred<Long>

        /**
         * <!-- FishyJoes.export(staticAsyncYield) -->
         */
        suspend fun staticAsyncYield(
        ): Long = __jni_staticAsyncYield().await()
        @JvmStatic
        @JvmName("__jni_staticAsyncYield")
        private external fun __jni_staticAsyncYield(
        ): kotlinx.coroutines.Deferred<Long>

        /**
         * <!-- FishyJoes.export(staticAsyncSleep) -->
         */
        suspend fun staticAsyncSleep(
        ): Long = __jni_staticAsyncSleep().await()
        @JvmStatic
        @JvmName("__jni_staticAsyncSleep")
        private external fun __jni_staticAsyncSleep(
        ): kotlinx.coroutines.Deferred<Long>

        /**
         * <!-- FishyJoes.export(staticAsyncVoid) -->
         */
        suspend fun staticAsyncVoid(
        ): kotlin.Unit = __jni_staticAsyncVoid().await()
        @JvmStatic
        @JvmName("__jni_staticAsyncVoid")
        private external fun __jni_staticAsyncVoid(
        ): kotlinx.coroutines.Deferred<kotlin.Unit>

        /**
         * <!-- FishyJoes.export(staticAsyncDouble) -->
         */
        suspend fun staticAsyncDouble(
            d: Double
        ): Double = __jni_staticAsyncDouble(d).await()
        @JvmStatic
        @JvmName("__jni_staticAsyncDouble")
        private external fun __jni_staticAsyncDouble(
            d: Double
        ): kotlinx.coroutines.Deferred<Double>

        /**
         * <!-- FishyJoes.export(staticAsyncMultipleArgs) -->
         */
        suspend fun staticAsyncMultipleArgs(
            i: Long,
            j: (suspend () -> Long)
        ): Long = __jni_staticAsyncMultipleArgs(i, j).await()
        @JvmStatic
        @JvmName("__jni_staticAsyncMultipleArgs")
        private external fun __jni_staticAsyncMultipleArgs(
            i: Long,
            j: (suspend () -> Long)
        ): kotlinx.coroutines.Deferred<Long>

        /**
         * <!-- FishyJoes.export(staticAsyncThrowing) -->
         */
        suspend fun staticAsyncThrowing(
        ): kotlin.Unit = __jni_staticAsyncThrowing().await()
        @JvmStatic
        @JvmName("__jni_staticAsyncThrowing")
        private external fun __jni_staticAsyncThrowing(
        ): kotlinx.coroutines.Deferred<kotlin.Unit>

        /**
         * <!-- FishyJoes.export(staticAsyncCallbackFunc0) -->
         */
        suspend fun staticAsyncCallbackFunc0(
            callback: (suspend () -> Long)
        ): Long = __jni_staticAsyncCallbackFunc0(callback).await()
        @JvmStatic
        @JvmName("__jni_staticAsyncCallbackFunc0")
        private external fun __jni_staticAsyncCallbackFunc0(
            callback: (suspend () -> Long)
        ): kotlinx.coroutines.Deferred<Long>

        init { loadNativeLibs() }
    }
}
