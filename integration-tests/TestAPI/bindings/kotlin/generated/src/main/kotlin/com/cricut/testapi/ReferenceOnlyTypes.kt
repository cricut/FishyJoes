package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(ReferenceOnlyTypes) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class ReferenceOnlyTypes {

    companion object {
        /**
         * <!-- FishyJoes.export(marker) -->
         */
        fun marker(
        ): com.cricut.testapi.ReferenceOnlyTypes.Marker = __jni_marker()
        @JvmStatic
        @JvmName("__jni_marker")
        private external fun __jni_marker(
        ): com.cricut.testapi.ReferenceOnlyTypes.Marker

        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.exportReference(ReferenceOnlyTypes.Marker) -->
     */
    class Marker private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
        overridefun equals(
            other: Any?
        ): Boolean = (other is com.cricut.testapi.ReferenceOnlyTypes.Marker) && __jni_swiftEquals(this, other)

        overridefun hashCode(
        ): Int = __jni_hashCode()
        @JvmName("__jni_hashCode")
        private external fun __jni_hashCode(
        ): Int

        companion object {
            fun swiftEquals(
                lhs: com.cricut.testapi.ReferenceOnlyTypes.Marker,
                rhs: com.cricut.testapi.ReferenceOnlyTypes.Marker
            ): Boolean = __jni_swiftEquals(lhs, rhs)
            @JvmStatic
            @JvmName("__jni_swiftEquals")
            private external fun __jni_swiftEquals(
                lhs: com.cricut.testapi.ReferenceOnlyTypes.Marker,
                rhs: com.cricut.testapi.ReferenceOnlyTypes.Marker
            ): Boolean

            init { loadNativeLibs() }
        }
    }
}
