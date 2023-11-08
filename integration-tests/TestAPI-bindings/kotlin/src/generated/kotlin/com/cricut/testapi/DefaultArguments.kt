package com.cricut.testapi

import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(DefaultArguments) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class DefaultArguments {

    companion object {
        /**
         * <!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->
         */
        fun echoDefaults(
            x: Long?
        ): kotlin.String = __jni_echoDefaults((null), x, (3.14))
        fun echoDefaults(
            x: Long?,
            /* theLabelForZ */ z: Double = 3.14
        ): kotlin.String = __jni_echoDefaults((null), x, z)
        fun echoDefaults(
            y: Long? = null,
            x: Long?,
            /* theLabelForZ */ z: Double = 3.14
        ): kotlin.String = __jni_echoDefaults(y, x, z)
        @JvmStatic
        @JvmName("__jni_echoDefaults")
        private external fun __jni_echoDefaults(
            y: Long?,
            x: Long?,
            z: Double
        ): kotlin.String

        init { loadNativeLibs() }
    }
}
