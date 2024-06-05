package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(EmptyStruct2) -->
 */
class EmptyStruct2 private constructor(
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

    override fun equals(
        other: Any?
    ): kotlin.Boolean {
        if (this === other) {
            return true
        }
        if (other !is EmptyStruct2) {
            return false
        }
        return true
    }

    override fun hashCode(
    ): kotlin.Int {
        return (EmptyStruct2::class.java.name).hashCode()
    }

    override fun toString(
    ): kotlin.String {
        return "EmptyStruct2()"
    }

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
