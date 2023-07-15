export type Optional<T> = T | undefined;

/**
 * A half-open interval from a lower bound up to, but not including, an upper bound.
 *
 * @remarks
 * Represents the concept of a half-open range of values using rules identical to those used by Swift.
 * A Swift range requires that its lower bound be less-than-or-equal-to its upper bound.
 *
 * Because a half-open range does not include its upper bound, a half-open range whose lower bound
 * is equal to the upper bound represents an empty range.
 *
 * @param lowerBound - The lower value of the range, inclusive.
 * @param upperBound - The upper value of the range, exclusive.
 */
export type SwiftRange<T> = { lowerBound: T, upperBoundExclusive: T };

/**
 * An interval from a lower bound up to, and including, an upper bound.
 *
 * @remarks
 * Represents the concept of a range of values using rules identical to those used by Swift.
 * A Swift range requires that its lower bound be less-than-or-equal-to its upper bound.
 *
 * Because a closed range includes its upper bound, a closed range whose lower bound
 * is equal to the upper bound contains that value. Therefore, a SwiftClosedRange instance
 * cannot represent an empty range.
 *
 * @param lowerBound - The lower value of the range, inclusive.
 * @param upperBound - The upper value of the range, inclusive.
 */
export type SwiftClosedRange<T> = { lowerBound: T, upperBoundInclusive: T };

export declare namespace FishyJoesRuntime {
    /**
         * A type that provides a way to store attributes and their values outside of an attributed string.
         *
         * Use this type to initialize an instance of AttributedString with preset attributes,
         * and to set, merge, or replace attributes in existing attributed strings.
         *
         * Libraries that depend on `AttributeContainer` are free to define their own attributes to be associated with attributed strings.
         * As a result of this flexibility, the actual values of attributes can only be obtained using types defined in those libraries.
         *
         * The runtime itself defines one such type, `AttributeContainer.FoundationAttributes`.
         * To obtain the values of attributes from that type, such as the `link` attribute or `languageIdentifier` attribute,
         * one must construct an instance passing the container:
         *
         * `link = AttributeContainer.FoundationAttributes(someContainer).link`
         *
         * <!-- FishyJoes.exportReference(AttributeContainer) -->
         */
    export class AttributeContainer {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * Merges the attributes of another attribute container with those of this container.
         *
         * - Parameter other The other attribute container whose attributes should be merged into this container.
         * - Parameter keepCurrent For attributes in `other` that already have a value in this container,
         *     passing `true` retains the current value of the attribute,
         *     passing `false` replaces the value of the attribute with the one in `other`.
         *
         * <!-- FishyJoes.export(merge) -->
         */
        merge(
            other: FishyJoesRuntime.AttributeContainer,
            options?: {
                "keepCurrent"?: boolean /* defaults to `false` */,
            }
        ): void;

        /**
         * Creates an attribute container having no attribute values.
         * <!-- FishyJoes.export(createEmpty) -->
         */
        static createEmpty(
        ): FishyJoesRuntime.AttributeContainer;
    }
    export namespace AttributeContainer {
        /**
         * Attributes defined by the Swift Foundation library in ``AttributeScopes``, packaged as a static type.
         *
         * This type (and the ones like it defined in other libraries) allow features similar to those
         * offered by Swift dynamic member lookup in ``AttributeScope`` to be exported to other languages.
         *
         * An attribute container can be asked to fill in the fields defined by this structure using `AttributeContainerFoundationAttributes(AttributeContainer)`.
         * This type can be asked to fill in an attribute container using `AttributeContainer(FoundationAttributes)`.
         *
         * Combining these calls with `AttributedString.setAttributes(_:)` and `AttributedString.mergeAttributes(_:)` allows expansion
         * of attributed strings with new attributes in other languages analogously to how it is done in ``AttributeScopes`` using Swift dynamic member lookup.
         *
         * <!-- FishyJoes.exportReference(AttributeContainer.FoundationAttributes) -->
         */
        export class FoundationAttributes {
            private constructor()
            private _inhibitStructuralTyping: any

