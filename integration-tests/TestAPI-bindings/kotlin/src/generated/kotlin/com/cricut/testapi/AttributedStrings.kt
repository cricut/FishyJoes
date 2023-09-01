package com.cricut.testapi

/**
 * <!-- FishyJoes.export(AttributedStrings) -->
 */
sealed class AttributedStrings {

    companion object {
        /**
         * <!-- FishyJoes.export(simple) -->
         */
        val simple: com.cricut.fishyjoes.runtime.AttributedString
          get() = __jni_get_simple()
        @JvmStatic
        @JvmName("__jni_get_simple")
        private external fun __jni_get_simple(): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(accent) -->
         */
        val accent: com.cricut.fishyjoes.runtime.AttributedString
          get() = __jni_get_accent()
        @JvmStatic
        @JvmName("__jni_get_accent")
        private external fun __jni_get_accent(): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(script) -->
         */
        val script: com.cricut.fishyjoes.runtime.AttributedString
          get() = __jni_get_script()
        @JvmStatic
        @JvmName("__jni_get_script")
        private external fun __jni_get_script(): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(chinese) -->
         */
        val chinese: com.cricut.fishyjoes.runtime.AttributedString
          get() = __jni_get_chinese()
        @JvmStatic
        @JvmName("__jni_get_chinese")
        private external fun __jni_get_chinese(): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(chineseBMP) -->
         */
        val chineseBMP: com.cricut.fishyjoes.runtime.AttributedString
          get() = __jni_get_chineseBMP()
        @JvmStatic
        @JvmName("__jni_get_chineseBMP")
        private external fun __jni_get_chineseBMP(): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(chineseSIP) -->
         */
        val chineseSIP: com.cricut.fishyjoes.runtime.AttributedString
          get() = __jni_get_chineseSIP()
        @JvmStatic
        @JvmName("__jni_get_chineseSIP")
        private external fun __jni_get_chineseSIP(): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(emoji) -->
         */
        val emoji: com.cricut.fishyjoes.runtime.AttributedString
          get() = __jni_get_emoji()
        @JvmStatic
        @JvmName("__jni_get_emoji")
        private external fun __jni_get_emoji(): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(emojiMulti) -->
         */
        val emojiMulti: com.cricut.fishyjoes.runtime.AttributedString
          get() = __jni_get_emojiMulti()
        @JvmStatic
        @JvmName("__jni_get_emojiMulti")
        private external fun __jni_get_emojiMulti(): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(polyglot) -->
         */
        val polyglot: com.cricut.fishyjoes.runtime.AttributedString
          get() = __jni_get_polyglot()
        @JvmStatic
        @JvmName("__jni_get_polyglot")
        private external fun __jni_get_polyglot(): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        fun echo(
            string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.AttributedString = __jni_echo(string)
        @JvmStatic
        @JvmName("__jni_echo")
        private external fun __jni_echo(
            string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(firstIndex) -->
         */
        fun firstIndex(
            /* of */ string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.AttributedString.Index = __jni_firstIndex(string)
        @JvmStatic
        @JvmName("__jni_firstIndex")
        private external fun __jni_firstIndex(
            string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.AttributedString.Index

        /**
         * <!-- FishyJoes.export(lastIndex) -->
         */
        fun lastIndex(
            /* of */ string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.AttributedString.Index = __jni_lastIndex(string)
        @JvmStatic
        @JvmName("__jni_lastIndex")
        private external fun __jni_lastIndex(
            string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.AttributedString.Index

        /**
         * <!-- FishyJoes.export(fullRange) -->
         */
        fun fullRange(
            /* of */ string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index> = __jni_fullRange(string)
        @JvmStatic
        @JvmName("__jni_fullRange")
        private external fun __jni_fullRange(
            string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>

        /**
         * <!-- FishyJoes.export(attributedCharacters) -->
         */
        fun attributedCharacters(
            /* of */ string: com.cricut.fishyjoes.runtime.AttributedString
        ): kotlin.collections.List<com.cricut.fishyjoes.runtime.AttributedSubstring> = __jni_attributedCharacters(string)
        @JvmStatic
        @JvmName("__jni_attributedCharacters")
        private external fun __jni_attributedCharacters(
            string: com.cricut.fishyjoes.runtime.AttributedString
        ): kotlin.collections.List<com.cricut.fishyjoes.runtime.AttributedSubstring>

        /**
         * <!-- FishyJoes.export(attributesPreferringDuplicatesNearerStart) -->
         */
        fun attributesPreferringDuplicatesNearerStart(
            /* of */ string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.AttributeContainer = __jni_attributesPreferringDuplicatesNearerStart(string)
        @JvmStatic
        @JvmName("__jni_attributesPreferringDuplicatesNearerStart")
        private external fun __jni_attributesPreferringDuplicatesNearerStart(
            string: com.cricut.fishyjoes.runtime.AttributedString
        ): com.cricut.fishyjoes.runtime.AttributeContainer

        /**
         * <!-- FishyJoes.export(emptyAttributeRuns) -->
         */
        fun emptyAttributeRuns(
            /* of */ string: com.cricut.fishyjoes.runtime.AttributedString
        ): kotlin.collections.List<com.cricut.fishyjoes.runtime.AttributedString.Runs.Run> = __jni_emptyAttributeRuns(string)
        @JvmStatic
        @JvmName("__jni_emptyAttributeRuns")
        private external fun __jni_emptyAttributeRuns(
            string: com.cricut.fishyjoes.runtime.AttributedString
        ): kotlin.collections.List<com.cricut.fishyjoes.runtime.AttributedString.Runs.Run>

        init { loadNativeLibs() }
    }
}
