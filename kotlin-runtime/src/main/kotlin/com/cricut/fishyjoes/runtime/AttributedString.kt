package com.cricut.fishyjoes.runtime

/**
 * A string with associated attributes for portions of its text.
 *
 * See `text` or `characters` for access to the text of an attributed string.
 * See `runs` for access to the attribute information associated with the attributed string's text.
 */
class AttributedString private constructor(swiftReference: Long): SwiftReference(swiftReference), Cloneable {
    /**
     * Text represented by the attributed string.
     *
     * See `runs` for the attribute information associated with the attributed string's text.
     */
    val string: kotlin.String
        get() = __jni_get_string()
    @JvmName("__jni_get_string")
    private external fun __jni_get_string(): kotlin.String

    /**
     * The attributed runs of the attributed string, as a view into the underlying string.
     *
     * This view provides access to the attribute information associated with the attributed string.
     *
     * See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
     * are associated with a particular position in the attributed string.
     *
     * For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
     * and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.
     */
    val runs: AttributedString.Runs
        get() = __jni_get_runs()
    @JvmName("__jni_get_runs")
    private external fun __jni_get_runs(): AttributedString.Runs

    /**
     * The characters of the attributed string, as a view into the underlying string.
     */
    val characters: AttributedString.CharacterView
        get() = __jni_get_characters()
    @JvmName("__jni_get_characters")
    private external fun __jni_get_characters(): AttributedString.CharacterView

    /**
     * The Unicode scalars of the attributed string, as a view into the underlying string.
     */
    val unicodeScalars: AttributedString.UnicodeScalarView
      get() = __jni_get_unicodeScalars()
    @JvmName("__jni_get_unicodeScalars")
    private external fun __jni_get_unicodeScalars(): AttributedString.UnicodeScalarView

    /**
     * An attributed substring representing the full content of the attributed string.
     */
    val substring: AttributedSubstring
        get() = __jni_get_substring()
    @JvmName("__jni_get_substring")
    private external fun __jni_get_substring(): AttributedSubstring

    /**
     * Obtains an attributed substring representing part of the attributed string.
     *
     * @param range The portion of the attributed string to be represented by the substring, bounded by `startIndex` and `endIndex`.
     */
    fun substringForRange(
        range: SwiftRange<AttributedString.Index>
    ): AttributedSubstring = __jni_substringForRange(range)
    @JvmName("__jni_substringForRange")
    private external fun __jni_substringForRange(
        range: SwiftRange<AttributedString.Index>
    ): AttributedSubstring

    /**
     * The position of the first character in a nonempty attributed string.
     *
     * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
     */
    val startIndex: AttributedString.Index
        get() = __jni_get_startIndex()
    @JvmName("__jni_get_startIndex")
    private external fun __jni_get_startIndex(): AttributedString.Index

    /**
     * An attributed string’s past-the-end position — the position one greater than the last valid subscript argument.
     *
     * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
     */
    val endIndex: AttributedString.Index
        get() = __jni_get_endIndex()
    @JvmName("__jni_get_endIndex")
    private external fun __jni_get_endIndex(): AttributedString.Index

    /**
     * Appends the text and any associated attributes of another attributed string to the end of this one.
     * @param attributedString The attributed string containing the text and attributes to append.
     */
    fun append(
        attributedString: AttributedString
    ): kotlin.Unit = __jni_append(attributedString)
    @JvmName("__jni_append")
    private external fun __jni_append(
        attributedString: AttributedString
    ): kotlin.Unit

    /**
     * Appends the text and any associated attributes of the portion of an attributed string represented by a substring to the end of this one.
     * @param subtring The substring containing the text and attributes to append.
     */
    fun appendSubstring(
        subtring: AttributedSubstring
    ): kotlin.Unit = __jni_appendSubstring(subtring)
    @JvmName("__jni_appendSubstring")
    private external fun __jni_appendSubstring(
        attributedString: AttributedSubstring
    ): kotlin.Unit

