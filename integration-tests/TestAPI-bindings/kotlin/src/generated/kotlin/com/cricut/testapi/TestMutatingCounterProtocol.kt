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

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
