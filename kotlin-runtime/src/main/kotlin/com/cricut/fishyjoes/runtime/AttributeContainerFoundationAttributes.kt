package com.cricut.fishyjoes.runtime

/**
 * <!-- FishyJoes.exportReference(AttributeContainerFoundationAttributes) -->
 */
class AttributeContainerFoundationAttributes private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
    override fun equals(
        other: Any?
    ): Boolean = (other is com.cricut.fishyjoes.runtime.AttributeContainerFoundationAttributes) && __jni_swiftEquals(this, other)

    override fun hashCode(
    ): Int = __jni_hashCode()
    @JvmName("__jni_hashCode")
    private external fun __jni_hashCode(
    ): Int

    fun asContainer(
    ): com.cricut.fishyjoes.runtime.AttributeContainer = __jni_asContainer()
    @JvmName("__jni_asContainer")
    private external fun __jni_asContainer(
    ): com.cricut.fishyjoes.runtime.AttributeContainer

    /**
     * <!-- FishyJoes.export(link) -->
     */
    var link: java.net.URL?
        get() = __jni_get_link()
        set(link: java.net.URL?) = __jni_set_link(link)
    @JvmName("__jni_get_link")
    private external fun __jni_get_link(): java.net.URL?
    @JvmName("__jni_set_link")
    private external fun __jni_set_link(link: java.net.URL?)

    /**
     * <!-- FishyJoes.export(languageIdentifier) -->
     */
    var languageIdentifier: String?
        get() = __jni_get_languageIdentifier()
        set(languageIdentifier: String?) = __jni_set_languageIdentifier(languageIdentifier)
    @JvmName("__jni_get_languageIdentifier")
    private external fun __jni_get_languageIdentifier(): String?
    @JvmName("__jni_set_languageIdentifier")
    private external fun __jni_set_languageIdentifier(languageIdentifier: String?)

    /**
     * <!-- FishyJoes.export(alternateDescription) -->
     */
    var alternateDescription: String?
        get() = __jni_get_alternateDescription()
        set(alternateDescription: String?) = __jni_set_alternateDescription(alternateDescription)
    @JvmName("__jni_get_alternateDescription")
    private external fun __jni_get_alternateDescription(): String?
    @JvmName("__jni_set_alternateDescription")
    private external fun __jni_set_alternateDescription(alternateDescription: String?)

    /**
     * <!-- FishyJoes.export(imageURL) -->
     */
    var imageURL: java.net.URL?
        get() = __jni_get_imageURL()
        set(link: java.net.URL?) = __jni_set_imageURL(link)
    @JvmName("__jni_get_imageURL")
    private external fun __jni_get_imageURL(): java.net.URL?
    @JvmName("__jni_set_imageURL")
    private external fun __jni_set_imageURL(link: java.net.URL?)

    companion object {
        /**
         * <!-- FishyJoes.export(createEmpty) -->
         */
        fun createEmpty(
        ): com.cricut.fishyjoes.runtime.AttributeContainerFoundationAttributes = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): com.cricut.fishyjoes.runtime.AttributeContainerFoundationAttributes

        fun swiftEquals(
            lhs: com.cricut.fishyjoes.runtime.AttributeContainerFoundationAttributes,
            rhs: com.cricut.fishyjoes.runtime.AttributeContainerFoundationAttributes
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: com.cricut.fishyjoes.runtime.AttributeContainerFoundationAttributes,
            rhs: com.cricut.fishyjoes.runtime.AttributeContainerFoundationAttributes
        ): Boolean

        operator fun invoke() = com.cricut.fishyjoes.runtime.AttributeContainerFoundationAttributes.createEmpty()

        init { loadNativeLibs() }
    }
}