    /**
     * Inserts the text and any associated attributes of another attributed string into this one at the specified position.
     *
     * @param attributedString The attributed string containing the text and attributes to insert.
     * @param index Position at which the content of `attributedString` should be inserted, bounded by `startIndex` and `endIndex`.
     *              If `index` is `startIndex` the content will be inserted before all content of this attributed string.
     *              If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `append()`.
     */
    fun insert(
        attributedString: AttributedString,
        index: AttributedString.Index
    ): kotlin.Unit = __jni_insert(attributedString, index)
    @JvmName("__jni_insert")
    private external fun __jni_insert(
        attributedString: AttributedString,
        index: AttributedString.Index
    ): kotlin.Unit

    /**
     * Inserts the text and any associated attributes of a substring of an attributed string into this one at the specified position.
     *
     * @param substring The substring of an attributed string containing the text and attributes to insert.
     * @param index Position at which the content of `substring` should be inserted, bounded by `startIndex` and `endIndex`.
     *              If `index` is `startIndex` the content will be inserted before all content of this attributed string.
     *              If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `appendSubstring()`.
     */
    fun insertSubstring(
        substring: AttributedSubstring,
        index: AttributedString.Index
    ): kotlin.Unit = __jni_insertSubstring(substring, index)
    @JvmName("__jni_insertSubstring")
    private external fun __jni_insertSubstring(
        substring: AttributedSubstring,
        index: AttributedString.Index
    ): kotlin.Unit

    /**
     * Replaces a portion of the text and associated attributes of the attributed string with content from another one.
     *
     * @param range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
     * @param attributedString The attributed string containing the text and attributes that replaces the content in `range`.
     */
    fun replaceSubrange(
        range: SwiftRange<AttributedString.Index>,
        attributedString: AttributedString
    ): kotlin.Unit = __jni_replaceSubrange(range, attributedString)
    @JvmName("__jni_replaceSubrange")
    private external fun __jni_replaceSubrange(
        range: SwiftRange<AttributedString.Index>,
        attributedString: AttributedString
    ): kotlin.Unit

    /**
     * Replaces a portion of the text and associated attributes of the attributed string with content from a substring of another one.
     *
     * @param range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
     * @param substring The substring of an attributed string containing the text and attributes that replaces the content in `range`.
     */
    fun replaceSubrangeWithSubstring(
        range: SwiftRange<AttributedString.Index>,
        substring: AttributedSubstring
    ): kotlin.Unit = __jni_replaceSubrangeWithSubstring(range, substring)
    @JvmName("__jni_replaceSubrangeWithSubstring")
    private external fun __jni_replaceSubrangeWithSubstring(
        range: SwiftRange<AttributedString.Index>,
        substring: AttributedSubstring
    ): kotlin.Unit

    /**
     * Removes a portion of the text and associated attributes from the attributed string.
     *
     * @param range The portion of the attributed string to remove, bounded by `startIndex` and `endIndex`.
     */
    fun removeSubrange(
        range: SwiftRange<AttributedString.Index>
    ): kotlin.Unit = __jni_removeSubrange(range)
    @JvmName("__jni_removeSubrange")
    private external fun __jni_removeSubrange(
        range: SwiftRange<AttributedString.Index>
    ): kotlin.Unit

    /**
     * Associates attributes with the content of the entire attributed string, replacing any existing attribute information.
     *
     * @param attributes The attributes which will subsequently apply to all text in the attributed string.
     */
    fun setAttributes(
        attributes: AttributeContainer
    ): kotlin.Unit = __jni_setAttributes(attributes)
    @JvmName("__jni_setAttributes")
    private external fun __jni_setAttributes(
        attributes: AttributeContainer
    ): kotlin.Unit

    /**
     * Associates attributes with the content of a portion of the attributed string, replacing any existing attribute information.
     *
     * @param range The portion of the attributed string whose attributes are to be replaced, bounded by `startIndex` and `endIndex`.
     * @param attributes The attributes which will subsequently apply to the text in `range`.
     */
    fun setAttributesForRange(
        range: SwiftRange<AttributedString.Index>,
        attributes: AttributeContainer
    ): kotlin.Unit = __jni_setAttributesForRange(range, attributes)
    @JvmName("__jni_setAttributesForRange")
    private external fun __jni_setAttributesForRange(
        range: SwiftRange<AttributedString.Index>,
        attributes: AttributeContainer
    ): kotlin.Unit

