package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(TestMutatingCounter) -->
 */
data class TestMutatingCounter(
    val count: Long
) {
    /**
     * <!-- FishyJoes.export(tick) -->
     */
    fun tick(
    ): kotlin.Unit = __jni_tick()
    @JvmName("__jni_tick")
    private external fun __jni_tick(
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(witness) -->
     */
    fun witness(
    ): com.cricut.testapi.TestMutatingCounterProtocol = __jni_witness()
    @JvmName("__jni_witness")
    private external fun __jni_witness(
    ): com.cricut.testapi.TestMutatingCounterProtocol

    companion object {
        init { loadNativeLibs() }
    }
}
