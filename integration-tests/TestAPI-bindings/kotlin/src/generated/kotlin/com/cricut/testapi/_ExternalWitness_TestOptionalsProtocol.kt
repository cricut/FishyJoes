package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

private class _ExternalWitness_TestOptionalsProtocol private constructor(_swiftReference: Long): TestOptionalsProtocol, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(flarp) -->
     */
    override var flarp: kotlin.String?
      get() = __jni_get_flarp()
      set(value) { __jni_set_flarp(value) } 
    @JvmName("__jni_get_flarp")
    private external fun __jni_get_flarp(): kotlin.String?
    @JvmName("__jni_set_flarp")
    private external fun __jni_set_flarp(newValue: kotlin.String?)

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
        _1: com.cricut.testapi.AssociatedDataEnum
    ): Long = __jni_spqr(_1)
    @JvmName("__jni_spqr")
    private external fun __jni_spqr(
        _1: com.cricut.testapi.AssociatedDataEnum
    ): Long

    companion object {
        init { loadNativeLibs() }
    }
}
