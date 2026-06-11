package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
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

        /**
         * <!-- FishyJoes.export(echoDefaultIntLimits) -->
         */
        fun echoDefaultIntLimits(
            minValue: Long,
            maxValue: Long
        ): kotlin.String = __jni_echoDefaultIntLimits(minValue, maxValue)
        @JvmStatic
        @JvmName("__jni_echoDefaultIntLimits")
        private external fun __jni_echoDefaultIntLimits(
            minValue: Long,
            maxValue: Long
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(echoExplicitIntMax) -->
         */
        fun echoExplicitIntMax(
            value: Long = 9223372036854775807
        ): kotlin.String = __jni_echoExplicitIntMax(value)
        @JvmStatic
        @JvmName("__jni_echoExplicitIntMax")
        private external fun __jni_echoExplicitIntMax(
            value: Long
        ): kotlin.String

        init { loadNativeLibs() }
    }
}
