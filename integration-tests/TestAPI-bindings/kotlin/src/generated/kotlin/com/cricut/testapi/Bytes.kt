package com.cricut.testapi

import com.cricut.fishyjoes.runtime.LibraryLoader

/**
 * <!-- FishyJoes.export(Bytes) -->
 */
sealed class Bytes {

    companion object {
        /**
         * <!-- FishyJoes.export(bytes) -->
         */
        val bytes: kotlin.collections.List<UByte>
          get() = __jni_get_bytes()
        @JvmStatic
        @JvmName("__jni_get_bytes")
        private external fun __jni_get_bytes(): kotlin.collections.List<UByte>

        /**
         * <!-- FishyJoes.export(data) -->
         */
        val data: kotlin.ByteArray
          get() = __jni_get_data()
        @JvmStatic
        @JvmName("__jni_get_data")
        private external fun __jni_get_data(): kotlin.ByteArray

        /**
         * <!-- FishyJoes.export(echoBytes) -->
         */
        fun echoBytes(
            bytes: kotlin.collections.List<UByte>
        ): kotlin.collections.List<UByte> = __jni_echoBytes(bytes)
        @JvmStatic
        @JvmName("__jni_echoBytes")
        private external fun __jni_echoBytes(
            bytes: kotlin.collections.List<UByte>
        ): kotlin.collections.List<UByte>

        /**
         * <!-- FishyJoes.export(echoData) -->
         */
        fun echoData(
            data: kotlin.ByteArray
        ): kotlin.ByteArray = __jni_echoData(data)
        @JvmStatic
        @JvmName("__jni_echoData")
        private external fun __jni_echoData(
            data: kotlin.ByteArray
        ): kotlin.ByteArray

        init {
            LibraryLoader.ensureLoaded("TestAPI")
        }
    }
}
