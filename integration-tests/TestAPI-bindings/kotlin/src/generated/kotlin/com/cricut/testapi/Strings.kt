package com.cricut.testapi

import kotlinx.coroutines.*
import java.lang.Exception

/**
 * <!-- FishyJoes.export(Strings) -->
 */
@OptIn(ExperimentalCoroutinesApi::class)
sealed class Strings {

    companion object {
        /**
         * <!-- FishyJoes.export(simple) -->
         */
        val simple: kotlin.String
          get() = __jni_get_simple()
        @JvmStatic
        @JvmName("__jni_get_simple")
        private external fun __jni_get_simple(): kotlin.String

        /**
         * <!-- FishyJoes.export(accent) -->
         */
        val accent: kotlin.String
          get() = __jni_get_accent()
        @JvmStatic
        @JvmName("__jni_get_accent")
        private external fun __jni_get_accent(): kotlin.String

        /**
         * <!-- FishyJoes.export(script) -->
         */
        val script: kotlin.String
          get() = __jni_get_script()
        @JvmStatic
        @JvmName("__jni_get_script")
        private external fun __jni_get_script(): kotlin.String

        /**
         * <!-- FishyJoes.export(chinese) -->
         */
        val chinese: kotlin.String
          get() = __jni_get_chinese()
        @JvmStatic
        @JvmName("__jni_get_chinese")
        private external fun __jni_get_chinese(): kotlin.String

        /**
         * <!-- FishyJoes.export(chineseBMP) -->
         */
        val chineseBMP: kotlin.String
          get() = __jni_get_chineseBMP()
        @JvmStatic
        @JvmName("__jni_get_chineseBMP")
        private external fun __jni_get_chineseBMP(): kotlin.String

        /**
         * <!-- FishyJoes.export(chineseSIP) -->
         */
        val chineseSIP: kotlin.String
          get() = __jni_get_chineseSIP()
        @JvmStatic
        @JvmName("__jni_get_chineseSIP")
        private external fun __jni_get_chineseSIP(): kotlin.String

        /**
         * <!-- FishyJoes.export(emoji) -->
         */
        val emoji: kotlin.String
          get() = __jni_get_emoji()
        @JvmStatic
        @JvmName("__jni_get_emoji")
        private external fun __jni_get_emoji(): kotlin.String

        /**
         * <!-- FishyJoes.export(emojiMulti) -->
         */
        val emojiMulti: kotlin.String
          get() = __jni_get_emojiMulti()
        @JvmStatic
        @JvmName("__jni_get_emojiMulti")
        private external fun __jni_get_emojiMulti(): kotlin.String

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        fun echo(
            string: kotlin.String
        ): kotlin.String = __jni_echo(string)
        @JvmStatic
        @JvmName("__jni_echo")
        private external fun __jni_echo(
            string: kotlin.String
        ): kotlin.String

        init { loadNativeLibs() }
    }
}
