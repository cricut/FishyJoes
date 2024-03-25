package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

private class _ExternalWitness_TestAsyncFunctions private constructor(_swiftReference: Long): TestAsyncFunctions, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(const42) -->
     */
    override val const42: (suspend () -> Long)
      get() = __jni_get_const42()
    @JvmName("__jni_get_const42")
    private external fun __jni_get_const42(): (suspend () -> Long)

    companion object {
        init { loadNativeLibs() }
    }
}
