package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(SkippedMemberHost) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class SkippedMemberHost {

    companion object {
        /**
         * A sibling member referencing only exported types — must still generate.
         * <!-- FishyJoes.export(echoInt) -->
         */
        fun echoInt(
            value: Long
        ): Long = __jni_echoInt(value)
        @JvmStatic
        @JvmName("__jni_echoInt")
        private external fun __jni_echoInt(
            value: Long
        ): Long

        init { loadNativeLibs() }
    }
}
