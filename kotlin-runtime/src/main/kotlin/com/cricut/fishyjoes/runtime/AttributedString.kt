package com.cricut.fishyjoes.runtime

/**
 * <!-- FishyJoes.exportReference(AttributedString) -->
 */
class AttributedString private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference), Cloneable {
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
     * <!-- FishyJoes.export(string) -->
     */
    val string: kotlin.String
        get() = __jni_get_string()
    @JvmName("__jni_get_string")
    private external fun __jni_get_string(): kotlin.String

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
     * <!-- FishyJoes.export(appendSubstring) -->
     */
    fun appendSubstring(
        s: com.cricut.fishyjoes.runtime.AttributedSubstring
    ): kotlin.Unit = __jni_appendSubstring(s)
    @JvmName("__jni_appendSubstring")
    private external fun __jni_appendSubstring(
        s: com.cricut.fishyjoes.runtime.AttributedSubstring
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
     * <!-- FishyJoes.export(insertSubstring) -->
     */
    fun insertSubstring(
        s: com.cricut.fishyjoes.runtime.AttributedSubstring,
        /* at */ index: com.cricut.fishyjoes.runtime.AttributedString.Index
    ): kotlin.Unit = __jni_insertSubstring(s, index)
    @JvmName("__jni_insertSubstring")
    private external fun __jni_insertSubstring(
        s: com.cricut.fishyjoes.runtime.AttributedSubstring,
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
     * <!-- FishyJoes.export(replaceSubrangeWithSubstring) -->
     */
    fun replaceSubrangeWithSubstring(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        /* with */ s: com.cricut.fishyjoes.runtime.AttributedSubstring
    ): kotlin.Unit = __jni_replaceSubrangeWithSubstring(range, s)
    @JvmName("__jni_replaceSubrangeWithSubstring")
    private external fun __jni_replaceSubrangeWithSubstring(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        s: com.cricut.fishyjoes.runtime.AttributedSubstring
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

    /**
     * <!-- FishyJoes.export(setAttributesForRange) -->
     */
    fun setAttributesForRange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer
    ): kotlin.Unit = __jni_setAttributesForRange(range, attributes)
    @JvmName("__jni_setAttributesForRange")
    private external fun __jni_setAttributesForRange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(mergeAttributesForRange) -->
     */
    fun mergeAttributesForRange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer,
        mergePolicy: com.cricut.fishyjoes.runtime.AttributedString.AttributeMergePolicy? = null
    ): kotlin.Unit = __jni_mergeAttributesForRange(range, attributes, mergePolicy)
    @JvmName("__jni_mergeAttributesForRange")
    private external fun __jni_mergeAttributesForRange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer,
        mergePolicy: com.cricut.fishyjoes.runtime.AttributedString.AttributeMergePolicy?
    ): kotlin.Unit

