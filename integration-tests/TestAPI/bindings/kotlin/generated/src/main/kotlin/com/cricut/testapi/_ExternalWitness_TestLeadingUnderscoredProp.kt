package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_TestLeadingUnderscoredProp private constructor(_swiftReference: Long): TestLeadingUnderscoredProp, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(_leadingUnderscoreProp) -->
     */
    override val _leadingUnderscoreProp: kotlin.String
      get() = __jni_get__leadingUnderscoreProp()
    @JvmName("__jni_get__leadingUnderscoreProp")
    private external fun __jni_get__leadingUnderscoreProp(): kotlin.String

    companion object {
        init { loadNativeLibs() }
    }
}
