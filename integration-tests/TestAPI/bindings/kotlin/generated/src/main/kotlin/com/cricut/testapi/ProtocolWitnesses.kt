package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(ProtocolWitnesses) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class ProtocolWitnesses {

    companion object {
        /**
         * <!-- FishyJoes.export(describeAProtocol) -->
         */
        fun describeAProtocol(
            value: com.cricut.testapi.AProtocol,
            x: Long,
            y: Long
        ): kotlin.String = __jni_describeAProtocol(value, x, y)
        @JvmStatic
        @JvmName("__jni_describeAProtocol")
        private external fun __jni_describeAProtocol(
            value: com.cricut.testapi.AProtocol,
            x: Long,
            y: Long
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(returnAProtocol) -->
         */
        fun returnAProtocol(
            value: com.cricut.testapi.AProtocol
        ): com.cricut.testapi.AProtocol = __jni_returnAProtocol(value)
        @JvmStatic
        @JvmName("__jni_returnAProtocol")
        private external fun __jni_returnAProtocol(
            value: com.cricut.testapi.AProtocol
        ): com.cricut.testapi.AProtocol

        init { loadNativeLibs() }
    }
}
