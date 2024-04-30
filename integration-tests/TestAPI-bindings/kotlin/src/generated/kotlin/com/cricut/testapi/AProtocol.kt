package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(AProtocol) -->
 */
interface AProtocol {
    /**
     * <!-- FishyJoes.export(baz) -->
     */
    val baz: Boolean
    /**
     * <!-- FishyJoes.export(foo) -->
     */
    val foo: kotlin.String
    /**
     * <!-- FishyJoes.export(bar) -->
     */
    fun bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol

    /**
     * <!-- FishyJoes.export(hasADefaultImplementation) -->
     */
    fun hasADefaultImplementation(
        x: Long,
        y: Double
    ): kotlin.String = __jni__default_hasADefaultImplementation(this, x, y)

    /**
     * <!-- FishyJoes.export(hasADefaultImplementation2) -->
     */
    fun hasADefaultImplementation2(
        a: kotlin.String,
        b: Boolean,
        c: Double
    ): Double = __jni__default_hasADefaultImplementation2(this, a, b, c)

    companion object {
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation) -->
         */
        @JvmName("__jni__default_hasADefaultImplementation")
        private external fun __jni__default_hasADefaultImplementation(
            self: AProtocol,
            x: Long,
            y: Double
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(hasADefaultImplementation2) -->
         */
        @JvmName("__jni__default_hasADefaultImplementation2")
        private external fun __jni__default_hasADefaultImplementation2(
            self: AProtocol,
            a: kotlin.String,
            b: Boolean,
            c: Double
        ): Double

        init {
            loadNativeLibs()
        }
    }
}
