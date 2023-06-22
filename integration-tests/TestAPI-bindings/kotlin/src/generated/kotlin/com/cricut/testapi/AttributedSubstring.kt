package com.cricut.testapi

/**
 * <!-- FishyJoes.exportReference(AttributedSubstring) -->
 */
class AttributedSubstring private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
    /**
     * <!-- FishyJoes.export(base) -->
     */
    val base: com.cricut.testapi.AttributedString
      get() = __jni_get_base()
    @JvmName("__jni_get_base")
    private external fun __jni_get_base(): com.cricut.testapi.AttributedString

    /**
     * <!-- FishyJoes.export(startIndex) -->
     */
    val startIndex: com.cricut.testapi.AttributedString.Index
      get() = __jni_get_startIndex()
    @JvmName("__jni_get_startIndex")
    private external fun __jni_get_startIndex(): com.cricut.testapi.AttributedString.Index

    /**
     * <!-- FishyJoes.export(endIndex) -->
     */
    val endIndex: com.cricut.testapi.AttributedString.Index
      get() = __jni_get_endIndex()
    @JvmName("__jni_get_endIndex")
    private external fun __jni_get_endIndex(): com.cricut.testapi.AttributedString.Index

    /**
     * <!-- FishyJoes.export(unicodeScalars) -->
     */
    val unicodeScalars: com.cricut.testapi.AttributedString.UnicodeScalarView
      get() = __jni_get_unicodeScalars()
    @JvmName("__jni_get_unicodeScalars")
    private external fun __jni_get_unicodeScalars(): com.cricut.testapi.AttributedString.UnicodeScalarView

    /**
     * <!-- FishyJoes.export(characters) -->
     */
    val characters: com.cricut.testapi.AttributedString.CharacterView
      get() = __jni_get_characters()
    @JvmName("__jni_get_characters")
    private external fun __jni_get_characters(): com.cricut.testapi.AttributedString.CharacterView

    /**
     * <!-- FishyJoes.export(runs) -->
     */
    val runs: com.cricut.testapi.AttributedString.Runs
      get() = __jni_get_runs()
    @JvmName("__jni_get_runs")
    private external fun __jni_get_runs(): com.cricut.testapi.AttributedString.Runs

    /**
     * <!-- FishyJoes.export(substring) -->
     */
    val substring: com.cricut.testapi.AttributedSubstring
      get() = __jni_get_substring()
    @JvmName("__jni_get_substring")
    private external fun __jni_get_substring(): com.cricut.testapi.AttributedSubstring

    /**
     * <!-- FishyJoes.export(attributes) -->
     */
    val attributes: kotlin.collections.Map<kotlin.String, kotlin.String>
      get() = __jni_get_attributes()
    @JvmName("__jni_get_attributes")
    private external fun __jni_get_attributes(): kotlin.collections.Map<kotlin.String, kotlin.String>

    /**
     * <!-- FishyJoes.export(substringForRange) -->
     */
    fun substringForRange(
        /* for */ range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>
    ): com.cricut.testapi.AttributedSubstring = __jni_substringForRange(range)
    @JvmName("__jni_substringForRange")
    private external fun __jni_substringForRange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>
    ): com.cricut.testapi.AttributedSubstring

    /**
     * <!-- FishyJoes.export(setAttributes) -->
     */
    fun setAttributes(
        attributes: com.cricut.testapi.AttributeContainer
    ): kotlin.Unit = __jni_setAttributes(attributes)
    @JvmName("__jni_setAttributes")
    private external fun __jni_setAttributes(
        attributes: com.cricut.testapi.AttributeContainer
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(mergeAttributes) -->
     */
    fun mergeAttributes(
        attributes: com.cricut.testapi.AttributeContainer,
        mergePolicy: com.cricut.testapi.AttributedString.AttributeMergePolicy? = null
    ): kotlin.Unit = __jni_mergeAttributes(attributes, mergePolicy)
    @JvmName("__jni_mergeAttributes")
    private external fun __jni_mergeAttributes(
        attributes: com.cricut.testapi.AttributeContainer,
        mergePolicy: com.cricut.testapi.AttributedString.AttributeMergePolicy?
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(replaceAttributes) -->
     */
    fun replaceAttributes(
        attributes: com.cricut.testapi.AttributeContainer,
        /* with */ others: com.cricut.testapi.AttributeContainer
    ): kotlin.Unit = __jni_replaceAttributes(attributes, others)
    @JvmName("__jni_replaceAttributes")
    private external fun __jni_replaceAttributes(
        attributes: com.cricut.testapi.AttributeContainer,
        others: com.cricut.testapi.AttributeContainer
    ): kotlin.Unit

    override fun equals(
        other: Any?
    ): Boolean = (other is com.cricut.testapi.AttributedSubstring) && __jni_swiftEquals(this, other)

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
        ): com.cricut.testapi.AttributedSubstring = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): com.cricut.testapi.AttributedSubstring

        fun swiftEquals(
            lhs: com.cricut.testapi.AttributedSubstring,
            rhs: com.cricut.testapi.AttributedSubstring
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: com.cricut.testapi.AttributedSubstring,
            rhs: com.cricut.testapi.AttributedSubstring
        ): Boolean

        init { loadNativeLibs() }
    }
}
