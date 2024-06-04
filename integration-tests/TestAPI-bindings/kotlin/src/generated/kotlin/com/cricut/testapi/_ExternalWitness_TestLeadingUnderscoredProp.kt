package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_TestLeadingUnderscoredProp private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), com.cricut.testapi.TestLeadingUnderscoredProp {
    /**
     * <!-- FishyJoes.export(_leadingUnderscoreProp) -->
     */
    override val _leadingUnderscoreProp: kotlin.String
      get() = __jni_get__leadingUnderscoreProp()
    @JvmName("__jni_get__leadingUnderscoreProp")
    private external fun __jni_get__leadingUnderscoreProp(): kotlin.String

    override fun equals(other: Any?): kotlin.Boolean {
        if (this === other) {
            return true
        }
        if (other !is _ExternalWitness_TestLeadingUnderscoredProp) {
            return false
        }
        return this._leadingUnderscoreProp == other._leadingUnderscoreProp
    }

    override fun hashCode(): kotlin.Int {
        return (_leadingUnderscoreProp.hashCode())
    }

    override fun toString(): kotlin.String {
        return "_ExternalWitness_TestLeadingUnderscoredProp(_leadingUnderscoreProp = ${_leadingUnderscoreProp})"
    }

    companion object {
        init { loadNativeLibs() }
    }
}
