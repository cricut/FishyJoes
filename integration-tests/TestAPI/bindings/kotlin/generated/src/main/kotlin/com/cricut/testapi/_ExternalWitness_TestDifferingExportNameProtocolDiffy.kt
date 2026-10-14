package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_TestDifferingExportNameProtocolDiffy private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), com.cricut.testapi.TestDifferingExportNameProtocolDiffy {
    /**
     * <!-- FishyJoes.export(tata) -->
     */
    override val tata: Long
      get() = __jni_get_tata()
    @JvmName("__jni_get_tata")
    private external fun __jni_get_tata(): Long

    companion object {
        init { loadNativeLibs() }
    }
}
