package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_TestPropertiesProtocol private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), com.cricut.testapi.TestPropertiesProtocol {
    /**
     * <!-- FishyJoes.export(corge) -->
     */
    override val corge: kotlin.String
      get() = __jni_get_corge()
    @JvmName("__jni_get_corge")
    private external fun __jni_get_corge(): kotlin.String

    /**
     * <!-- FishyJoes.export(frobby) -->
     */
    override val frobby: kotlin.collections.List<Long>
      get() = __jni_get_frobby()
    @JvmName("__jni_get_frobby")
    private external fun __jni_get_frobby(): kotlin.collections.List<Long>

    companion object {
        init { loadNativeLibs() }
    }
}
