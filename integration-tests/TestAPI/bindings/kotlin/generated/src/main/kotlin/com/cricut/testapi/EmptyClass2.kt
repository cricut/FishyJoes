package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.exportReference(EmptyClass2) -->
 */
class EmptyClass2 private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(blorg) -->
     */
    val blorg: kotlin.String
      get() = __jni_get_blorg()
    @JvmName("__jni_get_blorg")
    private external fun __jni_get_blorg(): kotlin.String

    /**
     * <!-- FishyJoes.export(wibble) -->
     */
    val wibble: kotlin.String
      get() = __jni_get_wibble()
    @JvmName("__jni_get_wibble")
    private external fun __jni_get_wibble(): kotlin.String

    /**
     * <!-- FishyJoes.export(shmee) -->
     */
    fun shmee(
    ): kotlin.String = __jni_shmee()
    @JvmName("__jni_shmee")
    private external fun __jni_shmee(
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(gorp) -->
     */
    fun gorp(
    ): kotlin.String = __jni_gorp()
    @JvmName("__jni_gorp")
    private external fun __jni_gorp(
    ): kotlin.String

    overridefun equals(
        other: Any?
    ): Boolean = (other is com.cricut.testapi.EmptyClass2) && __jni_swiftEquals(this, other)

    overridefun hashCode(
    ): Int = __jni_hashCode()
    @JvmName("__jni_hashCode")
    private external fun __jni_hashCode(
    ): Int

    companion object {
        /**
         * <!-- FishyJoes.export(make) -->
         */
        fun make(
        ): com.cricut.testapi.EmptyClass2 = __jni_make()
        @JvmStatic
        @JvmName("__jni_make")
        private external fun __jni_make(
        ): com.cricut.testapi.EmptyClass2

        fun swiftEquals(
            lhs: com.cricut.testapi.EmptyClass2,
            rhs: com.cricut.testapi.EmptyClass2
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: com.cricut.testapi.EmptyClass2,
            rhs: com.cricut.testapi.EmptyClass2
        ): Boolean

        init { loadNativeLibs() }
    }
}