    /**
     * Associates attributes with the content of the entire attributed string, merging with any existing attribute information.
     *
     * @param attributes The attributes which will subsequently apply to all text in the attributed string.
     * @param keepCurrent For attributes in `attributes` that already have a value in the attributed string,
     *                    passing `true` retains the current value of the attribute,
     *                    passing `false` replaces the value of the attribute with the one in `attributes`.
     */
    fun mergeAttributes(
        attributes: AttributeContainer,
        keepCurrent: Boolean = false
    ): kotlin.Unit = __jni_mergeAttributes(attributes, keepCurrent)
    @JvmName("__jni_mergeAttributes")
    private external fun __jni_mergeAttributes(
        attributes: AttributeContainer,
        keepCurrent: Boolean
    ): kotlin.Unit

    /**
     * Associates attributes with the content of a portion of the attributed string, merging with any existing attribute information.
     *
     * @param range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
     * @param attributes The attributes which will subsequently apply to the text in `range`.
     * @param keepCurrent For attributes in `attributes` that already have a value in `range` in the attributed string,
     *                    passing `true` retains the current value of the attribute,
     *                    passing `false` replaces the value of the attribute with the one in `attributes`.
     */
    fun mergeAttributesForRange(
        range: SwiftRange<AttributedString.Index>,
        attributes: AttributeContainer,
        keepCurrent: Boolean = false
    ): kotlin.Unit = __jni_mergeAttributesForRange(range, attributes, keepCurrent)
    @JvmName("__jni_mergeAttributesForRange")
    private external fun __jni_mergeAttributesForRange(
        range: SwiftRange<AttributedString.Index>,
        attributes: AttributeContainer,
        keepCurrent: Boolean
    ): kotlin.Unit

    /**
     * Replaces occurrences of attributes in one attribute container with those in another attribute container.
     *
     * @param attributes The existing attributes to replace.
     * @param others The new attributes to apply.
     */
    fun replaceAttributes(
        attributes: AttributeContainer,
        others: AttributeContainer
    ): kotlin.Unit = __jni_replaceAttributes(attributes, others)
    @JvmName("__jni_replaceAttributes")
    private external fun __jni_replaceAttributes(
        attributes: AttributeContainer,
        others: AttributeContainer
    ): kotlin.Unit

    /**
     * Replaces occurrences of attributes in one attribute container with those in another attribute container.
     *
     * @param range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
     * @param attributes The existing attributes to replace.
     * @param others The new attributes to apply.
     */
    fun replaceAttributesForRange(
        range: SwiftRange<AttributedString.Index>,
        attributes: AttributeContainer,
        others: AttributeContainer
    ): kotlin.Unit = __jni_replaceAttributesForRange(range, attributes, others)
    @JvmName("__jni_replaceAttributesForRange")
    private external fun __jni_replaceAttributesForRange(
        range: SwiftRange<AttributedString.Index>,
        attributes: AttributeContainer,
        others: AttributeContainer
    ): kotlin.Unit

    override fun equals(
        other: Any?
    ): Boolean = (other is AttributedString) && __jni_swiftEquals(this, other)

    override fun hashCode(
    ): Int = __jni_hashCode()
    @JvmName("__jni_hashCode")
    private external fun __jni_hashCode(
    ): Int

    public override fun clone(): AttributedString {
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
         * Creates an attributed string containing the empty string as its text with no associated attributes.
         */
        fun createEmpty(
        ): AttributedString = __jni_createEmpty()
        @JvmStatic
        @JvmName("__jni_createEmpty")
        private external fun __jni_createEmpty(
        ): AttributedString

        /**
         * Creates an attributed string containing a string as its text, all associated with the specified attributes.
         *
         * @param string A string containing the text to serve as the content of the attributed string.
         * @param attributes Attributes to associate with the full range of the attributed string.
         */
        fun create(
            string: kotlin.String,
            attributes: AttributeContainer? = null
        ): AttributedString = __jni_create(string, attributes)
        @JvmStatic
        @JvmName("__jni_create")
        private external fun __jni_create(
            string: kotlin.String,
            attributes: AttributeContainer?
        ): AttributedString

        /**
         * Creates an attributed string drawing its the text and attributes from a substring of another attributed string.
         *
         * @param substring A substring of another attributed string whose content is used for the created attributed string.
         */
        fun createFromSubstring(
            substring: AttributedSubstring
        ): AttributedString = __jni_createFromSubstring(substring)
        @JvmStatic
        @JvmName("__jni_createFromSubstring")
        private external fun __jni_createFromSubstring(
            substring: AttributedSubstring
        ): AttributedString

        fun swiftEquals(
            lhs: AttributedString,
            rhs: AttributedString
        ): Boolean = __jni_swiftEquals(lhs, rhs)
        @JvmStatic
        @JvmName("__jni_swiftEquals")
        private external fun __jni_swiftEquals(
            lhs: AttributedString,
            rhs: AttributedString
        ): Boolean

        operator fun invoke(attributedString: AttributedString) = attributedString.clone()
        operator fun invoke(substring: AttributedSubstring) = AttributedString.createFromSubstring(substring)
        operator fun invoke(string: String, attributes: AttributeContainer? = null) = AttributedString.create(string, attributes)
        operator fun invoke() = AttributedString.createEmpty()

        init { loadNativeLibs() }
    }

