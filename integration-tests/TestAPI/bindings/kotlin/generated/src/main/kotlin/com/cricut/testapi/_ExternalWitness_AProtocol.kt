package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_AProtocol private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), com.cricut.testapi.AProtocol {
    /**
     * <!-- FishyJoes.export(baz) -->
     */
    override val baz: Boolean
      get() = __jni_get_baz()
    @JvmName("__jni_get_baz")
    private external fun __jni_get_baz(): Boolean

    /**
     * <!-- FishyJoes.export(foo) -->
     */
    override val foo: kotlin.String
      get() = __jni_get_foo()
    @JvmName("__jni_get_foo")
    private external fun __jni_get_foo(): kotlin.String

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
    ): kotlin.String = __jni_hasADefaultImplementation(x, y)
    @JvmName("__jni_hasADefaultImplementation")
    private external fun __jni_hasADefaultImplementation(
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
    ): kotlin.String = __jni_hasADefaultImplementation2(a, b, c)
    @JvmName("__jni_hasADefaultImplementation2")
    private external fun __jni_hasADefaultImplementation2(
        a: kotlin.String,
        b: Boolean,
        c: kotlin.String
    ): kotlin.String

    companion object {
        init { loadNativeLibs() }
    }
}