            /**
             * A link attribute.
             * <!-- FishyJoes.export(link) -->
             */
            link?: URL;

            /**
             * A language identifier attribute.
             * <!-- FishyJoes.export(languageIdentifier) -->
             */
            languageIdentifier?: string;

            /**
             * Obtains an attribute container which contains the attributes from this type.
             * <!-- FishyJoes.export(asContainer) -->
             */
            asContainer(): FishyJoesRuntime.AttributeContainer;

            /**
             * Creates a Foundation attribute container having no attribute values.
             * <!-- FishyJoes.export(createEmpty) -->
             */
            static createEmpty(
            ): FishyJoesRuntime.AttributeContainer.FoundationAttributes;

            /**
             * Extracts the Foundation attributes from an attribute container and makes them available as statically typed properties.
             * <!-- FishyJoes.export(createFromContainer) -->
             */
            static createFromContainer(
                container: AttributeContainer
            ): FishyJoesRuntime.AttributeContainer.FoundationAttributes;
        }
    }

    /**
     * A string with associated attributes for portions of its text.
     *
     * See `text` or `characters` for access to the text of an attributed string.
     * See `runs` for access to the attribute information associated with the attributed string's text.
     *
     * <!-- FishyJoes.exportReference(AttributedString) -->
     */
    export class AttributedString {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * Text represented by the attributed string.
         *
         * See `runs` for the attribute information associated with the attributed string's text.
         *
         * <!-- FishyJoes.export(string) -->
         */
        readonly string: string;

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
         *
         * <!-- FishyJoes.export(runs) -->
         */
        readonly runs: FishyJoesRuntime.AttributedString.Runs;

        /**
         * The characters of the attributed string, as a view into the underlying string.
         * <!-- FishyJoes.export(characters) -->
         */
        readonly characters: FishyJoesRuntime.AttributedString.CharacterView;

        /**
         * The Unicode scalars of the attributed string, as a view into the underlying string.
         * <!-- FishyJoes.export(unicodeScalars) -->
         */
        readonly unicodeScalars: FishyJoesRuntime.AttributedString.UnicodeScalarView;

        /**
         * An attributed substring representing the full content of the attributed string.
         * <!-- FishyJoes.export(substring) -->
         */
        readonly substring: FishyJoesRuntime.AttributedSubstring;

        /**
         * The position of the first character in a nonempty attributed string.
         *
         * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
         *
         * <!-- FishyJoes.export(startIndex) -->
         */
        readonly startIndex: FishyJoesRuntime.AttributedString.Index;

        /**
         * An attributed string’s past-the-end position — the position one greater than the last valid subscript argument.
         *
         * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
         *
         * <!-- FishyJoes.export(endIndex) -->
         */
        readonly endIndex: FishyJoesRuntime.AttributedString.Index;

        /**
         * Obtains an attributed substring representing part of the attributed string.
         *
         * - Parameter range The portion of the attributed string to be represented by the substring, bounded by `startIndex` and `endIndex`.
         *
         * <!-- FishyJoes.export(substringForRange) -->
         */
        substringForRange(
            /* for */ range: SwiftRange<AttributedString.Index>
        ): FishyJoesRuntime.AttributedSubstring;

        /**
         * Appends the text and any associated attributes of another attributed string to the end of this one.
         * - Parameter attributedString The attributed string containing the text and attributes to append.
         *
         * <!-- FishyJoes.export(append) -->
         */
        append(
            attributedString: FishyJoesRuntime.AttributedString
        ): void;

        /**
         * Appends the text and any associated attributes of the portion of an attributed string represented by a substring to the end of this one.
         * - Parameter subtring The substring containing the text and attributes to append.
         *
         * <!-- FishyJoes.export(appendSubstring) -->
         */
        appendSubstring(
            substring: FishyJoesRuntime.AttributedSubstring
        ): void;

