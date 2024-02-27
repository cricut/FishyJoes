package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

private class _ExternalWitness_TestPropertiesProtocol private constructor(_swiftReference: Long): TestPropertiesProtocol, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(corge) -->
     */
    override val corge: kotlin.String
      get() = __jni_get_corge()
    @JvmName("__jni_get_corge")
    private external fun __jni_get_corge(): kotlin.String

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
