package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(AProtocolImplementation, conformances: [AProtocol]) -->
 */
data class AProtocolImplementation(
    override var foo: kotlin.String,
    override var baz: Boolean
): AProtocol {
    /**
     * <!-- FishyJoes.export(bar) -->
     */
    override fun bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol = __jni_bar(x, y)
    @JvmName("__jni_bar")
    private external fun __jni_bar(
        x: Long,
        y: Long
    ): com.cricut.testapi.AProtocol

    companion object {
        init { loadNativeLibs() }
    }
}
