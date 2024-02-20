package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestMethodsProtocol) -->
 */
interface TestMethodsProtocol {
    /**
     * <!-- FishyJoes.export(plugh) -->
     */
    fun plugh(
        fred: kotlin.Triple<Boolean, Double, kotlin.collections.List<kotlin.String>>
    ): kotlin.Triple<Boolean, Long, kotlin.String>

    /**
     * <!-- FishyJoes.export(garply) -->
     */
    fun garply(
        _1: kotlin.String
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(baz) -->
     */
    fun baz(
        qux: Boolean
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(bar) -->
     */
    fun bar(
    ): Boolean

    /**
     * <!-- FishyJoes.export(foo) -->
     */
    fun foo(
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(xyzzy) -->
     */
    fun xyzzy(
        thud: Long,
        grault: kotlin.collections.List<Double>
    ): kotlin.String

    companion object {
    }
}
