package com.cricut.fishyjoes.runtime

/**
 * <!-- FishyJoes.exportReference(AttributeContainer) -->
 */
class AttributeContainer private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
    override fun equals(
        other: Any?
    ): Boolean = (other is com.cricut.fishyjoes.runtime.AttributeContainer) && __jni_swiftEquals(this, other)

    override fun hashCode(
    ): Int = __jni_hashCode()
    @JvmName("__jni_hashCode")
    private external fun __jni_hashCode(
    ): Int

    companion object {
        /**
         * <!-- FishyJoes.export(createEmpty) -->
         */
        fun createEmpty(
        ): com.cricut.fishyjoes.runtime.AttributeContainer = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): com.cricut.fishyjoes.runtime.AttributeContainer

        /**
         * <!-- FishyJoes.export(createWithLanguageIdentifier) -->
         */
        fun createWithLanguageIdentifier(
            languageIdentifier: kotlin.String
        ): com.cricut.fishyjoes.runtime.AttributeContainer = __jni_createWithLanguageIdentifier(languageIdentifier)
        @JvmStatic
        @JvmName("__jni_createWithLanguageIdentifier")
        private external fun __jni_createWithLanguageIdentifier(
            string: kotlin.String
        ): com.cricut.fishyjoes.runtime.AttributeContainer

        /**
         * <!-- FishyJoes.export(createWithLink) -->
         */
        fun createWithLink(
            link: kotlin.String
        ): com.cricut.fishyjoes.runtime.AttributeContainer = __jni_createWithLink(link)
        @JvmStatic
        @JvmName("__jni_createWithLink")
        private external fun __jni_createWithLink(
            string: kotlin.String
        ): com.cricut.fishyjoes.runtime.AttributeContainer

        fun swiftEquals(
            lhs: com.cricut.fishyjoes.runtime.AttributeContainer,
            rhs: com.cricut.fishyjoes.runtime.AttributeContainer
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: com.cricut.fishyjoes.runtime.AttributeContainer,
            rhs: com.cricut.fishyjoes.runtime.AttributeContainer
        ): Boolean

        init { loadNativeLibs() }
    }
}
