package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(Actors) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class Actors {

    companion object {
        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.export(Actors.TemperatureLogger) -->
     */
    class TemperatureLogger private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
        /**
         * <!-- FishyJoes.export(backwardsLabel) -->
         */
        val backwardsLabel: kotlin.String
          get() = __jni_get_backwardsLabel()
        @JvmName("__jni_get_backwardsLabel")
        private external fun __jni_get_backwardsLabel(): kotlin.String

        /**
         * <!-- FishyJoes.export(extensionNonisolatedVarLabel) -->
         */
        val extensionNonisolatedVarLabel: kotlin.String
          get() = __jni_get_extensionNonisolatedVarLabel()
        @JvmName("__jni_get_extensionNonisolatedVarLabel")
        private external fun __jni_get_extensionNonisolatedVarLabel(): kotlin.String

        /**
         * <!-- FishyJoes.export(label) -->
         */
        val label: kotlin.String
          get() = __jni_get_label()
        @JvmName("__jni_get_label")
        private external fun __jni_get_label(): kotlin.String

        /**
         * <!-- FishyJoes.export(update) -->
         */
        suspend fun update(
            /* with */ measurement: Long
        ): kotlin.Unit = __jni_update(measurement).await()
        @JvmName("__jni_update")
        private external fun __jni_update(
            measurement: Long
        ): kotlinx.coroutines.Deferred<kotlin.Unit>

        /**
         * <!-- FishyJoes.export(min) -->
         */
        suspend fun min(
        ): Long = __jni_min().await()
        @JvmName("__jni_min")
        private external fun __jni_min(
        ): kotlinx.coroutines.Deferred<Long>

        /**
         * <!-- FishyJoes.export(extensionIsolatedGetLabel) -->
         */
        suspend fun extensionIsolatedGetLabel(
        ): kotlin.String = __jni_extensionIsolatedGetLabel().await()
        @JvmName("__jni_extensionIsolatedGetLabel")
        private external fun __jni_extensionIsolatedGetLabel(
        ): kotlinx.coroutines.Deferred<kotlin.String>

        /**
         * <!-- FishyJoes.export(extensionNonisolatedGetLabel) -->
         */
        fun extensionNonisolatedGetLabel(
        ): kotlin.String = __jni_extensionNonisolatedGetLabel()
        @JvmName("__jni_extensionNonisolatedGetLabel")
        private external fun __jni_extensionNonisolatedGetLabel(
        ): kotlin.String

        override fun equals(other: Any?): kotlin.Boolean {
            if (this === other) {
                return true
            }
            if (other !is TemperatureLogger) {
                return false
            }
            return this.backwardsLabel == other.backwardsLabel &&
                this.extensionNonisolatedVarLabel == other.extensionNonisolatedVarLabel &&
                this.label == other.label
        }

        override fun hashCode(): kotlin.Int {
            return (backwardsLabel.hashCode()).xor(extensionNonisolatedVarLabel.hashCode()).xor(label.hashCode())
        }

        override fun toString(): kotlin.String {
            return "TemperatureLogger(backwardsLabel = ${backwardsLabel}, extensionNonisolatedVarLabel = ${extensionNonisolatedVarLabel}, label = ${label})"
        }

        companion object {
            /**
             * <!-- FishyJoes.export(create) -->
             */
            fun create(
                label: kotlin.String,
                measurement: Long
            ): com.cricut.testapi.Actors.TemperatureLogger = __jni_create(label, measurement)
            @JvmStatic
            @JvmName("__jni_create")
            private external fun __jni_create(
                label: kotlin.String,
                measurement: Long
            ): com.cricut.testapi.Actors.TemperatureLogger

            init { loadNativeLibs() }
        }
    }
}
