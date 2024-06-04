package com.cricut.testapi

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

    override fun equals(other: Any?): kotlin.Boolean {
        if (this === other) {
            return true
        }
        if (other !is _ExternalWitness_TestDifferingExportNameProtocolDiffy) {
            return false
        }
        return this.tata == other.tata
    }

    override fun hashCode(): kotlin.Int {
        return (tata.hashCode())
    }

    override fun toString(): kotlin.String {
        return "_ExternalWitness_TestDifferingExportNameProtocolDiffy(tata = ${tata})"
    }

    companion object {
        init { loadNativeLibs() }
    }
}
