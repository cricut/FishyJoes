package com.cricut.testapi

/**
 * <!-- FishyJoes.exportReference(AttributedString) -->
 */
class AttributedString private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
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

    /**
     * <!-- FishyJoes.export(append) -->
     */
    fun append(
        s: com.cricut.testapi.AttributedString
    ): kotlin.Unit = __jni_append(s)
    @JvmName("__jni_append")
    private external fun __jni_append(
        s: com.cricut.testapi.AttributedString
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(insert) -->
     */
    fun insert(
        s: com.cricut.testapi.AttributedString,
        /* at */ index: com.cricut.testapi.AttributedString.Index
    ): kotlin.Unit = __jni_insert(s, index)
    @JvmName("__jni_insert")
    private external fun __jni_insert(
        s: com.cricut.testapi.AttributedString,
        index: com.cricut.testapi.AttributedString.Index
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(removeSubrange) -->
     */
    fun removeSubrange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>
    ): kotlin.Unit = __jni_removeSubrange(range)
    @JvmName("__jni_removeSubrange")
    private external fun __jni_removeSubrange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(replaceSubrange) -->
     */
    fun replaceSubrange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        /* with */ s: com.cricut.testapi.AttributedString
    ): kotlin.Unit = __jni_replaceSubrange(range, s)
    @JvmName("__jni_replaceSubrange")
    private external fun __jni_replaceSubrange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        s: com.cricut.testapi.AttributedString
    ): kotlin.Unit

    override fun equals(
        other: Any?
    ): Boolean = (other is com.cricut.testapi.AttributedString) && __jni_swiftEquals(this, other)

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
        ): com.cricut.testapi.AttributedString = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
            string: kotlin.String,
            attributes: com.cricut.testapi.AttributeContainer? = null
        ): com.cricut.testapi.AttributedString = __jni_create(string, attributes)
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
            string: kotlin.String,
            attributes: com.cricut.testapi.AttributeContainer?
        ): com.cricut.testapi.AttributedString

        /**
         * <!-- FishyJoes.export(createFromSubstring) -->
         */
        fun createFromSubstring(
            substring: com.cricut.testapi.AttributedSubstring
        ): com.cricut.testapi.AttributedString = __jni_createFromSubstring(substring)
        @JvmStatic
        @JvmName("__jni_createFromSubstring")
        private external fun __jni_createFromSubstring(
            substring: com.cricut.testapi.AttributedSubstring
        ): com.cricut.testapi.AttributedString

        fun swiftEquals(
            lhs: com.cricut.testapi.AttributedString,
            rhs: com.cricut.testapi.AttributedString
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: com.cricut.testapi.AttributedString,
            rhs: com.cricut.testapi.AttributedString
        ): Boolean

        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.exportReference(AttributedString.Runs) -->
     */
    class Runs private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
        /**
         * <!-- FishyJoes.export(startIndex) -->
         */
        val startIndex: com.cricut.testapi.AttributedString.Runs.Index
          get() = __jni_get_startIndex()
        @JvmName("__jni_get_startIndex")
        private external fun __jni_get_startIndex(): com.cricut.testapi.AttributedString.Runs.Index

        /**
         * <!-- FishyJoes.export(endIndex) -->
         */
        val endIndex: com.cricut.testapi.AttributedString.Runs.Index
          get() = __jni_get_endIndex()
        @JvmName("__jni_get_endIndex")
        private external fun __jni_get_endIndex(): com.cricut.testapi.AttributedString.Runs.Index

        /**
         * <!-- FishyJoes.export(indexBefore) -->
         */
        fun indexBefore(
            /* before */ i: com.cricut.testapi.AttributedString.Runs.Index
        ): com.cricut.testapi.AttributedString.Runs.Index = __jni_indexBefore(i)
        @JvmName("__jni_indexBefore")
        private external fun __jni_indexBefore(
            i: com.cricut.testapi.AttributedString.Runs.Index
        ): com.cricut.testapi.AttributedString.Runs.Index

        /**
         * <!-- FishyJoes.export(indexAfter) -->
         */
        fun indexAfter(
            /* after */ i: com.cricut.testapi.AttributedString.Runs.Index
        ): com.cricut.testapi.AttributedString.Runs.Index = __jni_indexAfter(i)
        @JvmName("__jni_indexAfter")
        private external fun __jni_indexAfter(
            i: com.cricut.testapi.AttributedString.Runs.Index
        ): com.cricut.testapi.AttributedString.Runs.Index

        /**
         * <!-- FishyJoes.export(elementAt) -->
         */
        fun elementAt(
            /* at */ index: com.cricut.testapi.AttributedString.Runs.Index
        ): com.cricut.testapi.AttributedString.Runs.Run = __jni_elementAt(index)
        @JvmName("__jni_elementAt")
        private external fun __jni_elementAt(
            index: com.cricut.testapi.AttributedString.Runs.Index
        ): com.cricut.testapi.AttributedString.Runs.Run

        /**
         * <!-- FishyJoes.export(elementAtPosition) -->
         */
        fun elementAtPosition(
            /* at */ index: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Runs.Run = __jni_elementAtPosition(index)
        @JvmName("__jni_elementAtPosition")
        private external fun __jni_elementAtPosition(
            index: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Runs.Run

        companion object {
            init { loadNativeLibs() }
        }

        /**
         * <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
         */
        class Run private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
            /**
             * <!-- FishyJoes.export(range) -->
             */
            val range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>
              get() = __jni_get_range()
            @JvmName("__jni_get_range")
            private external fun __jni_get_range(): com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>

            /**
             * <!-- FishyJoes.export(attributes) -->
             */
            val attributes: com.cricut.testapi.AttributeContainer
              get() = __jni_get_attributes()
            @JvmName("__jni_get_attributes")
            private external fun __jni_get_attributes(): com.cricut.testapi.AttributeContainer

            companion object {
                init { loadNativeLibs() }
            }
        }

        /**
         * <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
         */
        class Index private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {

            companion object {
                init { loadNativeLibs() }
            }
        }
    }

    /**
     * <!-- FishyJoes.exportReference(AttributedString.Index) -->
     */
    class Index private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {

        companion object {
            init { loadNativeLibs() }
        }
    }

    /**
     * <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
     */
    class CharacterView private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
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
         * <!-- FishyJoes.export(indexBefore) -->
         */
        fun indexBefore(
            /* before */ i: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Index = __jni_indexBefore(i)
        @JvmName("__jni_indexBefore")
        private external fun __jni_indexBefore(
            i: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Index

        /**
         * <!-- FishyJoes.export(indexAfter) -->
         */
        fun indexAfter(
            /* after */ i: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Index = __jni_indexAfter(i)
        @JvmName("__jni_indexAfter")
        private external fun __jni_indexAfter(
            i: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Index

        /**
         * <!-- FishyJoes.export(elementAt) -->
         */
        fun elementAt(
            /* at */ index: com.cricut.testapi.AttributedString.Index
        ): kotlin.String = __jni_elementAt(index)
        @JvmName("__jni_elementAt")
        private external fun __jni_elementAt(
            index: com.cricut.testapi.AttributedString.Index
        ): kotlin.String

        /**
         * <!-- FishyJoes.export(replaceSubrange, generic: [C: [String]]) -->
         */
        fun replaceSubrange(
            subrange: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
            /* with */ newElements: kotlin.collections.List<kotlin.String>
        ): kotlin.Unit = __jni_replaceSubrange(subrange, newElements)
        @JvmName("__jni_replaceSubrange")
        private external fun __jni_replaceSubrange(
            subrange: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
            newElements: kotlin.collections.List<kotlin.String>
        ): kotlin.Unit

        companion object {
            init { loadNativeLibs() }
        }
    }

    /**
     * <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
     */
    class UnicodeScalarView private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
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
         * <!-- FishyJoes.export(indexBefore) -->
         */
        fun indexBefore(
            /* before */ i: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Index = __jni_indexBefore(i)
        @JvmName("__jni_indexBefore")
        private external fun __jni_indexBefore(
            i: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Index

        /**
         * <!-- FishyJoes.export(indexAfter) -->
         */
        fun indexAfter(
            /* after */ i: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Index = __jni_indexAfter(i)
        @JvmName("__jni_indexAfter")
        private external fun __jni_indexAfter(
            i: com.cricut.testapi.AttributedString.Index
        ): com.cricut.testapi.AttributedString.Index

        /**
         * <!-- FishyJoes.export(indexOffsetByDistance) -->
         */
        fun indexOffsetByDistance(
            i: com.cricut.testapi.AttributedString.Index,
            /* offsetBy */ distance: Long
        ): com.cricut.testapi.AttributedString.Index = __jni_indexOffsetByDistance(i, distance)
        @JvmName("__jni_indexOffsetByDistance")
        private external fun __jni_indexOffsetByDistance(
            i: com.cricut.testapi.AttributedString.Index,
            distance: Long
        ): com.cricut.testapi.AttributedString.Index

        /**
         * <!-- FishyJoes.export(elementAt) -->
         */
        fun elementAt(
            /* at */ index: com.cricut.testapi.AttributedString.Index
        ): UInt = __jni_elementAt(index).toUInt()
        @JvmName("__jni_elementAt")
        private external fun __jni_elementAt(
            index: com.cricut.testapi.AttributedString.Index
        ): Int

        /**
         * <!-- FishyJoes.export(replaceSubrange, generic: [C: [UInt32]]) -->
         */
        fun replaceSubrange(
            subrange: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
            /* with */ newElements: kotlin.collections.List<UInt>
        ): kotlin.Unit = __jni_replaceSubrange(subrange, newElements)
        @JvmName("__jni_replaceSubrange")
        private external fun __jni_replaceSubrange(
            subrange: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
            newElements: kotlin.collections.List<UInt>
        ): kotlin.Unit

        companion object {
            init { loadNativeLibs() }
        }
    }

    /**
     * <!-- FishyJoes.export(AttributedString.AttributeMergePolicy) -->
     */
    sealed class AttributeMergePolicy {
        object KeepNew : AttributeMergePolicy()
        object KeepCurrent : AttributeMergePolicy()

        companion object {
            init { loadNativeLibs() }
        }
    }
}
