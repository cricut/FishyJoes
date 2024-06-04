package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

private class _ExternalWitness_TestOptionalsProtocol private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference), com.cricut.testapi.TestOptionalsProtocol {
    /**
     * <!-- FishyJoes.export(flarp) -->
     */
    override val flarp: kotlin.String?
      get() = __jni_get_flarp()
    @JvmName("__jni_get_flarp")
    private external fun __jni_get_flarp(): kotlin.String?

    /**
     * <!-- FishyJoes.export(wombat) -->
     */
    override fun wombat(
        zxc: Long?
    ): Double? = __jni_wombat(zxc)
    @JvmName("__jni_wombat")
    private external fun __jni_wombat(
        zxc: Long?
    ): Double?

    /**
     * <!-- FishyJoes.export(spqr) -->
     */
    override fun spqr(
        pippo: com.cricut.testapi.AssociatedDataEnum
    ): Long = __jni_spqr(pippo)
    @JvmName("__jni_spqr")
    private external fun __jni_spqr(
        pippo: com.cricut.testapi.AssociatedDataEnum
    ): Long

    override fun equals(other: Any?): kotlin.Boolean {
        if (this === other) {
            return true
        }
        if (other !is _ExternalWitness_TestOptionalsProtocol) {
            return false
        }
        return this.flarp == other.flarp
    }

    override fun hashCode(): kotlin.Int {
        return (flarp.hashCode())
    }

    override fun toString(): kotlin.String {
        return "_ExternalWitness_TestOptionalsProtocol(flarp = ${flarp})"
    }

    companion object {
        init { loadNativeLibs() }
    }
}