        /**
         * Inserts the text and any associated attributes of another attributed string into this one at the specified position.
         *
         * - Parameter attributedString The attributed string containing the text and attributes to insert.
         * - Parameter index Position at which the content of `attributedString` should be inserted, bounded by `startIndex` and `endIndex`.
         *     If `index` is `startIndex` the content will be inserted before all content of this attributed string.
         *     If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `append()`.
         *
         * <!-- FishyJoes.export(insert) -->
         */
        insert(
            attributedString: FishyJoesRuntime.AttributedString,
            /* at */ index: FishyJoesRuntime.AttributedString.Index
        ): void;

        /**
         * Inserts the text and any associated attributes of a substring of an attributed string into this one at the specified position.
         *
         * - Parameter substring The substring of an attributed string containing the text and attributes to insert.
         * - Parameter index Position at which the content of `substring` should be inserted, bounded by `startIndex` and `endIndex`.
         *     If `index` is `startIndex` the content will be inserted before all content of this attributed string.
         *     If `index` is `endIndex` the content will be inserted after all content of this attributed string, similar to `appendSubstring()`.
         *
         * <!-- FishyJoes.export(insertSubstring) -->
         */
        insertSubstring(
            substring: FishyJoesRuntime.AttributedSubstring,
            /* at */ index: FishyJoesRuntime.AttributedString.Index
        ): void;

        /**
         * Replaces a portion of the text and associated attributes of the attributed string with content from another one.
         *
         * - Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
         * - Parameter attributedString The attributed string containing the text and attributes that replaces the content in `range`.
         *
         * <!-- FishyJoes.export(replaceSubrange) -->
         */
        replaceSubrange(
            range: SwiftRange<AttributedString.Index>,
            /* with */ attributedString: FishyJoesRuntime.AttributedString
        ): void;

        /**
         * Replaces a portion of the text and associated attributes of the attributed string with content from a substring of another one.
         *
         * - Parameter range The portion of the attributed string to be replaced, bounded by `startIndex` and `endIndex`.
         * - Parameter substring The substring of an attributed string containing the text and attributes that replaces the content in `range`.
         *
         * <!-- FishyJoes.export(replaceSubrangeWithSubstring) -->
         */
        replaceSubrangeWithSubstring(
            range: SwiftRange<AttributedString.Index>,
            /* with */ substring: FishyJoesRuntime.AttributedSubstring
        ): void;

        /**
         * Removes a portion of the text and associated attributes from the attributed string.
         *
         * - Parameter range The portion of the attributed string to remove, bounded by `startIndex` and `endIndex`.
         *
         * <!-- FishyJoes.export(removeSubrange) -->
         */
        removeSubrange(
            range: SwiftRange<AttributedString.Index>
        ): void;

        /**
         * Associates attributes with the content of the entire attributed string, replacing any existing attribute information.
         *
         * - Parameter attributes The attributes which will subsequently apply to all text in the attributed string.
         *
         * <!-- FishyJoes.export(setAttributes) -->
         */
        setAttributes(
            attributes: FishyJoesRuntime.AttributeContainer
        ): void;

        /**
         * Associates attributes with the content of a portion of the attributed string, replacing any existing attribute information.
         *
         * - Parameter range The portion of the attributed string whose attributes are to be replaced, bounded by `startIndex` and `endIndex`.
         * - Parameter attributes The attributes which will subsequently apply to the text in `range`.
         *
         * <!-- FishyJoes.export(setAttributesForRange) -->
         */
        setAttributesForRange(
            /* for */ range: SwiftRange<AttributedString.Index>,
            attributes: FishyJoesRuntime.AttributeContainer
        ): void;

        /**
         * Associates attributes with the content of the entire attributed string, merging with any existing attribute information.
         *
         * - Parameter attributes The attributes which will subsequently apply to all text in the attributed string.
         * - Parameter keepCurrent For attributes in `attributes` that already have a value in the attributed string,
         *     passing `true` retains the current value of the attribute,
         *     passing `false` replaces the value of the attribute with the one in `attributes`.
         *
         * <!-- FishyJoes.export(mergeAttributes) -->
         */
        mergeAttributes(
            attributes: FishyJoesRuntime.AttributeContainer,
            options?: {
                "keepCurrent"?: boolean /* defaults to `false` */,
            }
        ): void;

