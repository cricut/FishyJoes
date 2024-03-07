package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(AProtocolImplementation, conformances: [AProtocol]) -->
 */
data class AProtocolImplementation(
    override var foo: Long
): AProtocol {
    /**
     * <!-- FishyJoes.export(increment) -->
     */
    override fun increment(
    ): kotlin.Unit = __jni_increment()
    @JvmName("__jni_increment")
    private external fun __jni_increment(
    ): kotlin.Unit

    companion object {
        init { loadNativeLibs() }
    }
}
