package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

private class _ExternalWitness_TestMutatingCounterProtocol private constructor(_swiftReference: Long): TestMutatingCounterProtocol, com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(count) -->
     */
    override val count: Long
      get() = __jni_get_count()
    @JvmName("__jni_get_count")
    private external fun __jni_get_count(): Long

    /**
     * <!-- FishyJoes.export(tick) -->
     */
    override fun tick(
    ): kotlin.Unit = __jni_tick()
    @JvmName("__jni_tick")
    private external fun __jni_tick(
    ): kotlin.Unit

    companion object {
        init { loadNativeLibs() }
    }
}
