package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
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
    overridefun wombat(
        zxc: Long?
    ): Double? = __jni_wombat(zxc)
    @JvmName("__jni_wombat")
    private external fun __jni_wombat(
        zxc: Long?
    ): Double?

    /**
     * <!-- FishyJoes.export(spqr) -->
     */
    overridefun spqr(
        pippo: com.cricut.testapi.AssociatedDataEnum
    ): Long = __jni_spqr(pippo)
    @JvmName("__jni_spqr")
    private external fun __jni_spqr(
        pippo: com.cricut.testapi.AssociatedDataEnum
    ): Long

    companion object {
        init { loadNativeLibs() }
    }
}
