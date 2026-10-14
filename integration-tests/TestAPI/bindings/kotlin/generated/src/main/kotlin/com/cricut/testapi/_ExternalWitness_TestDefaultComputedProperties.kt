package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_TestDefaultComputedProperties private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), com.cricut.testapi.TestDefaultComputedProperties {
    /**
     * <!-- FishyJoes.export(noot) -->
     */
    override val noot: Long
      get() = __jni_get_noot()
    @JvmName("__jni_get_noot")
    private external fun __jni_get_noot(): Long

    /**
     * <!-- FishyJoes.export(plutonic) -->
     */
    override val plutonic: kotlin.String
      get() = __jni_get_plutonic()
    @JvmName("__jni_get_plutonic")
    private external fun __jni_get_plutonic(): kotlin.String

    companion object {
        init { loadNativeLibs() }
    }
}
