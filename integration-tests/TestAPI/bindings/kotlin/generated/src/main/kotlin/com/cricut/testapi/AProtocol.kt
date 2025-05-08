package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(AProtocol) -->
 */
interface AProtocol {
    /**
     * <!-- FishyJoes.export(baz) -->
     */
    val baz: Boolean
    /**
     * <!-- FishyJoes.export(foo) -->
     */
    val foo: kotlin.String
    /**
     * <!-- FishyJoes.export(bar) -->
     */
    fun bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol

    /**
     * <!-- FishyJoes.export(hasADefaultImplementation) -->
     */
    fun hasADefaultImplementation(
        x: Long,
        y: Double
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(hasADefaultImplementation2) -->
     */
    fun hasADefaultImplementation2(
        a: kotlin.String,
        b: Boolean,
        c: kotlin.String
    ): kotlin.String

    companion object {
        init {
            loadNativeLibs()
        }
    }
}
