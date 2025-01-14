package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(Deprecations) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class Deprecations {

    companion object {
        /**
         * <!-- FishyJoes.export(deprecatedVariable) -->
         */
        @Deprecated("replace with `deprecatedMethod` (This is the swift name of the replacement function, due to technical limitations)")
        val deprecatedVariable: Long
          get() = __jni_get_deprecatedVariable()
        @JvmStatic
        @JvmName("__jni_get_deprecatedVariable")
        private external fun __jni_get_deprecatedVariable(): Long

        /**
         * <!-- FishyJoes.export(deprecatedMethod) -->
         */
        @Deprecated("don't use this")
        fun deprecatedMethod(
        ): kotlin.String = __jni_deprecatedMethod()
        @JvmStatic
        @JvmName("__jni_deprecatedMethod")
        private external fun __jni_deprecatedMethod(
        ): kotlin.String

        init { loadNativeLibs() }
    }
}
