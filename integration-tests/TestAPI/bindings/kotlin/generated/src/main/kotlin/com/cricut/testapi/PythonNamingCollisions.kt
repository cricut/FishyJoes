package com.cricut.testapi

import com.cricut.fishyjoes.runtime.*
import java.lang.Exception
import kotlinx.coroutines.*

/**
 * <!-- FishyJoes.export(PythonNamingCollisions) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class PythonNamingCollisions {

    companion object {
        /**
         * <!-- FishyJoes.export(class) -->
         */
        val `class`: Long
          get() = __jni_get_class()
        @JvmStatic
        @JvmName("__jni_get_class")
        private external fun __jni_get_class(): Long

        /**
         * <!-- FishyJoes.export(__dunder__) -->
         */
        val __dunder__: Long
          get() = __jni_get___dunder__()
        @JvmStatic
        @JvmName("__jni_get___dunder__")
        private external fun __jni_get___dunder__(): Long

        /**
         * <!-- FishyJoes.export(isNaN) -->
         */
        val isNaN: Boolean
          get() = __jni_get_isNaN()
        @JvmStatic
        @JvmName("__jni_get_isNaN")
        private external fun __jni_get_isNaN(): Boolean

        /**
         * <!-- FishyJoes.export(_leadingUnderscore) -->
         */
        val _leadingUnderscore: Long
          get() = __jni_get__leadingUnderscore()
        @JvmStatic
        @JvmName("__jni_get__leadingUnderscore")
        private external fun __jni_get__leadingUnderscore(): Long

        /**
         * <!-- FishyJoes.export(list) -->
         */
        val list: Long
          get() = __jni_get_list()
        @JvmStatic
        @JvmName("__jni_get_list")
        private external fun __jni_get_list(): Long

        /**
         * <!-- FishyJoes.export(Url) -->
         */
        val Url: kotlin.String
          get() = __jni_get_Url()
        @JvmStatic
        @JvmName("__jni_get_Url")
        private external fun __jni_get_Url(): kotlin.String

        /**
         * <!-- FishyJoes.export(URL) -->
         */
        val URL: kotlin.String
          get() = __jni_get_URL()
        @JvmStatic
        @JvmName("__jni_get_URL")
        private external fun __jni_get_URL(): kotlin.String

        /**
         * <!-- FishyJoes.export(from) -->
         */
        fun from(
        ): kotlin.String = __jni_from()
        @JvmStatic
        @JvmName("__jni_from")
        private external fun __jni_from(
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(keywordArgs) -->
         */
        fun keywordArgs(
            `class`: Long,
            list: Long
        ): Long = __jni_keywordArgs(`class`, list)
        @JvmStatic
        @JvmName("__jni_keywordArgs")
        private external fun __jni_keywordArgs(
            `class`: Long,
            list: Long
        ): Long

        init { loadNativeLibs() }
    }
}
