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

    override fun equals(other: Any?): kotlin.Boolean {
        if (this === other) {
            return true
        }
        if (other !is EmptyClass1) {
            return false
        }
        return this.blarg == other.blarg &&
            this.wibbledyWobbledyTimeyWhimey == other.wibbledyWobbledyTimeyWhimey
    }

    override fun hashCode(): kotlin.Int {
        return (blarg.hashCode()).xor(wibbledyWobbledyTimeyWhimey.hashCode())
    }

    override fun toString(): kotlin.String {
        return "EmptyClass1(blarg = ${blarg}, wibbledyWobbledyTimeyWhimey = ${wibbledyWobbledyTimeyWhimey})"
    }

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

        init { loadNativeLibs() }
    }
}