    /**
     * An iterable view into segments of the attributed string or substring, each of which indicates where a run of identical attributes begins or ends.
     */
    class Runs private constructor(swiftReference: Long): SwiftReference(swiftReference), Iterable<AttributedString.Runs.Run> {
        /**
         * The position of the first run in a nonempty attributed string or substring.
         */
        val startIndex: AttributedString.Runs.Index
          get() = __jni_get_startIndex()
        @JvmName("__jni_get_startIndex")
        private external fun __jni_get_startIndex(): AttributedString.Runs.Index

        /**
         * The past-the-end position — the position one greater than the last valid subscript argument.
         */
        val endIndex: AttributedString.Runs.Index
          get() = __jni_get_endIndex()
        @JvmName("__jni_get_endIndex")
        private external fun __jni_get_endIndex(): AttributedString.Runs.Index

        /**
         * Obtains the run index before another index.
         *
         * @param index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
         * @returns The index of the run before `index`.
         *          If `index` is `startIndex` an exception is thrown.
         *          If `index` is `endIndex`, the last valid index is returned.
         */
        fun indexBefore(
            index: AttributedString.Runs.Index
        ): AttributedString.Runs.Index = __jni_indexBefore(index)
        @JvmName("__jni_indexBefore")
        private external fun __jni_indexBefore(
            index: AttributedString.Runs.Index
        ): AttributedString.Runs.Index

        /**
         * Obtains the run index after another index.
         *
         * @param index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
         * @returns The index of the run after `index`.
         *          If `index` is `endIndex`, an exception is thrown.
         *          If `index` is `startIndex`, the first valid index is returned.
         */
        fun indexAfter(
            index: AttributedString.Runs.Index
        ): AttributedString.Runs.Index = __jni_indexAfter(index)
        @JvmName("__jni_indexAfter")
        private external fun __jni_indexAfter(
            index: AttributedString.Runs.Index
        ): AttributedString.Runs.Index

        /**
         * Obtains the run descriptor at a run index.
         *
         * @param index The index of the desired run, between `startIndex` inclusive and `endIndex` exclusive.
         * @returns The descriptor for the run at `index`.
         *          If `index` is `endIndex`, an exception is thrown.
         *          If `index` is `startIndex`, the first valid run descriptor is returned.
         */
        fun elementAt(
            index: AttributedString.Runs.Index
        ): AttributedString.Runs.Run = __jni_elementAt(index)
        @JvmName("__jni_elementAt")
        private external fun __jni_elementAt(
            index: AttributedString.Runs.Index
        ): AttributedString.Runs.Run

        /**
         * Obtains the run descriptor associated with an attributed string index.
         *
         * @param index The index of the desired position in the attributed string or substring that this object is a view for,
         *              between its `startIndex` inclusive and `endIndex` exclusive.
         * @returns The descriptor for the run whose `range` contains `index`.
         *          If `index` is `endIndex` of the view's attributed string or substring, an exception is thrown.
         *          If `index` is `startIndex` of the view's attributed string or substring, the first valid run descriptor is returned.
         */
        fun elementAtPosition(
            /* at */ index: AttributedString.Index
        ): AttributedString.Runs.Run = __jni_elementAtPosition(index)
        @JvmName("__jni_elementAtPosition")
        private external fun __jni_elementAtPosition(
            index: AttributedString.Index
        ): AttributedString.Runs.Run

