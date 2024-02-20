package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

private class _ExternalWitness_TestPropertiesProtocol private constructor(_swiftReference: Long): TestPropertiesProtocol, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(corge) -->
     */
    override var corge: kotlin.String
      get() = __jni_get_corge()
      set(value) { __jni_set_corge(value) } 
    @JvmName("__jni_get_corge")
    private external fun __jni_get_corge(): kotlin.String
    @JvmName("__jni_set_corge")
    private external fun __jni_set_corge(newValue: kotlin.String)

    /**
     * <!-- FishyJoes.export(frob) -->
     */
    override val frob: kotlin.collections.List<Double>
      get() = __jni_get_frob()
    @JvmName("__jni_get_frob")
    private external fun __jni_get_frob(): kotlin.collections.List<Double>

    companion object {
        init { loadNativeLibs() }
    }
}
