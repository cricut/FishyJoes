package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestMutatingCounterProtocol) -->
 */
interface TestMutatingCounterProtocol {
    /**
     * <!-- FishyJoes.export(count) -->
     */
    val count: Long
    /**
     * <!-- FishyJoes.export(tick) -->
     */
    fun tick(
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(witness) -->
     */
    fun witness(
    ): com.cricut.testapi.TestMutatingCounterProtocol

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