        /**
         * Associates attributes with the content of a portion of the attributed string, merging with any existing attribute information.
         *
         * - Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
         * - Parameter attributes The attributes which will subsequently apply to the text in `range`.
         * - Parameter keepCurrent For attributes in `attributes` that already have a value in `range` in the attributed string,
         *     passing `true` retains the current value of the attribute,
         *     passing `false` replaces the value of the attribute with the one in `attributes`.
         *
         * <!-- FishyJoes.export(mergeAttributesForRange) -->
         */
        mergeAttributesForRange(
            /* for */ range: SwiftRange<AttributedString.Index>,
            attributes: FishyJoesRuntime.AttributeContainer,
            options?: {
                "keepCurrent"?: boolean /* defaults to `false` */,
            }
        ): void;

        /**
         * Replaces occurrences of attributes in one attribute container with those in another attribute container.
         *
         * - Parameter attributes The existing attributes to replace.
         * - Parameter others The new attributes to apply.
         *
         * <!-- FishyJoes.export(replaceAttributes) -->
         */
        replaceAttributes(
            attributes: FishyJoesRuntime.AttributeContainer,
            /* with */ others: FishyJoesRuntime.AttributeContainer
        ): void;

        /**
         * Replaces occurrences of attributes in one attribute container with those in another attribute container.
         *
         * - Parameter range The portion of the attributed string whose attributes are to be modified, bounded by `startIndex` and `endIndex`.
         * - Parameter attributes The existing attributes to replace.
         * - Parameter others The new attributes to apply.
         *
         * <!-- FishyJoes.export(replaceAttributesForRange) -->
         */
        replaceAttributesForRange(
            /* for */ range: SwiftRange<AttributedString.Index>,
            attributes: FishyJoesRuntime.AttributeContainer,
            /* with */ others: FishyJoesRuntime.AttributeContainer
        ): void;

        /**
         * Creates an attributed string containing the empty string as its text with no associated attributes.
         * <!-- FishyJoes.export(createEmpty) -->
         */
        static createEmpty(
        ): FishyJoesRuntime.AttributedString;

        /**
         * Creates an attributed string containing a string as its text, all associated with the specified attributes.
         *
         * - Parameter string A string containing the text to serve as the content of the attributed string.
         * - Parameter attributes Attributes to associate with the full range of the attributed string.
         *
         * <!-- FishyJoes.export(create) -->
         */
        static create(
            string: string,
            options?: {
                "attributes"?: Optional<FishyJoesRuntime.AttributeContainer> /* defaults to `nil` */,
            }
        ): FishyJoesRuntime.AttributedString;

        /**
         * Creates an attributed string drawing its the text and attributes from a substring of another attributed string.
         *
         * - Parameter substring A substring of another attributed string whose content is used for the created attributed string.
         *
         * <!-- FishyJoes.export(createFromSubstring) -->
         */
        static createFromSubstring(
            substring: FishyJoesRuntime.AttributedSubstring
        ): FishyJoesRuntime.AttributedString;
    }
    export namespace AttributedString {
        /**
         * A view into the underlying storage of an attributed string or substring, as Unicode characters.
         * <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
         */
        export class CharacterView {
            private constructor()
            private _inhibitStructuralTyping: any

            /**
             * The position of the first character in a nonempty attributed string or substring.
             * <!-- FishyJoes.export(startIndex) -->
             */
            readonly startIndex: FishyJoesRuntime.AttributedString.Index;

            /**
             * The past-the-end position — the position one greater than the last valid subscript argument.
             * <!-- FishyJoes.export(endIndex) -->
             */
            readonly endIndex: FishyJoesRuntime.AttributedString.Index;

            /**
             * Obtains the index of the character before the character referenced by another index in the view's attributed string or substring.
             *
             * - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
             * - Returns The index of the character before the one referenced by `index`.
             *     If `index` is `startIndex` an exception is thrown.
             *     If `index` is `endIndex`, the index to the last character in the view's attributed string or substring is returned.
             *
             * <!-- FishyJoes.export(indexBefore) -->
             */
            indexBefore(
                /* before */ i: FishyJoesRuntime.AttributedString.Index
            ): FishyJoesRuntime.AttributedString.Index;

