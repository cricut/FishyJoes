package com.cricut.fishyjoes.runtime

/**
 * Attributes defined by the Swift Foundation library in ``AttributeScopes``, packaged as a static type.
 *
 * This type (and the ones like it defined in other libraries) allow features similar to those
 * offered by Swift dynamic member lookup in ``AttributeScope`` to be exported to Kotlin.
 *
 * An attribute container can be asked to fill in the fields defined by this structure using `AttributeContainerFoundationAttributes(AttributeContainer)`.
 * This type can be asked to fill in an attribute container using `AttributeContainer(FoundationAttributes)`.
 *
 * Combining these calls with `AttributedString.setAttributes(_:)` and `AttributedString.mergeAttributes(_:)` allows expansion
 * of attributed strings with new attributes in Kotlin analogously to how it is done in ``AttributeScopes`` using Swift dynamic member lookup.
 */
class AttributeContainerFoundationAttributes private constructor(swiftReference: Long): SwiftReference(swiftReference) {
    override fun equals(
        other: Any?
    ): Boolean = (other is AttributeContainerFoundationAttributes) && __jni_swiftEquals(this, other)

    override fun hashCode(
    ): Int = __jni_hashCode()
    @JvmName("__jni_hashCode")
    private external fun __jni_hashCode(
    ): Int

    fun asContainer(
    ): AttributeContainer = __jni_asContainer()
    @JvmName("__jni_asContainer")
    private external fun __jni_asContainer(
    ): AttributeContainer

    /**
     * A link attribute.
     */
    var link: java.net.URL?
        get() = __jni_get_link()
        set(link: java.net.URL?) = __jni_set_link(link)
    @JvmName("__jni_get_link")
    private external fun __jni_get_link(): java.net.URL?
    @JvmName("__jni_set_link")
    private external fun __jni_set_link(link: java.net.URL?)

    /**
     * A language identifier attribute.
     */
    var languageIdentifier: String?
        get() = __jni_get_languageIdentifier()
        set(languageIdentifier: String?) = __jni_set_languageIdentifier(languageIdentifier)
    @JvmName("__jni_get_languageIdentifier")
    private external fun __jni_get_languageIdentifier(): String?
    @JvmName("__jni_set_languageIdentifier")
    private external fun __jni_set_languageIdentifier(languageIdentifier: String?)

    companion object {
        /**
         * Creates a Foundation attribute container having no attribute values.
         */
        fun createEmpty(
        ): AttributeContainerFoundationAttributes = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): AttributeContainerFoundationAttributes

        /**
         * Extracts the Foundation attributes from an attribute container and makes them available as statically typed properties.
         */
        fun createFromContainer(
            container: AttributeContainer
        ): AttributeContainerFoundationAttributes = __jni_createFromContainer(container)
        @JvmStatic
        @JvmName("__jni_createFromContainer")
        private external fun __jni_createFromContainer(
            container: AttributeContainer
        ): AttributeContainerFoundationAttributes

        fun swiftEquals(
            lhs: AttributeContainerFoundationAttributes,
            rhs: AttributeContainerFoundationAttributes
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: AttributeContainerFoundationAttributes,
            rhs: AttributeContainerFoundationAttributes
        ): Boolean

        operator fun invoke() = AttributeContainerFoundationAttributes.createEmpty()
        operator fun invoke(container: AttributeContainer) = AttributeContainerFoundationAttributes.createFromContainer(container)

        init { loadNativeLibs() }
    }
}
