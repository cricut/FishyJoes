package com.cricut.fishyjoes.runtime

/**
 * <!-- FishyJoes.exportReference(AttributedSubstring) -->
 */
class AttributedSubstring private constructor(swiftReference: Long): SwiftReference(swiftReference) {
    /**
     * The attributed string that this substring references.
     *
     * The `startIndex` and `endIndex` of this substring are comparable to `base.startIndex` and `base.endIndex` and are guaranteed to be bounded by them.
     * As such, the portion of the base string represented by the substring is the range from `startIndex` inclusive to `endIndex` exclusive.
     */
    val base: AttributedString
        get() = __jni_get_base()
    @JvmName("__jni_get_base")
    private external fun __jni_get_base(): AttributedString

    /**
     * Text represented by the attributed substring.
     *
     * See `runs` for the attribute information associated with the attributed substring's text.
     */
    val string: kotlin.String
        get() = __jni_get_string()
    @JvmName("__jni_get_string")
    private external fun __jni_get_string(): kotlin.String

    /**
     * The attributed runs of the attributed substring, as a view into the underlying string.
     *
     * This view provides access to the attribute information associated with the attributed substring.
     *
     * See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
     * are associated with a particular position in the attributed substring.
     *
     * For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
     * and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.
     */
    val runs: AttributedString.Runs
        get() = __jni_get_runs()
    @JvmName("__jni_get_runs")
    private external fun __jni_get_runs(): AttributedString.Runs

    /**
     * The characters of the attributed substring, as a view into the underlying string.
     */
    val characters: AttributedString.CharacterView
        get() = __jni_get_characters()
    @JvmName("__jni_get_characters")
    private external fun __jni_get_characters(): AttributedString.CharacterView

    /**
     * The Unicode scalars of the attributed substring, as a view into the underlying string.
     */
    val unicodeScalars: AttributedString.UnicodeScalarView
        get() = __jni_get_unicodeScalars()
    @JvmName("__jni_get_unicodeScalars")
    private external fun __jni_get_unicodeScalars(): AttributedString.UnicodeScalarView

    /**
     * The position of the first character in a nonempty attributed substring.
     *
     * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
     */
    val startIndex: AttributedString.Index
      get() = __jni_get_startIndex()
    @JvmName("__jni_get_startIndex")
    private external fun __jni_get_startIndex(): AttributedString.Index

    /**
     * An attributed substring’s past-the-end position — the position one greater than the last valid subscript argument.
     *
     * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
     */
    val endIndex: AttributedString.Index
      get() = __jni_get_endIndex()
    @JvmName("__jni_get_endIndex")
    private external fun __jni_get_endIndex(): AttributedString.Index

    /**
     * An attributed substring representing the full content of the attributed substring.
     */
    val substring: AttributedSubstring
      get() = __jni_get_substring()
    @JvmName("__jni_get_substring")
    private external fun __jni_get_substring(): AttributedSubstring

    /**
     * Obtains an attributed substring representing part of the attributed substring.
     *
     * @param range The portion of the attributed substring to be represented by the substring, bounded by `startIndex` and `endIndex`.
     */
    fun substringForRange(
        /* for */ range: SwiftRange<AttributedString.Index>
    ): AttributedSubstring = __jni_substringForRange(range)
    @JvmName("__jni_substringForRange")
    private external fun __jni_substringForRange(
        range: SwiftRange<AttributedString.Index>
    ): AttributedSubstring

    override fun equals(
        other: Any?
    ): Boolean = (other is AttributedSubstring) && __jni_swiftEquals(this, other)

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
         * Creates an attributed substring with an empty base attributed string.
         */
        fun createEmpty(
        ): AttributedSubstring = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): AttributedSubstring

        fun swiftEquals(
            lhs: AttributedSubstring,
            rhs: AttributedSubstring
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: AttributedSubstring,
            rhs: AttributedSubstring
        ): Boolean

        init { loadNativeLibs() }
    }
}
