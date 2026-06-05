package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(EmptyStruct2) -->
 */
class EmptyStruct2(
) {
    /**
     * <!-- FishyJoes.export(tatiana) -->
     */
    val tatiana: kotlin.String
      get() = __jni_get_tatiana()
    @JvmName("__jni_get_tatiana")
    private external fun __jni_get_tatiana(): kotlin.String

    /**
     * <!-- FishyJoes.export(tutu) -->
     */
    val tutu: Long
      get() = __jni_get_tutu()
    @JvmName("__jni_get_tutu")
    private external fun __jni_get_tutu(): Long

    /**
     * <!-- FishyJoes.export(aap) -->
     */
    fun aap(
    ): kotlin.String = __jni_aap()
    @JvmName("__jni_aap")
    private external fun __jni_aap(
    ): kotlin.String

    /**
     * <!-- FishyJoes.export(zxccxz) -->
     */
    fun zxccxz(
    ): kotlin.String = __jni_zxccxz()
    @JvmName("__jni_zxccxz")
    private external fun __jni_zxccxz(
    ): kotlin.String

    overridefun equals(
        other: Any?
    ): kotlin.Boolean = other is EmptyStruct2

    overridefun hashCode(
    ): kotlin.Int = (EmptyStruct2::class.java.name).hashCode()

    overridefun toString(
    ): kotlin.String = "EmptyStruct2()"

    fun copy(
    ) = EmptyStruct2()

    companion object {
        /**
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
        ): com.cricut.testapi.EmptyStruct2 = __jni_create()
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
        ): com.cricut.testapi.EmptyStruct2

        init { loadNativeLibs() }
    }
}
