package com.cricut.testapi

import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(SimpleEnum) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class SimpleEnum {
    object Red : SimpleEnum()
    object Green : SimpleEnum()
    object Blue : SimpleEnum()
    /**
     * <!-- FishyJoes.export(hex) -->
     */
    val hex: Long
      get() = __jni_get_hex()
    @JvmName("__jni_get_hex")
    private external fun __jni_get_hex(): Long

    /**
     * <!-- FishyJoes.export(hexMethod) -->
     */
    fun hexMethod(
    ): kotlin.String = __jni_hexMethod()
    @JvmName("__jni_hexMethod")
    private external fun __jni_hexMethod(
    ): kotlin.String

    companion object {
        /**
         * <!-- FishyJoes.export(favoriteColor) -->
         */
        var favoriteColor: com.cricut.testapi.SimpleEnum
          get() = __jni_get_favoriteColor()
          set(value) { __jni_set_favoriteColor(value) } 
        @JvmStatic
        @JvmName("__jni_get_favoriteColor")
        private external fun __jni_get_favoriteColor(): com.cricut.testapi.SimpleEnum
        @JvmStatic
        @JvmName("__jni_set_favoriteColor")
        private external fun __jni_set_favoriteColor(newValue: com.cricut.testapi.SimpleEnum)

        /**
         * <!-- FishyJoes.export(pickAColor) -->
         */
        fun pickAColor(
            rawValue: Long
        ): com.cricut.testapi.SimpleEnum? = __jni_pickAColor(rawValue)
        @JvmStatic
        @JvmName("__jni_pickAColor")
        private external fun __jni_pickAColor(
            rawValue: Long
        ): com.cricut.testapi.SimpleEnum?

        /**
         * <!-- FishyJoes.export(resetFavoriteColor) -->
         */
        fun resetFavoriteColor(
        ): kotlin.Unit = __jni_resetFavoriteColor()
        @JvmStatic
        @JvmName("__jni_resetFavoriteColor")
        private external fun __jni_resetFavoriteColor(
        ): kotlin.Unit

        init { loadNativeLibs() }
    }
}
