package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.exportReference(EmptyClass1) -->
 */
class EmptyClass1 private constructor(_swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(_swiftReference) {
    /**
     * <!-- FishyJoes.export(blarg) -->
     */
    val blarg: kotlin.String
      get() = __jni_get_blarg()
    @JvmName("__jni_get_blarg")
    private external fun __jni_get_blarg(): kotlin.String

    /**
     * <!-- FishyJoes.export(wibbledyWobbledyTimeyWhimey) -->
     */
    val wibbledyWobbledyTimeyWhimey: kotlin.String
      get() = __jni_get_wibbledyWobbledyTimeyWhimey()
    @JvmName("__jni_get_wibbledyWobbledyTimeyWhimey")
    private external fun __jni_get_wibbledyWobbledyTimeyWhimey(): kotlin.String

    /**
     * <!-- FishyJoes.export(shme) -->
     */
    fun shme(
    ): kotlin.String = __jni_shme()
    @JvmName("__jni_shme")
    private external fun __jni_shme(
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(Gorpers) -->
     */
    fun Gorpers(
    ): kotlin.String = __jni_Gorpers()
    @JvmName("__jni_Gorpers")
    private external fun __jni_Gorpers(
    ): kotlin.String

    override fun equals(
        other: Any?
    ): Boolean = (other is com.cricut.testapi.EmptyClass1) && __jni_swiftEquals(this, other)

    override fun hashCode(
    ): Int = __jni_hashCode()
    @JvmName("__jni_hashCode")
    private external fun __jni_hashCode(
    ): Int

    companion object {
        /**
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
        ): com.cricut.testapi.EmptyClass1 = __jni_create()
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
        ): com.cricut.testapi.EmptyClass1

        fun swiftEquals(
            lhs: com.cricut.testapi.EmptyClass1,
            rhs: com.cricut.testapi.EmptyClass1
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: com.cricut.testapi.EmptyClass1,
            rhs: com.cricut.testapi.EmptyClass1
        ): Boolean

        init { loadNativeLibs() }
    }
}