        override fun equals(
            other: Any?
        ): Boolean = (other is AttributedString.Runs) && __jni_swiftEquals(this, other)

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
                lhs: AttributedString.Runs,
                rhs: AttributedString.Runs
            ): Boolean = __jni_swiftEquals(lhs, rhs)
            @JvmStatic
            @JvmName("__jni_swiftEquals")
            private external fun __jni_swiftEquals(
                lhs: AttributedString.Runs,
                rhs: AttributedString.Runs
            ): Boolean

            init { loadNativeLibs() }
        }


        /**
         * Description of a run of attributes within an attributed string or substring.
         */
        class Run private constructor(swiftReference: Long): SwiftReference(swiftReference) {
            /**
             * The range of the portion of the attributed string that this run description represents.
             */
            val range: SwiftRange<AttributedString.Index>
              get() = __jni_get_range()
            @JvmName("__jni_get_range")
            private external fun __jni_get_range(): SwiftRange<AttributedString.Index>

            /**
             * The attributes associated with of the portion of the attributed string that this run description represents.
             */
            val attributes: AttributeContainer
              get() = __jni_get_attributes()
            @JvmName("__jni_get_attributes")
            private external fun __jni_get_attributes(): AttributeContainer

            override fun equals(
                other: Any?
            ): Boolean = (other is AttributedString.Runs.Run) && __jni_swiftEquals(this, other)

            override fun hashCode(
            ): Int = __jni_hashCode()
            @JvmName("__jni_hashCode")
            private external fun __jni_hashCode(
            ): Int

            companion object {
                fun swiftEquals(
                    lhs: AttributedString.Runs.Run,
                    rhs: AttributedString.Runs.Run
                ): Boolean = __jni_swiftEquals(lhs, rhs)
                @JvmStatic
                @JvmName("__jni_swiftEquals")
                private external fun __jni_swiftEquals(
                    lhs: AttributedString.Runs.Run,
                    rhs: AttributedString.Runs.Run
                ): Boolean

                init { loadNativeLibs() }
            }
        }

        /**
         * A type that represents the position of a descriptor for a run within an attributed string's view of runs.
         */
        class Index private constructor(swiftReference: Long): SwiftReference(swiftReference), Comparable<Index> {
            override fun compareTo(other: Index) = __jni_compare(other)
            @JvmName("__jni_compare")
            private external fun __jni_compare(
                other: Index
            ): Int

            override fun equals(
                other: Any?
            ): Boolean = (other is AttributedString.Runs.Index) && AttributedString.Runs.Index.__jni_swiftEquals(this, other)

            override fun hashCode(
            ): Int = __jni_hashCode()
            @JvmName("__jni_hashCode")
            private external fun __jni_hashCode(
            ): Int

            companion object {
                fun swiftEquals(
                    lhs: AttributedString.Runs.Index,
                    rhs: AttributedString.Runs.Index
                ): Boolean = __jni_swiftEquals(lhs, rhs)
                @JvmStatic
                @JvmName("__jni_swiftEquals")
                private external fun __jni_swiftEquals(
                    lhs: AttributedString.Runs.Index,
                    rhs: AttributedString.Runs.Index
                ): Boolean

                init { loadNativeLibs() }
            }
        }

        override fun iterator(): Iterator<Run> = RunIterator(this, startIndex)

        private class RunIterator constructor(
            private val collection: AttributedString.Runs,
            private var iterationIndex: AttributedString.Runs.Index
        ) : Iterator<AttributedString.Runs.Run> {
            override fun hasNext(): Boolean = iterationIndex >= collection.startIndex && iterationIndex < collection.endIndex
            override fun next(): Run {
                val element = collection.elementAt(iterationIndex)
                iterationIndex = collection.indexAfter(iterationIndex)
                return element
            }
        }

        /**
         * Returns an iterator over the ranges of runs of identical attributes for portions of the view's attributed string.
         */
        fun rangeIterator(): Iterator<SwiftRange<AttributedString.Index>> = RunRangeIterator(this, startIndex)

        private class RunRangeIterator constructor(
            private val collection: AttributedString.Runs,
            private var iterationIndex: AttributedString.Runs.Index
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
     * A type that represents the position of a character or code unit within an attributed string.
     */
    class Index private constructor(swiftReference: Long): SwiftReference(swiftReference), Comparable<Index> {
        override fun compareTo(other: Index) = __jni_compare(other)
        @JvmName("__jni_compare")
        private external fun __jni_compare(
            other: Index
        ): Int

        override fun equals(
            other: Any?
        ): Boolean = (other is AttributedString.Index) && __jni_swiftEquals(this, other)

        override fun hashCode(
        ): Int = __jni_hashCode()
        @JvmName("__jni_hashCode")
        private external fun __jni_hashCode(
        ): Int

        companion object {
            fun swiftEquals(
                lhs: AttributedString.Index,
                rhs: AttributedString.Index
            ): Boolean = __jni_swiftEquals(lhs, rhs)
            @JvmStatic
            @JvmName("__jni_swiftEquals")
            private external fun __jni_swiftEquals(
                lhs: AttributedString.Index,
                rhs: AttributedString.Index
            ): Boolean

            init { loadNativeLibs() }
        }
    }

    /**
     * A view into the underlying storage of an attributed string or substring, as Unicode characters.
     */
    class CharacterView private constructor(swiftReference: Long): SwiftReference(swiftReference), Iterable<String> {
        /**
         * The position of the first character in a nonempty attributed string or substring.
         */
        val startIndex: AttributedString.Index
          get() = __jni_get_startIndex()
        @JvmName("__jni_get_startIndex")
        private external fun __jni_get_startIndex(): AttributedString.Index

        /**
         * The past-the-end position — the position one greater than the last valid subscript argument.
         */
        val endIndex: AttributedString.Index
          get() = __jni_get_endIndex()
        @JvmName("__jni_get_endIndex")
        private external fun __jni_get_endIndex(): AttributedString.Index

        /**
         * Obtains the index of the character before the character referenced by another index in the view's attributed string or substring.
         *
         * @param index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
         * @returns The index of the character before the one referenced by `index`.
         *          If `index` is `startIndex` an exception is thrown.
         *          If `index` is `endIndex`, the index to the last character in the view's attributed string or substring is returned.
         */
        fun indexBefore(
            /* before */ i: AttributedString.Index
        ): AttributedString.Index = __jni_indexBefore(i)
        @JvmName("__jni_indexBefore")
        private external fun __jni_indexBefore(
            i: AttributedString.Index
        ): AttributedString.Index

        /**
         * Obtains the index of the character after the character referenced by another index in the view's attributed string or substring.
         *
         * @param index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
         * @returns The index of the character before the one referenced by `index`.
         *          If `index` is `endIndex` an exception is thrown.
         *          If `index` is `startIndex`, the index to the first character in the view's attributed string or substring is returned.
         */
        fun indexAfter(
            /* after */ i: AttributedString.Index
        ): AttributedString.Index = __jni_indexAfter(i)
        @JvmName("__jni_indexAfter")
        private external fun __jni_indexAfter(
            i: AttributedString.Index
        ): AttributedString.Index

        /**
         * Obtains the character associated with an attributed string index.
         *
         * @param index The index of the desired character, between `startIndex` inclusive and `endIndex` exclusive.
         * @returns The character associated with `index`.
         *          If `index` is `endIndex`, an exception is thrown.
         *          If `index` is `startIndex`, the first character in the view's attributed string or substring is returned.
         */
        fun elementAt(
            /* at */ index: AttributedString.Index
        ): kotlin.String = __jni_elementAt(index)
        @JvmName("__jni_elementAt")
        private external fun __jni_elementAt(
            index: AttributedString.Index
        ): kotlin.String

        //---------------------//
        //                     //
        // Kotlin Conveniences //
        //                     //
        //---------------------//

        operator fun get(index: AttributedString.Index) = elementAt(index)

        override fun iterator(): Iterator<String> = CharacterIterator(this, startIndex)

        private class CharacterIterator constructor(
            private val collection: AttributedString.CharacterView,
            private var iterationIndex: AttributedString.Index
        ) : Iterator<String> {
            override fun hasNext(): Boolean = iterationIndex >= collection.startIndex && iterationIndex < collection.endIndex
            override fun next(): String {
                val element = collection.elementAt(iterationIndex)
                iterationIndex = collection.indexAfter(iterationIndex)
                return element
            }
        }

        /**
         * Returns an iterator over the ranges of Unicode characters of the view's attributed string.
         */
        fun rangeIterator(): Iterator<SwiftRange<AttributedString.Index>> = CharacterRangeIterator(this, startIndex)

        private class CharacterRangeIterator constructor(
            private val collection: AttributedString.CharacterView,
            private var iterationIndex: AttributedString.Index
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
     * A view into the underlying storage of the attributed string, as Unicode scalars.
     */
    class UnicodeScalarView private constructor(swiftReference: Long): SwiftReference(swiftReference), Iterable<UInt> {
        /**
         * The position of the first Unicode scalar in a nonempty attributed string or substring.
         */
        val startIndex: AttributedString.Index
          get() = __jni_get_startIndex()
        @JvmName("__jni_get_startIndex")
        private external fun __jni_get_startIndex(): AttributedString.Index

        /**
         * The past-the-end position — the position one greater than the last valid subscript argument.
         */
        val endIndex: AttributedString.Index
          get() = __jni_get_endIndex()
        @JvmName("__jni_get_endIndex")
        private external fun __jni_get_endIndex(): AttributedString.Index

        /**
         * Obtains the index of the Unicode scalar before the scalar referenced by another index in the view's attributed string or substring.
         *
         * @param index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
         * @returns The index of the Unicode scalar before the one referenced by `index`.
         *          If `index` is `startIndex` an exception is thrown.
         *          If `index` is `endIndex`, the index to the last Unicode scalar in the view's attributed string or substring is returned.
         */
        fun indexBefore(
            /* before */ i: AttributedString.Index
        ): AttributedString.Index = __jni_indexBefore(i)
        @JvmName("__jni_indexBefore")
        private external fun __jni_indexBefore(
            i: AttributedString.Index
        ): AttributedString.Index

        /**
         * Obtains the index of the Unicode scalar after the scalar referenced by another index in the view's attributed string or substring.
         *
         * @param index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
         * @returns The index of the Unicode scalar before the one referenced by `index`.
         *          If `index` is `endIndex` an exception is thrown.
         *          If `index` is `startIndex`, the index to the first Unicode scalar in the view's attributed string or substring is returned.
         */
        fun indexAfter(
            /* after */ i: AttributedString.Index
        ): AttributedString.Index = __jni_indexAfter(i)
        @JvmName("__jni_indexAfter")
        private external fun __jni_indexAfter(
            i: AttributedString.Index
        ): AttributedString.Index

        /**
         * Obtains the Unicode scalar associated with an attributed string index.
         *
         * @param index The index of the desired Unicode scalar, between `startIndex` inclusive and `endIndex` exclusive.
         * @returns The Unicode scalar associated with `index`.
         *          If `index` is `endIndex`, an exception is thrown.
         *          If `index` is `startIndex`, the first Unicode scalar in the view's attributed string or substring is returned.
         */
        fun elementAt(
            /* at */ index: AttributedString.Index
        ): UInt = __jni_elementAt(index).toUInt()
        @JvmName("__jni_elementAt")
        private external fun __jni_elementAt(
            index: AttributedString.Index
        ): Int

        //---------------------//
        //                     //
        // Kotlin Conveniences //
        //                     //
        //---------------------//

        operator fun get(index: AttributedString.Index) = elementAt(index)

        override fun iterator(): Iterator<UInt> = UnicodeScalarIterator(this, startIndex)

        private class UnicodeScalarIterator constructor(
            private val collection: AttributedString.UnicodeScalarView,
            private var iterationIndex: AttributedString.Index
        ) : Iterator<UInt> {
            override fun hasNext(): Boolean = iterationIndex >= collection.startIndex && iterationIndex < collection.endIndex
            override fun next(): UInt {
                val element = collection.elementAt(iterationIndex)
                iterationIndex = collection.indexAfter(iterationIndex)
                return element
            }
        }

        /**
         * Returns an iterator over the ranges of Unicode scalars of the view's attributed string.
         */
        fun rangeIterator(): Iterator<SwiftRange<AttributedString.Index>> = UnicodeScalarRangeIterator(this, startIndex)

        private class UnicodeScalarRangeIterator constructor(
            private val collection: AttributedString.UnicodeScalarView,
            private var iterationIndex: AttributedString.Index
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
}