            /**
             * Obtains the index of the character after the character referenced by another index in the view's attributed string or substring.
             *
             * - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
             * - Returns The index of the character before the one referenced by `index`.
             *     If `index` is `endIndex` an exception is thrown.
             *     If `index` is `startIndex`, the index to the first character in the view's attributed string or substring is returned.
             *
             * <!-- FishyJoes.export(indexAfter) -->
             */
            indexAfter(
                /* after */ i: FishyJoesRuntime.AttributedString.Index
            ): FishyJoesRuntime.AttributedString.Index;

            /**
             * Obtains the character associated with an attributed string index.
             *
             * - Parameter index The index of the desired character, between `startIndex` inclusive and `endIndex` exclusive.
             * - Returns The character associated with `index`.
             *     If `index` is `endIndex`, an exception is thrown.
             *     If `index` is `startIndex`, the first character in the view's attributed string or substring is returned.
             *
             * <!-- FishyJoes.export(elementAt) -->
             */
            elementAt(
                /* at */ index: FishyJoesRuntime.AttributedString.Index
            ): string;
        }

        /**
         * A type that represents the position of a character or code unit within an attributed string.
         * <!-- FishyJoes.exportReference(AttributedString.Index) -->
         */
        export class Index {
            private constructor()
            private _inhibitStructuralTyping: any
        }

        /**
         * An iterable view into segments of the attributed string or substring, each of which indicates where a run of identical attributes begins or ends.
         * <!-- FishyJoes.exportReference(AttributedString.Runs) -->
         */
        export class Runs {
            private constructor()
            private _inhibitStructuralTyping: any

            /**
             * The position of the first run in a nonempty attributed string or substring.
             * <!-- FishyJoes.export(startIndex) -->
             */
            readonly startIndex: FishyJoesRuntime.AttributedString.Runs.Index;

            /**
             * The past-the-end position — the position one greater than the last valid subscript argument.
             * <!-- FishyJoes.export(endIndex) -->
             */
            readonly endIndex: FishyJoesRuntime.AttributedString.Runs.Index;

            /**
             * Obtains the run index before another index.
             *
             * - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
             * - Returns The index of the run before `index`.
             *     If `index` is `startIndex` an exception is thrown.
             *     If `index` is `endIndex`, the last valid index is returned.
             *
             * <!-- FishyJoes.export(indexBefore) -->
             */
            indexBefore(
                /* before */ i: FishyJoesRuntime.AttributedString.Runs.Index
            ): FishyJoesRuntime.AttributedString.Runs.Index;

            /**
             * Obtains the run index after another index.
             *
             * - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
             * - Returns The index of the run after `index`.
             *     If `index` is `endIndex`, an exception is thrown.
             *     If `index` is `startIndex`, the first valid index is returned.
             *
             * <!-- FishyJoes.export(indexAfter) -->
             */
            indexAfter(
                /* after */ i: FishyJoesRuntime.AttributedString.Runs.Index
            ): FishyJoesRuntime.AttributedString.Runs.Index;

            /**
             * Obtains the run descriptor at a run index.
             *
             * - Parameter index The index of the desired run, between `startIndex` inclusive and `endIndex` exclusive.
             * - Returns The descriptor for the run at `index`.
             *      If `index` is `endIndex`, an exception is thrown.
             *      If `index` is `startIndex`, the first valid run descriptor is returned.
             *
             * <!-- FishyJoes.export(elementAt) -->
             */
            elementAt(
                /* at */ index: FishyJoesRuntime.AttributedString.Runs.Index
            ): FishyJoesRuntime.AttributedString.Runs.Run;

