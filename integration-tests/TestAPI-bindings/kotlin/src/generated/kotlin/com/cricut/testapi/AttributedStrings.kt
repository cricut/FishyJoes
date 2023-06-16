package com.cricut.testapi

/**
 * <!-- FishyJoes.export(AttributedStrings) -->
 */
sealed class AttributedStrings {

    companion object {
        /**
         * <!-- FishyJoes.export(simple) -->
         */
        val simple: com.cricut.testapi.AttributedString
          get() = __jni_get_simple()
        @JvmStatic
        @JvmName("__jni_get_simple")
        private external fun __jni_get_simple(): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(accent) -->
         */
        val accent: com.cricut.testapi.AttributedString
          get() = __jni_get_accent()
        @JvmStatic
        @JvmName("__jni_get_accent")
        private external fun __jni_get_accent(): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(script) -->
         */
        val script: com.cricut.testapi.AttributedString
          get() = __jni_get_script()
        @JvmStatic
        @JvmName("__jni_get_script")
        private external fun __jni_get_script(): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(chinese) -->
         */
        val chinese: com.cricut.testapi.AttributedString
          get() = __jni_get_chinese()
        @JvmStatic
        @JvmName("__jni_get_chinese")
        private external fun __jni_get_chinese(): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(chineseBMP) -->
         */
        val chineseBMP: com.cricut.testapi.AttributedString
          get() = __jni_get_chineseBMP()
        @JvmStatic
        @JvmName("__jni_get_chineseBMP")
        private external fun __jni_get_chineseBMP(): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(chineseSIP) -->
         */
        val chineseSIP: com.cricut.testapi.AttributedString
          get() = __jni_get_chineseSIP()
        @JvmStatic
        @JvmName("__jni_get_chineseSIP")
        private external fun __jni_get_chineseSIP(): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(emoji) -->
         */
        val emoji: com.cricut.testapi.AttributedString
          get() = __jni_get_emoji()
        @JvmStatic
        @JvmName("__jni_get_emoji")
        private external fun __jni_get_emoji(): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(emojiMulti) -->
         */
        val emojiMulti: com.cricut.testapi.AttributedString
          get() = __jni_get_emojiMulti()
        @JvmStatic
        @JvmName("__jni_get_emojiMulti")
        private external fun __jni_get_emojiMulti(): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        fun echo(
            string: com.cricut.testapi.AttributedString
        ): com.cricut.testapi.AttributedString = __jni_echo(string)
        @JvmStatic
        @JvmName("__jni_echo")
        private external fun __jni_echo(
            string: com.cricut.testapi.AttributedString
        ): com.cricut.testapi.AttributedString

        init { loadNativeLibs() }
    }
}
