package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

private class _ExternalWitness_AProtocol private constructor(_swiftReference: Long): AProtocol, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(foo) -->
     */
    override val foo: Long
      get() = __jni_get_foo()
    @JvmName("__jni_get_foo")
    private external fun __jni_get_foo(): Long

    /**
     * <!-- FishyJoes.export(increment) -->
     */
    override fun increment(
    ): kotlin.Unit = __jni_increment()
    @JvmName("__jni_increment")
    private external fun __jni_increment(
    ): kotlin.Unit

    companion object {
        init { loadNativeLibs() }
    }
}
