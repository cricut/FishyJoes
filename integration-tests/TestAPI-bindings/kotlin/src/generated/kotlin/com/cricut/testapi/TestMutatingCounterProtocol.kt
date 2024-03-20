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

    /**
     * <!-- FishyJoes.export(witness) -->
     */
    fun witness(
    ): com.cricut.testapi.TestMutatingCounterProtocol

    /**
     * <!-- FishyJoes.export(tickTwice) -->
     */
    fun tickTwice(
    ): kotlin.Unit = __jni__default_tickTwice(this)

    companion object {
        /**
         * <!-- FishyJoes.export(tickTwice) -->
         */
        @JvmName("__jni__default_tickTwice")
        private external fun __jni__default_tickTwice(
            self: TestMutatingCounterProtocol
        ): kotlin.Unit

        init {
            loadNativeLibs()
        }
    }
}
