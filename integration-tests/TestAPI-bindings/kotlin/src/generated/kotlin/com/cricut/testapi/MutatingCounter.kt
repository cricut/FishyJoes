package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(MutatingCounter) -->
 */
data class MutatingCounter(
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

    companion object {
        init { loadNativeLibs() }
    }
}
