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
        x: Long,
        y: Long
    ): kotlin.String = __jni__default_hasADefaultImplementation(this, x, y)

    companion object {
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation) -->
         */
        @JvmName("__jni__default_hasADefaultImplementation")
        private external fun __jni__default_hasADefaultImplementation(
            self: AProtocol,
            x: Long,
            y: Long
        ): kotlin.String
    }
}
