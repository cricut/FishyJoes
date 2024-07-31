package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(AProtocolImplementation) -->
 */
data class AProtocolImplementation(
    override var foo: kotlin.String,
    override var baz: Boolean
): com.cricut.testapi.AProtocol {
    /**
     * <!-- FishyJoes.export(bar) -->
     */
    override fun bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol = __jni_bar(x, y)
    @JvmName("__jni_bar")
    private external fun __jni_bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol

    /**
     * <!-- FishyJoes.export(hasADefaultImplementation) -->
     */
    override fun hasADefaultImplementation(
        x: Long,
        y: Double
    ): kotlin.String = __jni__default_hasADefaultImplementation(x, y)
    @JvmName("__jni__default_hasADefaultImplementation")
    private external fun __jni__default_hasADefaultImplementation(
        x: Long,
        y: Double
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(hasADefaultImplementation2) -->
     */
    override fun hasADefaultImplementation2(
        a: kotlin.String,
        b: Boolean,
        c: kotlin.String
    ): kotlin.String = __jni__default_hasADefaultImplementation2(a, b, c)
    @JvmName("__jni__default_hasADefaultImplementation2")
    private external fun __jni__default_hasADefaultImplementation2(
        a: kotlin.String,
        b: Boolean,
        c: kotlin.String
    ): kotlin.String

    companion object {
        init { loadNativeLibs() }
    }
}