            /**
             * Obtains the run descriptor associated with an attributed string index.
             *
             * - Parameter index The index of the desired position in the attributed string or substring that this object is a view for,
             *              between its `startIndex` inclusive and `endIndex` exclusive.
             * - Returns The descriptor for the run whose `range` contains `index`.
             *     If `index` is `endIndex` of the view's attributed string or substring, an exception is thrown.
             *     If `index` is `startIndex` of the view's attributed string or substring, the first valid run descriptor is returned.
             *
             * <!-- FishyJoes.export(elementAtPosition) -->
             */
            elementAtPosition(
                /* at */ index: FishyJoesRuntime.AttributedString.Index
            ): FishyJoesRuntime.AttributedString.Runs.Run;
        }
        export namespace Runs {
            /**
             * A type that represents the position of a descriptor for a run within an attributed string's view of runs.
             * <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
             */
            export class Index {
                private constructor()
                private _inhibitStructuralTyping: any
            }

            /**
             * Description of a run of attributes within an attributed string or substring.
             * <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
             */
            export class Run {
                private constructor()
                private _inhibitStructuralTyping: any

                /**
                 * The range of the portion of the attributed string that this run description represents.
                 * <!-- FishyJoes.export(range) -->
                 */
                readonly range: SwiftRange<AttributedString.Index>;

                /**
                 * The attributes associated with of the portion of the attributed string that this run description represents.
                 * <!-- FishyJoes.export(attributes) -->
                 */
                readonly attributes: FishyJoesRuntime.AttributeContainer;
            }
        }

        /**
         * A view into the underlying storage of the attributed string, as Unicode scalars.
         * <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
         */
        export class UnicodeScalarView {
            private constructor()
            private _inhibitStructuralTyping: any

            /**
             * The position of the first Unicode scalar in a nonempty attributed string or substring.
             * <!-- FishyJoes.export(startIndex) -->
             */
            readonly startIndex: FishyJoesRuntime.AttributedString.Index;

            /**
             * The past-the-end position — the position one greater than the last valid subscript argument.
             * <!-- FishyJoes.export(endIndex) -->
             */
            readonly endIndex: FishyJoesRuntime.AttributedString.Index;

            /**
             * Obtains the index of the Unicode scalar before the scalar referenced by another index in the view's attributed string or substring.
             *
             * - Parameter index The index serving as the starting position, between `startIndex` exclusive and `endIndex` inclusive.
             * - Returns The index of the Unicode scalar before the one referenced by `index`.
             *     If `index` is `startIndex` an exception is thrown.
             *     If `index` is `endIndex`, the index to the last Unicode scalar in the view's attributed string or substring is returned.
             *
             * <!-- FishyJoes.export(indexBefore) -->
             */
            indexBefore(
                /* before */ i: FishyJoesRuntime.AttributedString.Index
            ): FishyJoesRuntime.AttributedString.Index;

            /**
             * Obtains the index of the Unicode scalar after the scalar referenced by another index in the view's attributed string or substring.
             *
             * - Parameter index The index serving as the starting position, between `startIndex` inclusive and `endIndex` exclusive.
             * - Returns The index of the Unicode scalar before the one referenced by `index`.
             *     If `index` is `endIndex` an exception is thrown.
             *     If `index` is `startIndex`, the index to the first Unicode scalar in the view's attributed string or substring is returned.
             *
             * <!-- FishyJoes.export(indexAfter) -->
             */
            indexAfter(
                /* after */ i: FishyJoesRuntime.AttributedString.Index
            ): FishyJoesRuntime.AttributedString.Index;

            /**
             * Obtains the Unicode scalar associated with an attributed string index.
             *
             * - Parameter index The index of the desired Unicode scalar, between `startIndex` inclusive and `endIndex` exclusive.
             * - Returns The Unicode scalar associated with `index`.
             *     If `index` is `endIndex`, an exception is thrown.
             *     If `index` is `startIndex`, the first Unicode scalar in the view's attributed string or substring is returned.
             *
             * <!-- FishyJoes.export(elementAt) -->
             */
            elementAt(
                /* at */ index: FishyJoesRuntime.AttributedString.Index
            ): number;
        }
    }

    export type AttributedStrings = never;
    export namespace AttributedStrings {
        /**
         * <!-- FishyJoes.export(accent) -->
         */
        const accent: AttributedString;

        /**
         * <!-- FishyJoes.export(chinese) -->
         */
        const chinese: AttributedString;

