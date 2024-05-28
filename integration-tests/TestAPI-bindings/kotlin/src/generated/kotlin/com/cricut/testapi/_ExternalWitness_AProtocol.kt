package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_AProtocol private constructor(_swiftReference: Long): TestAPI.AProtocol, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
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

    companion object {
        init { loadNativeLibs() }
    }
}
