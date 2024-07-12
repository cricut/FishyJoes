/**
 * <!-- FishyJoes.export(EmptyStruct) -->
 */
class EmptyStruct(
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
    ): kotlin.Boolean = other is EmptyStruct

    override fun hashCode(
    ): kotlin.Int = (EmptyStruct::class.java.name).hashCode()

    override fun toString(
    ): kotlin.String = EmptyStruct()"

    fun copy(
    ) = EmptyStruct()

    companion object {
        /**
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
        ): com.cricut.testapi.EmptyStruct = __jni_create()
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
        ): com.cricut.testapi.EmptyStruct

        init { loadNativeLibs() }
    }
}

package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*