        /**
         * <!-- FishyJoes.export(chineseBMP) -->
         */
        const chineseBMP: AttributedString;

        /**
         * <!-- FishyJoes.export(chineseSIP) -->
         */
        const chineseSIP: AttributedString;

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        function echo(
            string: AttributedString
        ): AttributedString;

        /**
         * <!-- FishyJoes.export(emoji) -->
         */
        const emoji: AttributedString;

        /**
         * <!-- FishyJoes.export(emojiMulti) -->
         */
        const emojiMulti: AttributedString;

        /**
         * <!-- FishyJoes.export(polyglot) -->
         */
        const polyglot: AttributedString;

        /**
         * <!-- FishyJoes.export(script) -->
         */
        const script: AttributedString;

        /**
         * <!-- FishyJoes.export(simple) -->
         */
        const simple: AttributedString;
    }

    /**
     * A type that represents a portion of an attributed string.
     *
     * The attributed string for which the type represents a sub-portion can be accessed in the `base` property.
     * The indices offered in `startIndex` and `endIndex` are in the same index space as those in `base`,
     * so they can be used to find what part of `base` the substring represents.
     *
     * <!-- FishyJoes.exportReference(AttributedSubstring) -->
     */
    export class AttributedSubstring {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * The attributed string that this substring references.
         *
         * The `startIndex` and `endIndex` of this substring are comparable to `base.startIndex` and `base.endIndex` and are guaranteed to be bounded by them.
         * As such, the portion of the base string represented by the substring is the range from `startIndex` inclusive to `endIndex` exclusive.
         *
         * <!-- FishyJoes.export(base) -->
         */
        readonly base: FishyJoesRuntime.AttributedString;

        /**
         * Text represented by the attributed substring.
         *
         * See `runs` for the attribute information associated with the attributed substring's text.
         *
         * <!-- FishyJoes.export(string) -->
         */
        readonly string: string;

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
         *
         * <!-- FishyJoes.export(runs) -->
         */
        readonly runs: FishyJoesRuntime.AttributedString.Runs;

        /**
         * The characters of the attributed substring, as a view into the underlying string.
         * <!-- FishyJoes.export(characters) -->
         */
        readonly characters: FishyJoesRuntime.AttributedString.CharacterView;

        /**
         * The Unicode scalars of the attributed substring, as a view into the underlying string.
         * <!-- FishyJoes.export(unicodeScalars) -->
         */
        readonly unicodeScalars: FishyJoesRuntime.AttributedString.UnicodeScalarView;

        /**
         * The position of the first character in a nonempty attributed substring.
         *
         * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
         *
         * <!-- FishyJoes.export(startIndex) -->
         */
        readonly startIndex: FishyJoesRuntime.AttributedString.Index;

        /**
         * An attributed substring’s past-the-end position — the position one greater than the last valid subscript argument.
         *
         * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
         *
         * <!-- FishyJoes.export(endIndex) -->
         */
        readonly endIndex: FishyJoesRuntime.AttributedString.Index;

        /**
         * An attributed substring representing the full content of the attributed substring.
         * <!-- FishyJoes.export(substring) -->
         */
        readonly substring: FishyJoesRuntime.AttributedSubstring;

        /**
         * Obtains an attributed substring representing part of the attributed substring.
         *
         * - Parameter range The portion of the attributed substring to be represented by the substring, bounded by `startIndex` and `endIndex`.
         * - Returns A substring of `base` over `range`.
         *
         * <!-- FishyJoes.export(substringForRange) -->
         */
        substringForRange(
            /* for */ range: SwiftRange<AttributedString.Index>
        ): FishyJoesRuntime.AttributedSubstring;

        /**
         * Creates an attributed substring with an empty base attributed string.
         * <!-- FishyJoes.export(createEmpty) -->
         */
        static createEmpty(
        ): FishyJoesRuntime.AttributedSubstring;
    }
}

export declare function init(): Promise<{
    FishyJoesRuntime: typeof FishyJoesRuntime,
}>;
export default FishyJoesRuntime;
