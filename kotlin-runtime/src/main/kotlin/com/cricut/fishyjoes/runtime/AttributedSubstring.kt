package com.cricut.fishyjoes.runtime

/**
 * <!-- FishyJoes.exportReference(AttributedSubstring) -->
 */
class AttributedSubstring private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
    /**
     * <!-- FishyJoes.export(base) -->
     */
    val base: com.cricut.fishyjoes.runtime.AttributedString
      get() = __jni_get_base()
    @JvmName("__jni_get_base")
    private external fun __jni_get_base(): com.cricut.fishyjoes.runtime.AttributedString

    /**
     * <!-- FishyJoes.export(startIndex) -->
     */
    val startIndex: com.cricut.fishyjoes.runtime.AttributedString.Index
      get() = __jni_get_startIndex()
    @JvmName("__jni_get_startIndex")
    private external fun __jni_get_startIndex(): com.cricut.fishyjoes.runtime.AttributedString.Index

    /**
     * <!-- FishyJoes.export(endIndex) -->
     */
    val endIndex: com.cricut.fishyjoes.runtime.AttributedString.Index
      get() = __jni_get_endIndex()
    @JvmName("__jni_get_endIndex")
    private external fun __jni_get_endIndex(): com.cricut.fishyjoes.runtime.AttributedString.Index

    /**
     * <!-- FishyJoes.export(unicodeScalars) -->
     */
    val unicodeScalars: com.cricut.fishyjoes.runtime.AttributedString.UnicodeScalarView
      get() = __jni_get_unicodeScalars()
    @JvmName("__jni_get_unicodeScalars")
    private external fun __jni_get_unicodeScalars(): com.cricut.fishyjoes.runtime.AttributedString.UnicodeScalarView

    /**
     * <!-- FishyJoes.export(characters) -->
     */
    val characters: com.cricut.fishyjoes.runtime.AttributedString.CharacterView
      get() = __jni_get_characters()
    @JvmName("__jni_get_characters")
    private external fun __jni_get_characters(): com.cricut.fishyjoes.runtime.AttributedString.CharacterView

    /**
     * <!-- FishyJoes.export(runs) -->
     */
    val runs: com.cricut.fishyjoes.runtime.AttributedString.Runs
      get() = __jni_get_runs()
    @JvmName("__jni_get_runs")
    private external fun __jni_get_runs(): com.cricut.fishyjoes.runtime.AttributedString.Runs

    /**
     * <!-- FishyJoes.export(substring) -->
     */
    val substring: com.cricut.fishyjoes.runtime.AttributedSubstring
      get() = __jni_get_substring()
    @JvmName("__jni_get_substring")
    private external fun __jni_get_substring(): com.cricut.fishyjoes.runtime.AttributedSubstring

    /**
     * <!-- FishyJoes.export(string) -->
     */
    val string: kotlin.String
        get() = __jni_get_string()
    @JvmName("__jni_get_string")
    private external fun __jni_get_string(): kotlin.String

    /**
     * <!-- FishyJoes.export(substringForRange) -->
     */
    fun substringForRange(
        /* for */ range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>
    ): com.cricut.fishyjoes.runtime.AttributedSubstring = __jni_substringForRange(range)
    @JvmName("__jni_substringForRange")
    private external fun __jni_substringForRange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>
    ): com.cricut.fishyjoes.runtime.AttributedSubstring

    override fun equals(
        other: Any?
    ): Boolean = (other is com.cricut.fishyjoes.runtime.AttributedSubstring) && __jni_swiftEquals(this, other)

    override fun hashCode(
    ): Int = __jni_hashCode()
    @JvmName("__jni_hashCode")
    private external fun __jni_hashCode(
    ): Int

    //---------------------//
    //                     //
    // Kotlin Conveniences //
    //                     //
    //---------------------//

    operator fun get(range: SwiftRange<AttributedString.Index>) = substringForRange(range)

    operator fun plus(attributedString: AttributedString): AttributedString {
        val result = AttributedString.createFromSubstring(this)
        result.append(attributedString)
        return result
    }
    operator fun plus(substring: AttributedSubstring): AttributedString {
        val result = AttributedString.createFromSubstring(this)
        result.appendSubstring(substring)
        return result
    }
    operator fun plus(string: String): AttributedString {
        val result = AttributedString.createFromSubstring(this)
        result.append(AttributedString(string))
        return result
    }

    companion object {
        /**
         * <!-- FishyJoes.export(createEmpty) -->
         */
        fun createEmpty(
        ): com.cricut.fishyjoes.runtime.AttributedSubstring = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): com.cricut.fishyjoes.runtime.AttributedSubstring

        fun swiftEquals(
            lhs: com.cricut.fishyjoes.runtime.AttributedSubstring,
            rhs: com.cricut.fishyjoes.runtime.AttributedSubstring
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: com.cricut.fishyjoes.runtime.AttributedSubstring,
            rhs: com.cricut.fishyjoes.runtime.AttributedSubstring
        ): Boolean

        init { loadNativeLibs() }
    }
}
