package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(AProtocol) -->
 */
interface AProtocol {
    /**
     * <!-- FishyJoes.export(foo) -->
     */
    var foo: kotlin.String
    /**
     * <!-- FishyJoes.export(baz) -->
     */
    var baz: Boolean
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
    ): Long = __jni_hasADefaultImplementation(this)

    companion object {
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation) -->
         */
        @JvmName("__jni_hasADefaultImplementation")
        private external fun __jni_hasADefaultImplementation(
            self: AProtocol
        ): Long
    }
}
