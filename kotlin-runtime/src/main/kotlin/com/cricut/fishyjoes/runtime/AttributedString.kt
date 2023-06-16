package com.cricut.fishyjoes.runtime

/**
 * <!-- FishyJoes.exportReference(AttributedString) -->
 */
class AttributedString private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
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
     * <!-- FishyJoes.export(substringForRange) -->
     */
    fun substringForRange(
        /* for */ range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>
    ): com.cricut.fishyjoes.runtime.AttributedSubstring = __jni_substringForRange(range)
    @JvmName("__jni_substringForRange")
    private external fun __jni_substringForRange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>
    ): com.cricut.fishyjoes.runtime.AttributedSubstring

    /**
     * <!-- FishyJoes.export(append) -->
     */
    fun append(
        s: com.cricut.fishyjoes.runtime.AttributedString
    ): kotlin.Unit = __jni_append(s)
    @JvmName("__jni_append")
    private external fun __jni_append(
        s: com.cricut.fishyjoes.runtime.AttributedString
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(insert) -->
     */
    fun insert(
        s: com.cricut.fishyjoes.runtime.AttributedString,
        /* at */ index: com.cricut.fishyjoes.runtime.AttributedString.Index
    ): kotlin.Unit = __jni_insert(s, index)
    @JvmName("__jni_insert")
    private external fun __jni_insert(
        s: com.cricut.fishyjoes.runtime.AttributedString,
        index: com.cricut.fishyjoes.runtime.AttributedString.Index
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
        /* with */ s: com.cricut.fishyjoes.runtime.AttributedString
    ): kotlin.Unit = __jni_replaceSubrange(range, s)
    @JvmName("__jni_replaceSubrange")
    private external fun __jni_replaceSubrange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        s: com.cricut.fishyjoes.runtime.AttributedString
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(setAttributes) -->
     */
    fun setAttributes(
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer
    ): kotlin.Unit = __jni_setAttributes(attributes)
    @JvmName("__jni_setAttributes")
    private external fun __jni_setAttributes(
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(mergeAttributes) -->
     */
    fun mergeAttributes(
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer,
        mergePolicy: com.cricut.fishyjoes.runtime.AttributedString.AttributeMergePolicy? = null
    ): kotlin.Unit = __jni_mergeAttributes(attributes, mergePolicy)
    @JvmName("__jni_mergeAttributes")
    private external fun __jni_mergeAttributes(
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer,
        mergePolicy: com.cricut.fishyjoes.runtime.AttributedString.AttributeMergePolicy?
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(replaceAttributes) -->
     */
    fun replaceAttributes(
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer,
        /* with */ others: com.cricut.fishyjoes.runtime.AttributeContainer
    ): kotlin.Unit = __jni_replaceAttributes(attributes, others)
    @JvmName("__jni_replaceAttributes")
    private external fun __jni_replaceAttributes(
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer,
        others: com.cricut.fishyjoes.runtime.AttributeContainer
    ): kotlin.Unit

    override fun equals(
        other: Any?
    ): Boolean = (other is com.cricut.fishyjoes.runtime.AttributedString) && __jni_swiftEquals(this, other)

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
        ): com.cricut.fishyjoes.runtime.AttributedString = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(create) -->
         */
        fun create(
            string: kotlin.String,
            attributes: com.cricut.fishyjoes.runtime.AttributeContainer? = null
        ): com.cricut.fishyjoes.runtime.AttributedString = __jni_create(string, attributes)
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
            string: kotlin.String,
            attributes: com.cricut.fishyjoes.runtime.AttributeContainer?
        ): com.cricut.fishyjoes.runtime.AttributedString

        /**
         * <!-- FishyJoes.export(createFromSubstring) -->
         */
        fun createFromSubstring(
            substring: com.cricut.fishyjoes.runtime.AttributedSubstring
        ): com.cricut.fishyjoes.runtime.AttributedString = __jni_createFromSubstring(substring)
        @JvmStatic
        @JvmName("__jni_createFromSubstring")
        private external fun __jni_createFromSubstring(
            substring: com.cricut.fishyjoes.runtime.AttributedSubstring
        ): com.cricut.fishyjoes.runtime.AttributedString

        fun swiftEquals(
            lhs: com.cricut.fishyjoes.runtime.AttributedString,
            rhs: com.cricut.fishyjoes.runtime.AttributedString
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: com.cricut.fishyjoes.runtime.AttributedString,
            rhs: com.cricut.fishyjoes.runtime.AttributedString
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
        val startIndex: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
          get() = __jni_get_startIndex()
        @JvmName("__jni_get_startIndex")
        private external fun __jni_get_startIndex(): com.cricut.fishyjoes.runtime.AttributedString.Runs.Index

        /**
         * <!-- FishyJoes.export(endIndex) -->
         */
        val endIndex: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
          get() = __jni_get_endIndex()
        @JvmName("__jni_get_endIndex")
        private external fun __jni_get_endIndex(): com.cricut.fishyjoes.runtime.AttributedString.Runs.Index

        /**
         * <!-- FishyJoes.export(indexBefore) -->
         */
        fun indexBefore(
            /* before */ i: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Runs.Index = __jni_indexBefore(i)
        @JvmName("__jni_indexBefore")
        private external fun __jni_indexBefore(
            i: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Runs.Index

        /**
         * <!-- FishyJoes.export(indexAfter) -->
         */
        fun indexAfter(
            /* after */ i: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Runs.Index = __jni_indexAfter(i)
        @JvmName("__jni_indexAfter")
        private external fun __jni_indexAfter(
            i: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Runs.Index

        /**
         * <!-- FishyJoes.export(elementAt) -->
         */
        fun elementAt(
            /* at */ index: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Runs.Run = __jni_elementAt(index)
        @JvmName("__jni_elementAt")
        private external fun __jni_elementAt(
            index: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Runs.Run

        /**
         * <!-- FishyJoes.export(elementAtPosition) -->
         */
        fun elementAtPosition(
            /* at */ index: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Runs.Run = __jni_elementAtPosition(index)
        @JvmName("__jni_elementAtPosition")
        private external fun __jni_elementAtPosition(
            index: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Runs.Run

        override fun equals(
            other: Any?
        ): Boolean = (other is com.cricut.fishyjoes.runtime.AttributedString.Runs) && __jni_swiftEquals(this, other)

        override fun hashCode(
        ): Int = __jni_hashCode()
        @JvmName("__jni_hashCode")
        private external fun __jni_hashCode(
        ): Int

        companion object {
            fun swiftEquals(
                lhs: com.cricut.fishyjoes.runtime.AttributedString.Runs,
                rhs: com.cricut.fishyjoes.runtime.AttributedString.Runs
            ): Boolean = __jni_swiftEquals(lhs, rhs)
            @JvmStatic
            @JvmName("__jni_swiftEquals")
            private external fun __jni_swiftEquals(
                lhs: com.cricut.fishyjoes.runtime.AttributedString.Runs,
                rhs: com.cricut.fishyjoes.runtime.AttributedString.Runs
            ): Boolean

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
            val attributes: com.cricut.fishyjoes.runtime.AttributeContainer
              get() = __jni_get_attributes()
            @JvmName("__jni_get_attributes")
            private external fun __jni_get_attributes(): com.cricut.fishyjoes.runtime.AttributeContainer

            override fun equals(
                other: Any?
            ): Boolean = (other is com.cricut.fishyjoes.runtime.AttributedString.Runs.Run) && __jni_swiftEquals(this, other)

            override fun hashCode(
            ): Int = __jni_hashCode()
            @JvmName("__jni_hashCode")
            private external fun __jni_hashCode(
            ): Int

            companion object {
                fun swiftEquals(
                    lhs: com.cricut.fishyjoes.runtime.AttributedString.Runs.Run,
                    rhs: com.cricut.fishyjoes.runtime.AttributedString.Runs.Run
                ): Boolean = __jni_swiftEquals(lhs, rhs)
                @JvmStatic
                @JvmName("__jni_swiftEquals")
                private external fun __jni_swiftEquals(
                    lhs: com.cricut.fishyjoes.runtime.AttributedString.Runs.Run,
                    rhs: com.cricut.fishyjoes.runtime.AttributedString.Runs.Run
                ): Boolean

                init { loadNativeLibs() }
            }
        }

        /**
         * <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
         */
        class Index private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference), Comparable<Index> {
            override fun compareTo(other: Index) = 0
            companion object {
                init { loadNativeLibs() }
            }
        }
    }

    /**
     * <!-- FishyJoes.exportReference(AttributedString.Index) -->
     */
    class Index private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference), Comparable<Index> {
        override fun compareTo(other: Index) = 0
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
         * <!-- FishyJoes.export(indexBefore) -->
         */
        fun indexBefore(
            /* before */ i: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Index = __jni_indexBefore(i)
        @JvmName("__jni_indexBefore")
        private external fun __jni_indexBefore(
            i: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Index

        /**
         * <!-- FishyJoes.export(indexAfter) -->
         */
        fun indexAfter(
            /* after */ i: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Index = __jni_indexAfter(i)
        @JvmName("__jni_indexAfter")
        private external fun __jni_indexAfter(
            i: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Index

        /**
         * <!-- FishyJoes.export(elementAt) -->
         */
        fun elementAt(
            /* at */ index: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): kotlin.String = __jni_elementAt(index)
        @JvmName("__jni_elementAt")
        private external fun __jni_elementAt(
            index: com.cricut.fishyjoes.runtime.AttributedString.Index
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
         * <!-- FishyJoes.export(indexBefore) -->
         */
        fun indexBefore(
            /* before */ i: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Index = __jni_indexBefore(i)
        @JvmName("__jni_indexBefore")
        private external fun __jni_indexBefore(
            i: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Index

        /**
         * <!-- FishyJoes.export(indexAfter) -->
         */
        fun indexAfter(
            /* after */ i: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Index = __jni_indexAfter(i)
        @JvmName("__jni_indexAfter")
        private external fun __jni_indexAfter(
            i: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): com.cricut.fishyjoes.runtime.AttributedString.Index

        /**
         * <!-- FishyJoes.export(indexOffsetByDistance) -->
         */
        fun indexOffsetByDistance(
            i: com.cricut.fishyjoes.runtime.AttributedString.Index,
            /* offsetBy */ distance: Long
        ): com.cricut.fishyjoes.runtime.AttributedString.Index = __jni_indexOffsetByDistance(i, distance)
        @JvmName("__jni_indexOffsetByDistance")
        private external fun __jni_indexOffsetByDistance(
            i: com.cricut.fishyjoes.runtime.AttributedString.Index,
            distance: Long
        ): com.cricut.fishyjoes.runtime.AttributedString.Index

        /**
         * <!-- FishyJoes.export(elementAt) -->
         */
        fun elementAt(
            /* at */ index: com.cricut.fishyjoes.runtime.AttributedString.Index
        ): UInt = __jni_elementAt(index).toUInt()
        @JvmName("__jni_elementAt")
        private external fun __jni_elementAt(
            index: com.cricut.fishyjoes.runtime.AttributedString.Index
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
     * <!-- FishyJoes.exportReference(AttributedString.AttributeMergePolicy) -->
     */
    class AttributeMergePolicy private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference) {
        override fun equals(
            other: Any?
        ): Boolean = (other is com.cricut.fishyjoes.runtime.AttributedString.AttributeMergePolicy) && __jni_swiftEquals(this, other)

        override fun hashCode(
        ): Int = __jni_hashCode()
        @JvmName("__jni_hashCode")
        private external fun __jni_hashCode(
        ): Int

        companion object {
            fun swiftEquals(
                lhs: com.cricut.fishyjoes.runtime.AttributedString.AttributeMergePolicy,
                rhs: com.cricut.fishyjoes.runtime.AttributedString.AttributeMergePolicy
            ): Boolean = __jni_swiftEquals(lhs, rhs)
            @JvmStatic
            @JvmName("__jni_swiftEquals")
            private external fun __jni_swiftEquals(
                lhs: com.cricut.fishyjoes.runtime.AttributedString.AttributeMergePolicy,
                rhs: com.cricut.fishyjoes.runtime.AttributedString.AttributeMergePolicy
            ): Boolean

            init { loadNativeLibs() }
        }
    }
}
