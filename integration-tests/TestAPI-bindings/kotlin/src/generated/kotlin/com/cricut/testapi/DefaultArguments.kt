package com.cricut.testapi

/**
 * <!-- FishyJoes.export(DefaultArguments) -->
 */
sealed class DefaultArguments {

    companion object {
        /**
         * <!-- FishyJoes.export(echoDefaults) -->
         */
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
