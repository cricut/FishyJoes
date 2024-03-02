package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(AProtocol) -->
 */
interface AProtocol {
    /**
     * <!-- FishyJoes.export(foo) -->
     */
    val foo: Long
    /**
     * <!-- FishyJoes.export(increment) -->
     */
    fun increment(
    ): kotlin.Unit

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