    /**
     * <!-- FishyJoes.export(replaceAttributesForRange) -->
     */
    fun replaceAttributesForRange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
        attributes: com.cricut.fishyjoes.runtime.AttributeContainer,
        /* with */ others: com.cricut.fishyjoes.runtime.AttributeContainer
    ): kotlin.Unit = __jni_replaceAttributesForRange(range, attributes, others)
    @JvmName("__jni_replaceAttributesForRange")
    private external fun __jni_replaceAttributesForRange(
        range: com.cricut.fishyjoes.runtime.SwiftRange<AttributedString.Index>,
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

    //---------------------//
    //                     //
    // Kotlin Conveniences //
    //                     //
    //---------------------//

    public override fun clone(): com.cricut.fishyjoes.runtime.AttributedString {
        // TODO: Faster! private cloneBox function inside SwiftReference?
        val clone = createEmpty()
        runs.forEach { clone.append(createFromSubstring(substringForRange(it.range))) }
        return clone
    }

    operator fun get(range: SwiftRange<AttributedString.Index>) = substringForRange(range)

    operator fun set(range: SwiftRange<AttributedString.Index>, attributedString: AttributedString) = replaceSubrange(range, attributedString)
    operator fun set(range: SwiftRange<AttributedString.Index>, substring: AttributedSubstring) = replaceSubrangeWithSubstring(range, substring)
    operator fun set(range: SwiftRange<AttributedString.Index>, string: String) = replaceSubrange(range, AttributedString(string))

    operator fun plus(attributedString: AttributedString): AttributedString {
        val result = clone()
        result.append(attributedString)
        return result
    }
    operator fun plus(attributedSubstring: AttributedSubstring): AttributedString {
        val result = clone()
        result.appendSubstring(attributedSubstring)
        return result
    }
    operator fun plus(string: String): AttributedString {
        val result = clone()
        result.append(AttributedString(string))
        return result
    }

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

        operator fun invoke(attributedString: AttributedString) = attributedString.clone()
        operator fun invoke(substring: AttributedSubstring) = AttributedString.createFromSubstring(substring)
        operator fun invoke(string: String, attributes: AttributeContainer? = null) = AttributedString.create(string, attributes)
        operator fun invoke() = AttributedString.createEmpty()

        init { loadNativeLibs() }
    }

    /**
     * <!-- FishyJoes.exportReference(AttributedString.Runs) -->
     */
    class Runs private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference), Iterable<com.cricut.fishyjoes.runtime.AttributedString.Runs.Run> {
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

        //---------------------//
        //                     //
        // Kotlin Conveniences //
        //                     //
        //---------------------//

        operator fun get(index: AttributedString.Runs.Index) = elementAt(index)
        operator fun get(index: AttributedString.Index) = elementAtPosition(index)

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
            override fun compareTo(other: Index) = __jni_compare(other)
            @JvmName("__jni_compare")
            private external fun __jni_compare(
                other: Index
            ): Int

            override fun equals(
                other: Any?
            ): Boolean = (other is com.cricut.fishyjoes.runtime.AttributedString.Runs.Index) && AttributedString.Runs.Index.__jni_swiftEquals(this, other)

            override fun hashCode(
            ): Int = __jni_hashCode()
            @JvmName("__jni_hashCode")
            private external fun __jni_hashCode(
            ): Int

            companion object {
                fun swiftEquals(
                    lhs: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index,
                    rhs: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
                ): Boolean = __jni_swiftEquals(lhs, rhs)
                @JvmStatic
                @JvmName("__jni_swiftEquals")
                private external fun __jni_swiftEquals(
                    lhs: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index,
                    rhs: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
                ): Boolean

                init { loadNativeLibs() }
            }
        }

        override fun iterator(): Iterator<Run> = RunIterator(this, startIndex)

        private class RunIterator constructor(
            private val collection: com.cricut.fishyjoes.runtime.AttributedString.Runs,
            private var iterationIndex: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
        ) : Iterator<com.cricut.fishyjoes.runtime.AttributedString.Runs.Run> {
            override fun hasNext(): Boolean = iterationIndex >= collection.startIndex && iterationIndex < collection.endIndex
            override fun next(): Run {
                val element = collection.elementAt(iterationIndex)
                iterationIndex = collection.indexAfter(iterationIndex)
                return element
            }
        }

        fun rangeIterator(): Iterator<SwiftRange<AttributedString.Index>> = RunRangeIterator(this, startIndex)

        private class RunRangeIterator constructor(
            private val collection: com.cricut.fishyjoes.runtime.AttributedString.Runs,
            private var iterationIndex: com.cricut.fishyjoes.runtime.AttributedString.Runs.Index
        ) : Iterator<SwiftRange<AttributedString.Index>> {
            override fun hasNext(): Boolean = iterationIndex >= collection.startIndex && iterationIndex < collection.endIndex
            override fun next(): SwiftRange<AttributedString.Index> {
                val index = iterationIndex
                iterationIndex = collection.indexAfter(iterationIndex)
                return collection.elementAt(index).range
            }
        }
    }

    /**
     * <!-- FishyJoes.exportReference(AttributedString.Index) -->
     */
    class Index private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference), Comparable<Index> {
        override fun compareTo(other: Index) = __jni_compare(other)
        @JvmName("__jni_compare")
        private external fun __jni_compare(
            other: Index
        ): Int

        override fun equals(
            other: Any?
        ): Boolean = (other is com.cricut.fishyjoes.runtime.AttributedString.Index) && __jni_swiftEquals(this, other)

        override fun hashCode(
        ): Int = __jni_hashCode()
        @JvmName("__jni_hashCode")
        private external fun __jni_hashCode(
        ): Int

        companion object {
            fun swiftEquals(
                lhs: com.cricut.fishyjoes.runtime.AttributedString.Index,
                rhs: com.cricut.fishyjoes.runtime.AttributedString.Index
            ): Boolean = __jni_swiftEquals(lhs, rhs)
            @JvmStatic
            @JvmName("__jni_swiftEquals")
            private external fun __jni_swiftEquals(
                lhs: com.cricut.fishyjoes.runtime.AttributedString.Index,
                rhs: com.cricut.fishyjoes.runtime.AttributedString.Index
            ): Boolean

            init { loadNativeLibs() }
        }
    }

    /**
     * <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
     */
    class CharacterView private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference), Iterable<String> {
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

        //---------------------//
        //                     //
        // Kotlin Conveniences //
        //                     //
        //---------------------//

        operator fun get(index: AttributedString.Index) = elementAt(index)

        override fun iterator(): Iterator<String> = CharacterIterator(this, startIndex)

        private class CharacterIterator constructor(
            private val collection: com.cricut.fishyjoes.runtime.AttributedString.CharacterView,
            private var iterationIndex: com.cricut.fishyjoes.runtime.AttributedString.Index
        ) : Iterator<String> {
            override fun hasNext(): Boolean = iterationIndex >= collection.startIndex && iterationIndex < collection.endIndex
            override fun next(): String {
                val element = collection.elementAt(iterationIndex)
                iterationIndex = collection.indexAfter(iterationIndex)
                return element
            }
        }

        fun rangeIterator(): Iterator<SwiftRange<AttributedString.Index>> = CharacterRangeIterator(this, startIndex)

        private class CharacterRangeIterator constructor(
            private val collection: com.cricut.fishyjoes.runtime.AttributedString.CharacterView,
            private var iterationIndex: com.cricut.fishyjoes.runtime.AttributedString.Index
        ) : Iterator<SwiftRange<AttributedString.Index>> {
            override fun hasNext(): Boolean = iterationIndex >= collection.startIndex && iterationIndex < collection.endIndex
            override fun next(): SwiftRange<AttributedString.Index> {
                val index = iterationIndex
                iterationIndex = collection.indexAfter(iterationIndex)
                return SwiftRange(index, iterationIndex)
            }
        }

        companion object {
            init { loadNativeLibs() }
        }
    }

    /**
     * <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
     */
    class UnicodeScalarView private constructor(swiftReference: Long): com.cricut.fishyjoes.runtime.SwiftReference(swiftReference), Iterable<UInt> {
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

        //---------------------//
        //                     //
        // Kotlin Conveniences //
        //                     //
        //---------------------//

        operator fun get(index: AttributedString.Index) = elementAt(index)

        override fun iterator(): Iterator<UInt> = UnicodeScalarIterator(this, startIndex)

        private class UnicodeScalarIterator constructor(
            private val collection: com.cricut.fishyjoes.runtime.AttributedString.UnicodeScalarView,
            private var iterationIndex: com.cricut.fishyjoes.runtime.AttributedString.Index
        ) : Iterator<UInt> {
            override fun hasNext(): Boolean = iterationIndex >= collection.startIndex && iterationIndex < collection.endIndex
            override fun next(): UInt {
                val element = collection.elementAt(iterationIndex)
                iterationIndex = collection.indexAfter(iterationIndex)
                return element
            }
        }

        fun rangeIterator(): Iterator<SwiftRange<AttributedString.Index>> = UnicodeScalarRangeIterator(this, startIndex)

        private class UnicodeScalarRangeIterator constructor(
            private val collection: com.cricut.fishyjoes.runtime.AttributedString.UnicodeScalarView,
            private var iterationIndex: com.cricut.fishyjoes.runtime.AttributedString.Index
        ) : Iterator<SwiftRange<AttributedString.Index>> {
            override fun hasNext(): Boolean = iterationIndex >= collection.startIndex && iterationIndex < collection.endIndex
            override fun next(): SwiftRange<AttributedString.Index> {
                val index = iterationIndex
                iterationIndex = collection.indexAfter(iterationIndex)
                return SwiftRange(index, iterationIndex)
            }
        }

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
