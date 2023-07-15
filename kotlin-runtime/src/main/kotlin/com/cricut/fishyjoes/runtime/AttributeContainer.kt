package com.cricut.fishyjoes.runtime

/**
 * A type that provides a way to store attributes and their values outside of an attributed string.
 *
 * Use this type to initialize an instance of AttributedString with preset attributes,
 * and to set, merge, or replace attributes in existing attributed strings.
 *
 * Libraries that depend on `AttributeContainer` are free to define their own attributes to be associated with attributed strings.
 * As a result of this flexibility, the actual values of attributes can only be obtained using types defined in those libraries.
 *
 * The runtime itself defines one such type, `AttributeContainerFoundationAttributes`.
 * To obtain the values of attributes from that type, such as the `link` attribute or `languageIdentifier` attribute,
 * one must construct an instance passing the container:
 *
 * `val link = `AttributeContainerFoundationAttributes(someContainer).link`
 */
class AttributeContainer private constructor(swiftReference: Long): SwiftReference(swiftReference) {
    /**
     * Merges the attributes of another attribute container with those of this container.
     *
     * @param other The other attribute container whose attributes should be merged into this container.
     * @param keepCurrent For attributes in `other` that already have a value in this container,
     *                    passing `true` retains the current value of the attribute,
     *                    passing `false` replaces the value of the attribute with the one in `other`.
     */
    fun mergeAttributes(
        other: AttributeContainer,
        keepCurrent: Boolean = false
    ): kotlin.Unit = __jni_merge(other, keepCurrent)
    @JvmName("__jni_merge")
    private external fun __jni_merge(
        other: AttributeContainer,
        keepCurrent: Boolean
    ): kotlin.Unit

    override fun equals(
        other: Any?
    ): Boolean = (other is AttributeContainer) && __jni_swiftEquals(this, other)

    override fun hashCode(
    ): Int = __jni_hashCode()
    @JvmName("__jni_hashCode")
    private external fun __jni_hashCode(
    ): Int

    companion object {
        /**
         * Creates an attribute container having no attribute values.
         */
        fun createEmpty(
        ): AttributeContainer = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): AttributeContainer

        fun swiftEquals(
            lhs: AttributeContainer,
            rhs: AttributeContainer
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: AttributeContainer,
            rhs: AttributeContainer
        ): Boolean

        operator fun invoke() = AttributeContainer.createEmpty()

        init { loadNativeLibs() }
    }
}
