package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(Deprecations) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class Deprecations {

    companion object {
        /**
         * <!-- FishyJoes.export(deprecatedVariable) -->
         */
        @Deprecated("replace with `deprecatedMethod` ( <-- swift name, sorry )")
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
