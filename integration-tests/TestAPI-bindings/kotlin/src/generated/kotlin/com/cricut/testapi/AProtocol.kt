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
    val foo: kotlin.String
    /**
     * <!-- FishyJoes.export(baz) -->
     */
    val baz: Boolean
    /**
     * <!-- FishyJoes.export(bar) -->
     */
    fun bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
