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

    companion object {
        init { loadNativeLibs() }
    }
}
