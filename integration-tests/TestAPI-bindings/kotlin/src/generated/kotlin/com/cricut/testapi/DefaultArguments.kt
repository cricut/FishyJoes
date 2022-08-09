package com.cricut.testapi

/**
 * <!-- FishyJoes.exportReference(DefaultArguments) -->
 */
class DefaultArguments private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {

    companion object {
        /**
         * <!-- FishyJoes.export(echoDefaults, cSharp: TheBytes) -->
         */
        fun echoDefaults(
            y: Long? = null,
            x: Long?,
            z: Double = 3.14
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
