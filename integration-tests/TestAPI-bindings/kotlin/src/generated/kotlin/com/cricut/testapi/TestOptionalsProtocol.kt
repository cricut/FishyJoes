package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(TestOptionalsProtocol) -->
 */
interface TestOptionalsProtocol {
    /**
     * <!-- FishyJoes.export(flarp) -->
     */
    val flarp: kotlin.String?
    /**
     * <!-- FishyJoes.export(wombat) -->
     */
    fun wombat(
        zxc: Long?
    ): Double?

    /**
     * <!-- FishyJoes.export(spqr) -->
     */
    fun spqr(
        pippo: com.cricut.testapi.AssociatedDataEnum
    ): Long

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
