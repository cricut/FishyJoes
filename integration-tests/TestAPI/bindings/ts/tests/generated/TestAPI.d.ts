export type Optional<T> = T | undefined;
export declare namespace Runtime {
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
            other: AttributeContainer,
            options?: {
                "keepCurrent"?: boolean /* defaults to `false` */,
            }
        ): void;
        equals(
            other: AttributeContainer
        ): boolean;
        hashCode(
        ): number;
        /**
         * Creates an attribute container having no attribute values.
         * <!-- FishyJoes.export(createEmpty) -->
         */
        static createEmpty(
        ): AttributeContainer;
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
            equals(
                other: AttributeContainer.FoundationAttributes
            ): boolean;
    
            hashCode(
            ): number;
            /**
             * Creates a Foundation attribute container having no attribute values.
             * <!-- FishyJoes.export(createEmpty) -->
             */
            static createEmpty(
            ): AttributeContainer.FoundationAttributes;
            /**
             * Extracts the Foundation attributes from an attribute container and makes them available as statically typed properties.
             * <!-- FishyJoes.export(createFromContainer) -->
             */
            static createFromContainer(
                container: AttributeContainer
            ): AttributeContainer.FoundationAttributes;
            /**
             * Obtains an attribute container which contains the attributes from this type.
             * <!-- FishyJoes.export(asContainer) -->
             */
            asContainer(): AttributeContainer;
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
        readonly runs: AttributedString.Runs;
        /**
         * The characters of the attributed string, as a view into the underlying string.
         * <!-- FishyJoes.export(characters) -->
         */
        readonly characters: AttributedString.CharacterView;
        /**
         * The Unicode scalars of the attributed string, as a view into the underlying string.
         * <!-- FishyJoes.export(unicodeScalars) -->
         */
        readonly unicodeScalars: AttributedString.UnicodeScalarView;
        /**
         * An attributed substring representing the full content of the attributed string.
         * <!-- FishyJoes.export(substring) -->
         */
        readonly substring: AttributedSubstring;
        /**
         * The position of the first character in a nonempty attributed string.
         *
         * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
         *
         * <!-- FishyJoes.export(startIndex) -->
         */
        readonly startIndex: AttributedString.Index;
        /**
         * An attributed string’s past-the-end position — the position one greater than the last valid subscript argument.
         *
         * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed string.
         *
         * <!-- FishyJoes.export(endIndex) -->
         */
        readonly endIndex: AttributedString.Index;
        /**
         * Obtains an attributed substring representing part of the attributed string.
         *
         * - Parameter range The portion of the attributed string to be represented by the substring, bounded by `startIndex` and `endIndex`.
         *
         * <!-- FishyJoes.export(substringForRange) -->
         */
        substringForRange(
            /* for */ range: SwiftRange<AttributedString.Index>
        ): AttributedSubstring;
        /**
         * Appends the text and any associated attributes of another attributed string to the end of this one.
         * - Parameter attributedString The attributed string containing the text and attributes to append.
         *
         * <!-- FishyJoes.export(append) -->
         */
        append(
            attributedString: AttributedString
        ): void;
        /**
         * Appends the text and any associated attributes of the portion of an attributed string represented by a substring to the end of this one.
         * - Parameter subtring The substring containing the text and attributes to append.
         *
         * <!-- FishyJoes.export(appendSubstring) -->
         */
        appendSubstring(
            substring: AttributedSubstring
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
            attributedString: AttributedString,
            /* at */ index: AttributedString.Index
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
            substring: AttributedSubstring,
            /* at */ index: AttributedString.Index
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
            /* with */ attributedString: AttributedString
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
            /* with */ substring: AttributedSubstring
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
            attributes: AttributeContainer
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
            attributes: AttributeContainer
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
            attributes: AttributeContainer,
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
            attributes: AttributeContainer,
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
            attributes: AttributeContainer,
            /* with */ others: AttributeContainer
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
            attributes: AttributeContainer,
            /* with */ others: AttributeContainer
        ): void;
        equals(
            other: AttributedString
        ): boolean;
        hashCode(
        ): number;
        /**
         * Creates an attributed string containing the empty string as its text with no associated attributes.
         * <!-- FishyJoes.export(createEmpty) -->
         */
        static createEmpty(
        ): AttributedString;
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
                "attributes"?: Optional<AttributeContainer> /* defaults to `nil` */,
            }
        ): AttributedString;
        /**
         * Creates an attributed string drawing its the text and attributes from a substring of another attributed string.
         *
         * - Parameter substring A substring of another attributed string whose content is used for the created attributed string.
         *
         * <!-- FishyJoes.export(createFromSubstring) -->
         */
        static createFromSubstring(
            substring: AttributedSubstring
        ): AttributedString;
    }
    export namespace AttributedString {
        /**
         * A type that represents the position of a character or code unit within an attributed string.
         * <!-- FishyJoes.exportReference(AttributedString.Index) -->
         */
        export class Index {
            private constructor()
            private _inhibitStructuralTyping: any
            equals(
                other: AttributedString.Index
            ): boolean;
    
            hashCode(
            ): number;
            compare(
                other: AttributedString.Index
            ): number;
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
            readonly startIndex: AttributedString.Runs.Index;
            /**
             * The past-the-end position — the position one greater than the last valid subscript argument.
             * <!-- FishyJoes.export(endIndex) -->
             */
            readonly endIndex: AttributedString.Runs.Index;
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
                /* before */ i: AttributedString.Runs.Index
            ): AttributedString.Runs.Index;
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
                /* after */ i: AttributedString.Runs.Index
            ): AttributedString.Runs.Index;
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
                /* at */ index: AttributedString.Runs.Index
            ): AttributedString.Runs.Run;
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
                /* at */ index: AttributedString.Index
            ): AttributedString.Runs.Run;
            equals(
                other: AttributedString.Runs
            ): boolean;
    
            hashCode(
            ): number;
            forEach(
                body: (run: Runs.Run) => any
            ): any;
            
            [Symbol.iterator](
            ): RunIterator;
        }
        export namespace Runs {
            /**
             * A type that represents the position of a descriptor for a run within an attributed string's view of runs.
             * <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
             */
            export class Index {
                private constructor()
                private _inhibitStructuralTyping: any
                equals(
                    other: AttributedString.Runs.Index
                ): boolean;
        
                hashCode(
                ): number;
    
                compare(
                    other: AttributedString.Runs.Index
                ): number;
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
                readonly attributes: AttributeContainer;
                equals(
                    other: AttributedString.Runs.Run
                ): boolean;
        
                hashCode(
                ): number;    
            }
        }
        export class RunIterator implements Iterator<Runtime.AttributedString.Runs.Run> {
            private constructor()
            private _inhibitStructuralTyping: any
            next(
            ): IteratorResult<Runtime.AttributedString.Runs.Run>;
        }
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
            readonly startIndex: AttributedString.Index;
            /**
             * The past-the-end position — the position one greater than the last valid subscript argument.
             * <!-- FishyJoes.export(endIndex) -->
             */
            readonly endIndex: AttributedString.Index;
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
                /* before */ i: AttributedString.Index
            ): AttributedString.Index;
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
                /* after */ i: AttributedString.Index
            ): AttributedString.Index;
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
                /* at */ index: AttributedString.Index
            ): string;
            forEach(
                body: (character: string) => any
            ): any;
            [Symbol.iterator](): CharacterIterator;
        }
        export class CharacterIterator implements Iterator<string> {
            private constructor()
            private _inhibitStructuralTyping: any
            next(
            ): IteratorResult<string>;
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
            readonly startIndex: AttributedString.Index;
            /**
             * The past-the-end position — the position one greater than the last valid subscript argument.
             * <!-- FishyJoes.export(endIndex) -->
             */
            readonly endIndex: AttributedString.Index;
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
                /* before */ i: AttributedString.Index
            ): AttributedString.Index;
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
                /* after */ i: AttributedString.Index
            ): AttributedString.Index;
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
                /* at */ index: AttributedString.Index
            ): number;
            forEach(
                body: (scalar: number) => any
            ): any;
            [Symbol.iterator](): UnicodeScalarIterator;
        }
        export class UnicodeScalarIterator implements Iterator<number> {
            private constructor()
            private _inhibitStructuralTyping: any
            next(
            ): IteratorResult<number>;
        }
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
        readonly base: AttributedString;
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
        readonly runs: AttributedString.Runs;
        /**
         * The characters of the attributed substring, as a view into the underlying string.
         * <!-- FishyJoes.export(characters) -->
         */
        readonly characters: AttributedString.CharacterView;
        /**
         * The Unicode scalars of the attributed substring, as a view into the underlying string.
         * <!-- FishyJoes.export(unicodeScalars) -->
         */
        readonly unicodeScalars: AttributedString.UnicodeScalarView;
        /**
         * The position of the first character in a nonempty attributed substring.
         *
         * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
         *
         * <!-- FishyJoes.export(startIndex) -->
         */
        readonly startIndex: AttributedString.Index;
        /**
         * An attributed substring’s past-the-end position — the position one greater than the last valid subscript argument.
         *
         * See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
         *
         * <!-- FishyJoes.export(endIndex) -->
         */
        readonly endIndex: AttributedString.Index;
        /**
         * An attributed substring representing the full content of the attributed substring.
         * <!-- FishyJoes.export(substring) -->
         */
        readonly substring: AttributedSubstring;
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
        ): AttributedSubstring;
        equals(
            other: AttributedSubstring
        ): boolean;
        hashCode(
        ): number;
        /**
         * Creates an attributed substring with an empty base attributed string.
         * <!-- FishyJoes.export(createEmpty) -->
         */
        static createEmpty(
        ): AttributedSubstring;
    }
}

export namespace Runtime {
    export namespace AttributeContainer {
        export namespace FoundationAttributes {
            export function create(attributes: { languageIdentifier?: String, link?: URL }): FoundationAttributes;
        }
    }
    export namespace AttributedString {
        export function createJoining(attributedStrings: AttributedString[]): AttributedString;
        export function createJoiningSubstrings(attributedStrings: AttributedSubstring[]): AttributedString;
    }
}


export declare namespace TestAPI {
    /**
     * <!-- FishyJoes.export(AProtocol) -->
     */
    interface AProtocol {
        /**
         * <!-- FishyJoes.export(baz) -->
         */
        readonly baz: boolean;
        /**
         * <!-- FishyJoes.export(foo) -->
         */
        readonly foo: string;
        /**
         * <!-- FishyJoes.export(bar) -->
         */
        bar(
            x: number,
            y: number
        ): TestAPI.AProtocol;
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation) -->
         */
        hasADefaultImplementation(
            x: number,
            y: number
        ): string;
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation2) -->
         */
        hasADefaultImplementation2(
            a: string,
            b: boolean,
            c: string
        ): string;
    }
    interface AProtocolCore {
        /**
         * <!-- FishyJoes.export(baz) -->
         */
        readonly baz: boolean;
        /**
         * <!-- FishyJoes.export(foo) -->
         */
        readonly foo: string;
        /**
         * <!-- FishyJoes.export(bar) -->
         */
        bar(
            this: AProtocol,
            x: number,
            y: number
        ): TestAPI.AProtocol;
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation) -->
         */
        hasADefaultImplementation?(
            this: AProtocol,
            x: number,
            y: number
        ): string;
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation2) -->
         */
        hasADefaultImplementation2?(
            this: AProtocol,
            a: string,
            b: boolean,
            c: string
        ): string;
    }
    namespace AProtocol {
        function fromCore(core: AProtocolCore): AProtocol
    }
    /**
     * <!-- FishyJoes.export(AProtocolImplementation, conformances: [AProtocol]) -->
     */
    export class AProtocolImplementation implements AProtocol {
        constructor(foo: string, baz: boolean)
        foo: string;
        baz: boolean;
        /**
         * <!-- FishyJoes.export(bar) -->
         */
        bar(
            x: number,
            y: number
        ): TestAPI.AProtocol;
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation) -->
         */
        hasADefaultImplementation(
            x: number,
            y: number
        ): string;
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation2) -->
         */
        hasADefaultImplementation2(
            a: string,
            b: boolean,
            c: string
        ): string;
    }
    export type Actors = never;
    export namespace Actors {
        /**
         * <!-- FishyJoes.export(Actors.TemperatureLogger) -->
         */
        export class TemperatureLogger {
            private constructor()
            private _inhibitStructuralTyping: any
            /**
             * <!-- FishyJoes.export(label) -->
             */
            readonly label: string;
            /**
             * <!-- FishyJoes.export(backwardsLabel) -->
             */
            readonly backwardsLabel: string;
            /**
             * <!-- FishyJoes.export(extensionNonisolatedVarLabel) -->
             */
            readonly extensionNonisolatedVarLabel: string;
            /**
             * <!-- FishyJoes.export(create) -->
             */
            static create(
                label: string,
                measurement: number
            ): TestAPI.Actors.TemperatureLogger;
            /**
             * <!-- FishyJoes.export(update) -->
             */
            update(
                /* with */ measurement: number
            ): Promise<void>;
            /**
             * <!-- FishyJoes.export(min) -->
             */
            min(
            ): Promise<number>;
            /**
             * <!-- FishyJoes.export(extensionIsolatedGetLabel) -->
             */
            extensionIsolatedGetLabel(
            ): Promise<string>;
            /**
             * <!-- FishyJoes.export(extensionNonisolatedGetLabel) -->
             */
            extensionNonisolatedGetLabel(
            ): string;
        }
    }
    export type AssociatedDataEnum = AssociatedDataEnum.Thing | AssociatedDataEnum.Other | AssociatedDataEnum.Bar | AssociatedDataEnum.NoValue | AssociatedDataEnum.SimpleEnum;
    export namespace AssociatedDataEnum {
        interface Bar extends AssociatedDataEnum_Common {}
        export class Bar {
            constructor(named: string, _1: TestAPI.AssociatedDataEnum)
            readonly named: string;
            readonly _1: TestAPI.AssociatedDataEnum;
        }
        interface NoValue extends AssociatedDataEnum_Common {}
        export class NoValue {
            constructor()
        }
        interface Other extends AssociatedDataEnum_Common {}
        export class Other {
            constructor(unnamed: string, _1: number)
            readonly unnamed: string;
            readonly _1: number;
        }
        interface SimpleEnum extends AssociatedDataEnum_Common {}
        export class SimpleEnum {
            constructor(value: TestAPI.SimpleEnum)
            readonly value: TestAPI.SimpleEnum;
        }
        interface Thing extends AssociatedDataEnum_Common {}
        export class Thing {
            constructor(value: number)
            readonly value: number;
        }
        /**
         * <!-- FishyJoes.export(staticThing) -->
         */
        const staticThing: TestAPI.AssociatedDataEnum;
    }
    interface AssociatedDataEnum_Common {
        /**
         * <!-- FishyJoes.export(intValue) -->
         */
        readonly intValue: number;
        /**
         * <!-- FishyJoes.export(plus) -->
         */
        plus(
            other: TestAPI.AssociatedDataEnum
        ): TestAPI.AssociatedDataEnum;
    }
    export type AsyncFunctions = never;
    export namespace AsyncFunctions {
        /**
         * <!-- FishyJoes.export(abs) -->
         */
        const abs: (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        const add3Things: (_0: number, _1: number, _2: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(const42) -->
         */
        const const42: () => Promise<number>;
        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        function exercise0(
            fn: () => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        function exercise1(
            fn: (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        function exercise2(
            fn: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        function exercise3(
            fn: (_0: number, _1: number, _2: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        function exercise4(
            fn: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        function exercise5(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        function exercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        const fifthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>;
        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        const intCompose: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        const makeList: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>;
        /**
         * <!-- FishyJoes.export(sixthThing) -->
         */
        const sixthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(thunkTwiceMaker) -->
         */
        function thunkTwiceMaker(
            thunk: () => Promise<void>
        ): () => Promise<void>;
        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        const willThrow: () => Promise<number>;
    }
    /**
     * <!-- FishyJoes.export(AttributedString_PuttingTypesIntoQuestionablePlaces) -->
     */
    export class AttributedString_PuttingTypesIntoQuestionablePlaces {
        constructor(x: string)
        readonly x: string;
        /**
         * <!-- FishyJoes.export(testCall) -->
         */
        testCall(
        ): number;
    }
    export type AttributedStrings = never;
    export namespace AttributedStrings {
        /**
         * <!-- FishyJoes.export(accent) -->
         */
        const accent: Runtime.AttributedString;
        /**
         * <!-- FishyJoes.export(attributedCharacters) -->
         */
        function attributedCharacters(
            /* of */ string: Runtime.AttributedString
        ): Runtime.AttributedSubstring[];
        /**
         * <!-- FishyJoes.export(attributesPreferringDuplicatesNearerStart) -->
         */
        function attributesPreferringDuplicatesNearerStart(
            /* of */ string: Runtime.AttributedString
        ): Runtime.AttributeContainer;
        /**
         * <!-- FishyJoes.export(chinese) -->
         */
        const chinese: Runtime.AttributedString;
        /**
         * <!-- FishyJoes.export(chineseBMP) -->
         */
        const chineseBMP: Runtime.AttributedString;
        /**
         * <!-- FishyJoes.export(chineseSIP) -->
         */
        const chineseSIP: Runtime.AttributedString;
        /**
         * <!-- FishyJoes.export(echo) -->
         */
        function echo(
            string: Runtime.AttributedString
        ): Runtime.AttributedString;
        /**
         * <!-- FishyJoes.export(emoji) -->
         */
        const emoji: Runtime.AttributedString;
        /**
         * <!-- FishyJoes.export(emojiMulti) -->
         */
        const emojiMulti: Runtime.AttributedString;
        /**
         * <!-- FishyJoes.export(emptyAttributeRuns) -->
         */
        function emptyAttributeRuns(
            /* of */ string: Runtime.AttributedString
        ): Runtime.AttributedString.Runs.Run[];
        /**
         * <!-- FishyJoes.export(firstIndex) -->
         */
        function firstIndex(
            /* of */ string: Runtime.AttributedString
        ): Runtime.AttributedString.Index;
        /**
         * <!-- FishyJoes.export(fullRange) -->
         */
        function fullRange(
            /* of */ string: Runtime.AttributedString
        ): Runtime.SwiftRange<Runtime.AttributedString.Index>;
        /**
         * <!-- FishyJoes.export(lastIndex) -->
         */
        function lastIndex(
            /* of */ string: Runtime.AttributedString
        ): Runtime.AttributedString.Index;
        /**
         * <!-- FishyJoes.export(polyglot) -->
         */
        const polyglot: Runtime.AttributedString;
        /**
         * <!-- FishyJoes.export(script) -->
         */
        const script: Runtime.AttributedString;
        /**
         * <!-- FishyJoes.export(simple) -->
         */
        const simple: Runtime.AttributedString;
    }
    export type Bytes = never;
    export namespace Bytes {
        /**
         * <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
         */
        const bytes: number[];
        /**
         * <!-- FishyJoes.export(data) -->
         */
        const data: ArrayBuffer;
        /**
         * <!-- FishyJoes.export(echoBytes) -->
         */
        function echoBytes(
            bytes: number[]
        ): number[];
        /**
         * <!-- FishyJoes.export(echoData) -->
         */
        function echoData(
            data: ArrayBuffer
        ): ArrayBuffer;
    }
    export type ClosedRanges = never;
    export namespace ClosedRanges {
        /**
         * <!-- FishyJoes.export(doubleRange) -->
         */
        const doubleRange: Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoDoubleRange) -->
         */
        function echoDoubleRange(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoFloatRange) -->
         */
        function echoFloatRange(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoInt16Range) -->
         */
        function echoInt16Range(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoInt32Range) -->
         */
        function echoInt32Range(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoInt64Range) -->
         */
        function echoInt64Range(
            range: Runtime.SwiftClosedRange<bigint>
        ): Runtime.SwiftClosedRange<bigint>;
        /**
         * <!-- FishyJoes.export(echoInt8Range) -->
         */
        function echoInt8Range(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoIntRange) -->
         */
        function echoIntRange(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoStringRange) -->
         */
        function echoStringRange(
            range: Runtime.SwiftClosedRange<string>
        ): Runtime.SwiftClosedRange<string>;
        /**
         * <!-- FishyJoes.export(echoUInt16Range) -->
         */
        function echoUInt16Range(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoUInt32Range) -->
         */
        function echoUInt32Range(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoUInt64Range) -->
         */
        function echoUInt64Range(
            range: Runtime.SwiftClosedRange<bigint>
        ): Runtime.SwiftClosedRange<bigint>;
        /**
         * <!-- FishyJoes.export(echoUInt8Range) -->
         */
        function echoUInt8Range(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(echoUIntRange) -->
         */
        function echoUIntRange(
            range: Runtime.SwiftClosedRange<number>
        ): Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(floatRange) -->
         */
        const floatRange: Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(int16Range) -->
         */
        const int16Range: Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(int32Range) -->
         */
        const int32Range: Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(int64Range) -->
         */
        const int64Range: Runtime.SwiftClosedRange<bigint>;
        /**
         * <!-- FishyJoes.export(int8Range) -->
         */
        const int8Range: Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(intRange) -->
         */
        const intRange: Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(stringRange) -->
         */
        const stringRange: Runtime.SwiftClosedRange<string>;
        /**
         * <!-- FishyJoes.export(uInt16Range) -->
         */
        const uInt16Range: Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(uInt32Range) -->
         */
        const uInt32Range: Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(uInt64Range) -->
         */
        const uInt64Range: Runtime.SwiftClosedRange<bigint>;
        /**
         * <!-- FishyJoes.export(uInt8Range) -->
         */
        const uInt8Range: Runtime.SwiftClosedRange<number>;
        /**
         * <!-- FishyJoes.export(uIntRange) -->
         */
        const uIntRange: Runtime.SwiftClosedRange<number>;
    }
    export type Collections = never;
    export namespace Collections {
        /**
         * <!-- FishyJoes.export(Collections.CollectionHolder) -->
         */
        export class CollectionHolder {
            constructor(boolArray: boolean[], boolSet: Set<boolean>, boolDictionary: Map<boolean, boolean>, integerArray: number[], integerSet: Set<number>, integerDictionary: Map<number, number>, stringArray: string[], stringSet: Set<string>, stringDictionary: Map<string, string>)
            boolArray: boolean[];
            boolSet: Set<boolean>;
            boolDictionary: Map<boolean, boolean>;
            integerArray: number[];
            integerSet: Set<number>;
            integerDictionary: Map<number, number>;
            stringArray: string[];
            stringSet: Set<string>;
            stringDictionary: Map<string, string>;
            /**
             * <!-- FishyJoes.export(staticProperty) -->
             */
            static readonly staticProperty: Optional<number>[];
            /**
             * <!-- FishyJoes.export(staticMutableProperty) -->
             */
            static staticMutableProperty: Optional<number>[];
        }
        /**
         * <!-- FishyJoes.export(arrayOfBigTuples) -->
         */
        const arrayOfBigTuples: [number, number, number, bigint][];
        /**
         * <!-- FishyJoes.export(arrayOfInt) -->
         */
        const arrayOfInt: number[];
        /**
         * <!-- FishyJoes.export(collectionMapper) -->
         */
        function collectionMapper(
            collection: Optional<Optional<number>[]>,
            mapper: (_0: Optional<Optional<number>[]>) => Optional<Optional<number>[]>
        ): Optional<Optional<number>[]>;
        /**
         * <!-- FishyJoes.export(defaultCollectionHolder) -->
         */
        const defaultCollectionHolder: Collections.CollectionHolder;
        /**
         * <!-- FishyJoes.export(dictionaryOfIntToInt) -->
         */
        const dictionaryOfIntToInt: Map<number, number>;
        /**
         * <!-- FishyJoes.export(echoArrayOfInt) -->
         */
        function echoArrayOfInt(
            arrayOfInt: number[]
        ): number[];
        /**
         * <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
         */
        function echoDictionaryOfIntToInt(
            dictionaryOfIntToInt: Map<number, number>
        ): Map<number, number>;
        /**
         * <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
         */
        function echoMaybeArrayOfMaybeInt(
            maybeArrayOfMaybeInt: Optional<Optional<number>[]>
        ): Optional<Optional<number>[]>;
        /**
         * <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
         */
        function echoMaybeDictionaryOfIntToMaybeInt(
            maybeDictionaryOfIntToMaybeInt: Optional<Map<number, Optional<number>>>
        ): Optional<Map<number, Optional<number>>>;
        /**
         * <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
         */
        function echoMaybeSetOfMaybeInt(
            maybeSetOfMaybeInt: Optional<Set<Optional<number>>>
        ): Optional<Set<Optional<number>>>;
        /**
         * <!-- FishyJoes.export(echoSetOfInt) -->
         */
        function echoSetOfInt(
            setOfInt: Set<number>
        ): Set<number>;
        /**
         * <!-- FishyJoes.export(maybeArrayOfInt) -->
         */
        const maybeArrayOfInt: Optional<number[]>;
        /**
         * <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
         */
        const maybeArrayOfMaybeInt: Optional<Optional<number>[]>;
        /**
         * <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
         */
        const maybeDictionaryOfIntToInt: Optional<Map<number, number>>;
        /**
         * <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
         */
        const maybeDictionaryOfIntToMaybeInt: Optional<Map<number, Optional<number>>>;
        /**
         * <!-- FishyJoes.export(maybeSetOfInt) -->
         */
        const maybeSetOfInt: Optional<Set<number>>;
        /**
         * <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
         */
        const maybeSetOfMaybeInt: Optional<Set<Optional<number>>>;
        /**
         * <!-- FishyJoes.export(setOfInt) -->
         */
        const setOfInt: Set<number>;
    }
    export type DefaultArguments = never;
    export namespace DefaultArguments {
        /**
         * <!-- FishyJoes.export(echoDefaults, compatibilityOrder: [z, y]) -->
         */
        function echoDefaults(
            x: Optional<number>,
            options?: {
                "y"?: Optional<number> /* defaults to `nil` */,
                "theLabelForZ"?: number /* defaults to `3.14` */,
            }
        ): string;
    }
    export type Deprecations = never;
    export namespace Deprecations {
        /**
         * <!-- FishyJoes.export(deprecatedMethod) -->
         * @deprecated don't use this
         */
        function deprecatedMethod(
        ): string;
        /**
         * <!-- FishyJoes.export(deprecatedVariable) -->
         * @deprecated replace with `deprecatedMethod` ( <-- swift name, sorry )
         */
        const deprecatedVariable: number;
    }
    export type EmptyEnum = never;
    export namespace EmptyEnum {
        /**
         * <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
         */
        function notGoingToHappen(
        ): TestAPI.EmptyEnum;
    }
    export class ExternalWitness_AProtocol {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(baz) -->
         */
        readonly baz: boolean;
        /**
         * <!-- FishyJoes.export(foo) -->
         */
        readonly foo: string;
        /**
         * <!-- FishyJoes.export(bar) -->
         */
        bar(
            x: number,
            y: number
        ): TestAPI.AProtocol;
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation) -->
         */
        hasADefaultImplementation(
            x: number,
            y: number
        ): string;
        /**
         * <!-- FishyJoes.export(hasADefaultImplementation2) -->
         */
        hasADefaultImplementation2(
            a: string,
            b: boolean,
            c: string
        ): string;
    }
    export class ExternalWitness_TestAsyncFunctions {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        readonly add3Things: (_0: number, _1: number, _2: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(const42) -->
         */
        readonly const42: () => Promise<number>;
        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        readonly fifthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>;
        /**
         * <!-- FishyJoes.export(iabs) -->
         */
        readonly iabs: (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        readonly intCompose: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        readonly makeList: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>;
        /**
         * <!-- FishyJoes.export(six) -->
         */
        readonly six: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        readonly willThrow: () => Promise<number>;
        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        exercise0(
            fn: () => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        exercise1(
            fn: (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        exercise2(
            fn: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        exercise3(
            fn: (_0: number, _1: number, _2: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        exercise4(
            fn: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        exercise5(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        exercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(thunkTwiceMaker) -->
         */
        thunkTwiceMaker(
            thunk: () => Promise<void>
        ): () => Promise<void>;
        /**
         * <!-- FishyJoes.export(defaultExercise6) -->
         */
        defaultExercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(witness) -->
         */
        witness(
        ): TestAPI.TestAsyncFunctions;
    }
    export class ExternalWitness_TestLeadingUnderscoredProp {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(_leadingUnderscoreProp) -->
         */
        readonly _leadingUnderscoreProp: string;
    }
    export class ExternalWitness_TestMethodsProtocol {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(foo) -->
         */
        foo(
        ): void;
        /**
         * <!-- FishyJoes.export(bar) -->
         */
        bar(
        ): boolean;
        /**
         * <!-- FishyJoes.export(baz) -->
         */
        baz(
            qux: boolean
        ): void;
        /**
         * <!-- FishyJoes.export(garply) -->
         */
        garply(
            _0: string
        ): string;
        /**
         * <!-- FishyJoes.export(xyzzy) -->
         */
        xyzzy(
            thud: number,
            grault: number[]
        ): string;
        /**
         * <!-- FishyJoes.export(plugh) -->
         */
        plugh(
            fred: [boolean, number, string[]]
        ): [boolean, number, string];
    }
    export class ExternalWitness_TestOptionalsProtocol {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(flarp) -->
         */
        readonly flarp?: string;
        /**
         * <!-- FishyJoes.export(wombat) -->
         */
        wombat(
            zxc: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(spqr) -->
         */
        spqr(
            pippo: TestAPI.AssociatedDataEnum
        ): number;
    }
    export class ExternalWitness_TestPropertiesProtocol {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(corge) -->
         */
        readonly corge: string;
        /**
         * <!-- FishyJoes.export(frobby) -->
         */
        readonly frobby: number[];
    }
    export type Functions = never;
    export namespace Functions {
        /**
         * <!-- FishyJoes.export(abs) -->
         */
        const abs: (_0: number) => number;
        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        const add3Things: (_0: number, _1: number, _2: number) => number;
        /**
         * <!-- FishyJoes.export(const42) -->
         */
        const const42: () => number;
        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        function exercise0(
            fn: () => number
        ): string;
        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        function exercise1(
            fn: (_0: number) => number
        ): string;
        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        function exercise2(
            fn: (_0: (_0: number) => number, _1: (_0: number) => number) => (_0: number) => number
        ): string;
        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        function exercise3(
            fn: (_0: number, _1: number, _2: number) => number
        ): string;
        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        function exercise4(
            fn: (_0: string, _1: string, _2: string, _3: string) => string[]
        ): string;
        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        function exercise5(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => number) => () => number
        ): string;
        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        function exercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => number, _5: number) => number
        ): string;
        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        const fifthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => number) => () => number;
        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        const intCompose: (_0: (_0: number) => number, _1: (_0: number) => number) => (_0: number) => number;
        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        const makeList: (_0: string, _1: string, _2: string, _3: string) => string[];
        /**
         * <!-- FishyJoes.export(sixthThing) -->
         */
        const sixthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => number, _5: number) => number;
        /**
         * <!-- FishyJoes.export(thunkTwiceMaker) -->
         */
        function thunkTwiceMaker(
            thunk: () => void
        ): () => void;
        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        function willThrow(
        ): string;
    }
    /**
     * <!-- FishyJoes.exportReference(Methods) -->
     */
    export class Methods {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(staticGet) -->
         */
        static readonly staticGet: number;
        /**
         * <!-- FishyJoes.exportAsMethod(staticGetMethod) -->
         */
        static readonly staticGetMethod: number;
        /**
         * <!-- FishyJoes.export(staticModifiable) -->
         */
        static staticModifiable: number;
        /**
         * <!-- FishyJoes.export(staticStored) -->
         */
        static staticStored: number;
        /**
         * <!-- FishyJoes.export(instanceGet) -->
         */
        readonly instanceGet: number;
        /**
         * <!-- FishyJoes.export(garply) -->
         */
        readonly garply: number;
        /**
         * <!-- FishyJoes.exportAsMethod(instanceGetMethod) -->
         */
        readonly instanceGetMethod: number;
        /**
         * <!-- FishyJoes.export(instanceModifiable) -->
         */
        instanceModifiable: number;
        /**
         * <!-- FishyJoes.export(instanceStored) -->
         */
        instanceStored: number;
        /**
         * <!-- FishyJoes.export(create) -->
         */
        static create(
        ): TestAPI.Methods;
        /**
         * <!-- FishyJoes.export(doublePlusGood) -->
         */
        doublePlusGood(
            a: number,
            b: number
        ): number;
        /**
         * <!-- FishyJoes.export(async42) -->
         */
        async42(
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(asyncYield) -->
         */
        asyncYield(
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(asyncSleep) -->
         */
        asyncSleep(
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(asyncVoid) -->
         */
        asyncVoid(
        ): Promise<void>;
        /**
         * <!-- FishyJoes.export(asyncDouble) -->
         */
        asyncDouble(
            d: number
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(asyncMultipleArgs) -->
         */
        asyncMultipleArgs(
            i: number,
            j: () => Promise<number>
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(asyncThrowing) -->
         */
        asyncThrowing(
        ): Promise<void>;
        /**
         * <!-- FishyJoes.export(asyncCallbackFunc0) -->
         */
        asyncCallbackFunc0(
            callback: () => Promise<number>
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(staticAsync42) -->
         */
        static staticAsync42(
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(staticAsyncYield) -->
         */
        static staticAsyncYield(
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(staticAsyncSleep) -->
         */
        static staticAsyncSleep(
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(staticAsyncVoid) -->
         */
        static staticAsyncVoid(
        ): Promise<void>;
        /**
         * <!-- FishyJoes.export(staticAsyncDouble) -->
         */
        static staticAsyncDouble(
            d: number
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(staticAsyncMultipleArgs) -->
         */
        static staticAsyncMultipleArgs(
            i: number,
            j: () => Promise<number>
        ): Promise<number>;
        /**
         * <!-- FishyJoes.export(staticAsyncThrowing) -->
         */
        static staticAsyncThrowing(
        ): Promise<void>;
        /**
         * <!-- FishyJoes.export(staticAsyncCallbackFunc0) -->
         */
        static staticAsyncCallbackFunc0(
            callback: () => Promise<number>
        ): Promise<number>;
    }
    export type Primitives = never;
    export namespace Primitives {
        /**
         * <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
         */
        export class PrimitiveHolder {
            constructor(b: boolean, bq: Optional<boolean>, ui8: number, ui8q: Optional<number>, ui16: number, ui16q: Optional<number>, ui32: number, ui32q: Optional<number>, ui64: bigint, ui64q: Optional<bigint>, ui: number, uiq: Optional<number>, i8: number, i8q: Optional<number>, i16: number, i16q: Optional<number>, i32: number, i32q: Optional<number>, i64: bigint, i64q: Optional<bigint>, i: number, iq: Optional<number>, f: number, fq: Optional<number>, d: number, dq: Optional<number>)
            b: boolean;
            bq?: boolean;
            ui8: number;
            ui8q?: number;
            ui16: number;
            ui16q?: number;
            ui32: number;
            ui32q?: number;
            ui64: bigint;
            ui64q?: bigint;
            ui: number;
            uiq?: number;
            i8: number;
            i8q?: number;
            i16: number;
            i16q?: number;
            i32: number;
            i32q?: number;
            i64: bigint;
            i64q?: bigint;
            i: number;
            iq?: number;
            f: number;
            fq?: number;
            d: number;
            dq?: number;
            /**
             * <!-- FishyJoes.export(staticProperty) -->
             */
            static readonly staticProperty: Optional<number>[];
            /**
             * <!-- FishyJoes.export(staticMutableProperty) -->
             */
            static staticMutableProperty: Optional<number>[];
        }
        /**
         * <!-- FishyJoes.export(bitCountInt) -->
         */
        const bitCountInt: number;
        /**
         * <!-- FishyJoes.export(bitCountUInt) -->
         */
        const bitCountUInt: number;
        /**
         * <!-- FishyJoes.export(defaultPrimitiveHolder) -->
         */
        const defaultPrimitiveHolder: Primitives.PrimitiveHolder;
        /**
         * <!-- FishyJoes.export(echoBool) -->
         */
        function echoBool(
            value: boolean
        ): boolean;
        /**
         * <!-- FishyJoes.export(echoDouble) -->
         */
        function echoDouble(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(echoFloat) -->
         */
        function echoFloat(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(echoInt) -->
         */
        function echoInt(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(echoInt16) -->
         */
        function echoInt16(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(echoInt32) -->
         */
        function echoInt32(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(echoInt64) -->
         */
        function echoInt64(
            value: bigint
        ): bigint;
        /**
         * <!-- FishyJoes.export(echoInt8) -->
         */
        function echoInt8(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(echoUInt) -->
         */
        function echoUInt(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(echoUInt16) -->
         */
        function echoUInt16(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(echoUInt32) -->
         */
        function echoUInt32(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(echoUInt64) -->
         */
        function echoUInt64(
            value: bigint
        ): bigint;
        /**
         * <!-- FishyJoes.export(echoUInt8) -->
         */
        function echoUInt8(
            value: number
        ): number;
        /**
         * <!-- FishyJoes.export(falseBool) -->
         */
        const falseBool: boolean;
        /**
         * <!-- FishyJoes.export(manyBool) -->
         */
        const manyBool: boolean[];
        /**
         * <!-- FishyJoes.export(manyDouble) -->
         */
        const manyDouble: number[];
        /**
         * <!-- FishyJoes.export(manyFloat) -->
         */
        const manyFloat: number[];
        /**
         * <!-- FishyJoes.export(manyInt) -->
         */
        const manyInt: number[];
        /**
         * <!-- FishyJoes.export(manyInt16) -->
         */
        const manyInt16: number[];
        /**
         * <!-- FishyJoes.export(manyInt32) -->
         */
        const manyInt32: number[];
        /**
         * <!-- FishyJoes.export(manyInt64) -->
         */
        const manyInt64: bigint[];
        /**
         * <!-- FishyJoes.export(manyInt8) -->
         */
        const manyInt8: number[];
        /**
         * <!-- FishyJoes.export(manyMaybeBool) -->
         */
        const manyMaybeBool: Optional<boolean>[];
        /**
         * <!-- FishyJoes.export(manyMaybeDouble) -->
         */
        const manyMaybeDouble: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyMaybeFloat) -->
         */
        const manyMaybeFloat: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyMaybeInt) -->
         */
        const manyMaybeInt: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyMaybeInt16) -->
         */
        const manyMaybeInt16: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyMaybeInt32) -->
         */
        const manyMaybeInt32: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyMaybeInt64) -->
         */
        const manyMaybeInt64: Optional<bigint>[];
        /**
         * <!-- FishyJoes.export(manyMaybeInt8) -->
         */
        const manyMaybeInt8: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyMaybeUInt) -->
         */
        const manyMaybeUInt: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyMaybeUInt16) -->
         */
        const manyMaybeUInt16: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyMaybeUInt32) -->
         */
        const manyMaybeUInt32: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyMaybeUInt64) -->
         */
        const manyMaybeUInt64: Optional<bigint>[];
        /**
         * <!-- FishyJoes.export(manyMaybeUInt8) -->
         */
        const manyMaybeUInt8: Optional<number>[];
        /**
         * <!-- FishyJoes.export(manyUInt) -->
         */
        const manyUInt: number[];
        /**
         * <!-- FishyJoes.export(manyUInt16) -->
         */
        const manyUInt16: number[];
        /**
         * <!-- FishyJoes.export(manyUInt32) -->
         */
        const manyUInt32: number[];
        /**
         * <!-- FishyJoes.export(manyUInt64) -->
         */
        const manyUInt64: bigint[];
        /**
         * <!-- FishyJoes.export(manyUInt8) -->
         */
        const manyUInt8: number[];
        /**
         * <!-- FishyJoes.export(maxDouble) -->
         */
        const maxDouble: number;
        /**
         * <!-- FishyJoes.export(maxFloat) -->
         */
        const maxFloat: number;
        /**
         * <!-- FishyJoes.export(maxInt) -->
         */
        const maxInt: number;
        /**
         * <!-- FishyJoes.export(maxInt16) -->
         */
        const maxInt16: number;
        /**
         * <!-- FishyJoes.export(maxInt32) -->
         */
        const maxInt32: number;
        /**
         * <!-- FishyJoes.export(maxInt64) -->
         */
        const maxInt64: bigint;
        /**
         * <!-- FishyJoes.export(maxInt8) -->
         */
        const maxInt8: number;
        /**
         * <!-- FishyJoes.export(maxUInt) -->
         */
        const maxUInt: number;
        /**
         * <!-- FishyJoes.export(maxUInt16) -->
         */
        const maxUInt16: number;
        /**
         * <!-- FishyJoes.export(maxUInt32) -->
         */
        const maxUInt32: number;
        /**
         * <!-- FishyJoes.export(maxUInt64) -->
         */
        const maxUInt64: bigint;
        /**
         * <!-- FishyJoes.export(maxUInt8) -->
         */
        const maxUInt8: number;
        /**
         * <!-- FishyJoes.export(maybeEchoBool) -->
         */
        function maybeEchoBool(
            value: Optional<boolean>
        ): Optional<boolean>;
        /**
         * <!-- FishyJoes.export(maybeEchoDouble) -->
         */
        function maybeEchoDouble(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(maybeEchoFloat) -->
         */
        function maybeEchoFloat(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(maybeEchoInt) -->
         */
        function maybeEchoInt(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(maybeEchoInt16) -->
         */
        function maybeEchoInt16(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(maybeEchoInt32) -->
         */
        function maybeEchoInt32(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(maybeEchoInt64) -->
         */
        function maybeEchoInt64(
            value: Optional<bigint>
        ): Optional<bigint>;
        /**
         * <!-- FishyJoes.export(maybeEchoInt8) -->
         */
        function maybeEchoInt8(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(maybeEchoUInt) -->
         */
        function maybeEchoUInt(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(maybeEchoUInt16) -->
         */
        function maybeEchoUInt16(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(maybeEchoUInt32) -->
         */
        function maybeEchoUInt32(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(maybeEchoUInt64) -->
         */
        function maybeEchoUInt64(
            value: Optional<bigint>
        ): Optional<bigint>;
        /**
         * <!-- FishyJoes.export(maybeEchoUInt8) -->
         */
        function maybeEchoUInt8(
            value: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(minDouble) -->
         */
        const minDouble: number;
        /**
         * <!-- FishyJoes.export(minFloat) -->
         */
        const minFloat: number;
        /**
         * <!-- FishyJoes.export(minInt) -->
         */
        const minInt: number;
        /**
         * <!-- FishyJoes.export(minInt16) -->
         */
        const minInt16: number;
        /**
         * <!-- FishyJoes.export(minInt32) -->
         */
        const minInt32: number;
        /**
         * <!-- FishyJoes.export(minInt64) -->
         */
        const minInt64: bigint;
        /**
         * <!-- FishyJoes.export(minInt8) -->
         */
        const minInt8: number;
        /**
         * <!-- FishyJoes.export(minUInt) -->
         */
        const minUInt: number;
        /**
         * <!-- FishyJoes.export(minUInt16) -->
         */
        const minUInt16: number;
        /**
         * <!-- FishyJoes.export(minUInt32) -->
         */
        const minUInt32: number;
        /**
         * <!-- FishyJoes.export(minUInt64) -->
         */
        const minUInt64: bigint;
        /**
         * <!-- FishyJoes.export(minUInt8) -->
         */
        const minUInt8: number;
        /**
         * <!-- FishyJoes.export(trueBool) -->
         */
        const trueBool: boolean;
        /**
         * <!-- FishyJoes.export(valueMapper) -->
         */
        function valueMapper(
            value: Optional<number>,
            mapper: (_0: Optional<number>) => Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(zeroDouble) -->
         */
        const zeroDouble: number;
        /**
         * <!-- FishyJoes.export(zeroFloat) -->
         */
        const zeroFloat: number;
        /**
         * <!-- FishyJoes.export(zeroInt) -->
         */
        const zeroInt: number;
        /**
         * <!-- FishyJoes.export(zeroInt16) -->
         */
        const zeroInt16: number;
        /**
         * <!-- FishyJoes.export(zeroInt32) -->
         */
        const zeroInt32: number;
        /**
         * <!-- FishyJoes.export(zeroInt64) -->
         */
        const zeroInt64: bigint;
        /**
         * <!-- FishyJoes.export(zeroInt8) -->
         */
        const zeroInt8: number;
        /**
         * <!-- FishyJoes.export(zeroUInt) -->
         */
        const zeroUInt: number;
        /**
         * <!-- FishyJoes.export(zeroUInt16) -->
         */
        const zeroUInt16: number;
        /**
         * <!-- FishyJoes.export(zeroUInt32) -->
         */
        const zeroUInt32: number;
        /**
         * <!-- FishyJoes.export(zeroUInt64) -->
         */
        const zeroUInt64: bigint;
        /**
         * <!-- FishyJoes.export(zeroUInt8) -->
         */
        const zeroUInt8: number;
    }
    export type Ranges = never;
    export namespace Ranges {
        /**
         * <!-- FishyJoes.export(echoInt16Range) -->
         */
        function echoInt16Range(
            range: Runtime.SwiftRange<number>
        ): Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(echoInt32Range) -->
         */
        function echoInt32Range(
            range: Runtime.SwiftRange<number>
        ): Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(echoInt64Range) -->
         */
        function echoInt64Range(
            range: Runtime.SwiftRange<bigint>
        ): Runtime.SwiftRange<bigint>;
        /**
         * <!-- FishyJoes.export(echoInt8Range) -->
         */
        function echoInt8Range(
            range: Runtime.SwiftRange<number>
        ): Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(echoIntRange) -->
         */
        function echoIntRange(
            range: Runtime.SwiftRange<number>
        ): Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(echoUInt16Range) -->
         */
        function echoUInt16Range(
            range: Runtime.SwiftRange<number>
        ): Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(echoUInt32Range) -->
         */
        function echoUInt32Range(
            range: Runtime.SwiftRange<number>
        ): Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(echoUInt64Range) -->
         */
        function echoUInt64Range(
            range: Runtime.SwiftRange<bigint>
        ): Runtime.SwiftRange<bigint>;
        /**
         * <!-- FishyJoes.export(echoUInt8Range) -->
         */
        function echoUInt8Range(
            range: Runtime.SwiftRange<number>
        ): Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(echoUIntRange) -->
         */
        function echoUIntRange(
            range: Runtime.SwiftRange<number>
        ): Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(int16Range) -->
         */
        const int16Range: Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(int32Range) -->
         */
        const int32Range: Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(int64Range) -->
         */
        const int64Range: Runtime.SwiftRange<bigint>;
        /**
         * <!-- FishyJoes.export(int8Range) -->
         */
        const int8Range: Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(intRange) -->
         */
        const intRange: Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(uInt16Range) -->
         */
        const uInt16Range: Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(uInt32Range) -->
         */
        const uInt32Range: Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(uInt64Range) -->
         */
        const uInt64Range: Runtime.SwiftRange<bigint>;
        /**
         * <!-- FishyJoes.export(uInt8Range) -->
         */
        const uInt8Range: Runtime.SwiftRange<number>;
        /**
         * <!-- FishyJoes.export(uIntRange) -->
         */
        const uIntRange: Runtime.SwiftRange<number>;
    }
    export type SimpleEnum = "red" | "green" | "blue";
    export namespace SimpleEnum {
        /**
         * <!-- FishyJoes.export(favoriteColor) -->
         */
        let favoriteColor: TestAPI.SimpleEnum;
        /**
         * <!-- FishyJoes.export(hex) -->
         */
        function getHex(
            self: TestAPI.SimpleEnum
        ): number;
        /**
         * <!-- FishyJoes.export(hexMethod) -->
         */
        function hexMethod(
            self: TestAPI.SimpleEnum
        ): string;
        /**
         * <!-- FishyJoes.export(pickAColor) -->
         */
        function pickAColor(
            rawValue: number
        ): Optional<TestAPI.SimpleEnum>;
        /**
         * <!-- FishyJoes.export(resetFavoriteColor) -->
         */
        function resetFavoriteColor(
        ): void;
    }
    /**
     * <!-- FishyJoes.export(String_PuttingTypesIntoQuestionablePlaces) -->
     */
    export class String_PuttingTypesIntoQuestionablePlaces {
        constructor(x: string)
        readonly x: string;
        /**
         * <!-- FishyJoes.export(testCall) -->
         */
        testCall(
        ): number;
    }
    export type Strings = never;
    export namespace Strings {
        /**
         * <!-- FishyJoes.export(accent) -->
         */
        const accent: string;
        /**
         * <!-- FishyJoes.export(chinese) -->
         */
        const chinese: string;
        /**
         * <!-- FishyJoes.export(chineseBMP) -->
         */
        const chineseBMP: string;
        /**
         * <!-- FishyJoes.export(chineseSIP) -->
         */
        const chineseSIP: string;
        /**
         * <!-- FishyJoes.export(echo) -->
         */
        function echo(
            string: string
        ): string;
        /**
         * <!-- FishyJoes.export(emoji) -->
         */
        const emoji: string;
        /**
         * <!-- FishyJoes.export(emojiMulti) -->
         */
        const emojiMulti: string;
        /**
         * <!-- FishyJoes.export(script) -->
         */
        const script: string;
        /**
         * <!-- FishyJoes.export(simple) -->
         */
        const simple: string;
    }
    export type Structs = never;
    export namespace Structs {
        /**
         * <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
         */
        export class MemberwiseStruct {
            constructor(immutable: string, mutable: string)
            readonly immutable: string;
            mutable: string;
            /**
             * <!-- FishyJoes.export(create) -->
             */
            static create(
            ): Structs.MemberwiseStruct;
            /**
             * <!-- FishyJoes.export(asyncGetMutable) -->
             */
            asyncGetMutable(
            ): Promise<string>;
        }
        /**
         * <!-- FishyJoes.export(Structs.MutableStruct) -->
         */
        export class MutableStruct {
            constructor(i: number)
            i: number;
            /**
             * <!-- FishyJoes.export(create) -->
             */
            static create(
            ): Structs.MutableStruct;
            /**
             * <!-- FishyJoes.export(increment) -->
             */
            increment(
            ): void;
            /**
             * <!-- FishyJoes.export(incrementAsync) -->
             */
            incrementAsync(
            ): Promise<void>;
            /**
             * <!-- FishyJoes.export(asyncGetI) -->
             */
            asyncGetI(
            ): Promise<number>;
        }
        /**
         * <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
         */
        export class ReferenceStruct {
            private constructor()
            private _inhibitStructuralTyping: any
            /**
             * <!-- FishyJoes.export(immutable) -->
             */
            readonly immutable: string;
            /**
             * <!-- FishyJoes.export(mutable) -->
             */
            mutable: string;
            /**
             * <!-- FishyJoes.export(create) -->
             */
            static create(
            ): TestAPI.Structs.ReferenceStruct;
            /**
             * <!-- FishyJoes.export(asyncGetMutable) -->
             */
            asyncGetMutable(
            ): Promise<string>;
        }
    }
    /**
     * <!-- FishyJoes.exportReference(Structs_PuttingTypesIntoQuestionablePlaces) -->
     */
    export class Structs_PuttingTypesIntoQuestionablePlaces {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(create) -->
         */
        static create(
        ): TestAPI.Structs_PuttingTypesIntoQuestionablePlaces;
        /**
         * <!-- FishyJoes.export(testCall) -->
         */
        testCall(
        ): number;
    }
    /**
     * <!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct, conformances: [TestAsyncFunctions]) -->
     */
    export class TestAsyncForeignSideFunctionsStruct implements TestAsyncFunctions {
        constructor(const42: () => Promise<number>, iabs: (_0: number) => Promise<number>, intCompose: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>, add3Things: (_0: number, _1: number, _2: number) => Promise<number>, makeList: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>, fifthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>, six: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>, willThrow: () => Promise<number>, exercise0Fun: (_0: () => Promise<number>) => Promise<string>, exercise1Fun: (_0: (_0: number) => Promise<number>) => Promise<string>, exercise2Fun: (_0: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>) => Promise<string>, exercise3Fun: (_0: (_0: number, _1: number, _2: number) => Promise<number>) => Promise<string>, exercise4Fun: (_0: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>) => Promise<string>, exercise5Fun: (_0: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>) => Promise<string>, exercise6Fun: (_0: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>) => Promise<string>, thunkTwiceMakerFun: (_0: () => Promise<void>) => () => Promise<void>)
        readonly const42: () => Promise<number>;
        readonly iabs: (_0: number) => Promise<number>;
        readonly intCompose: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>;
        readonly add3Things: (_0: number, _1: number, _2: number) => Promise<number>;
        readonly makeList: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>;
        readonly fifthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>;
        readonly six: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>;
        readonly willThrow: () => Promise<number>;
        readonly exercise0Fun: (_0: () => Promise<number>) => Promise<string>;
        readonly exercise1Fun: (_0: (_0: number) => Promise<number>) => Promise<string>;
        readonly exercise2Fun: (_0: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>) => Promise<string>;
        readonly exercise3Fun: (_0: (_0: number, _1: number, _2: number) => Promise<number>) => Promise<string>;
        readonly exercise4Fun: (_0: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>) => Promise<string>;
        readonly exercise5Fun: (_0: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>) => Promise<string>;
        readonly exercise6Fun: (_0: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>) => Promise<string>;
        readonly thunkTwiceMakerFun: (_0: () => Promise<void>) => () => Promise<void>;
        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        exercise0(
            fn: () => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        exercise1(
            fn: (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        exercise2(
            fn: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        exercise3(
            fn: (_0: number, _1: number, _2: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        exercise4(
            fn: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        exercise5(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        exercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(thunkTwiceMaker) -->
         */
        thunkTwiceMaker(
            thunk: () => Promise<void>
        ): () => Promise<void>;
        /**
         * <!-- FishyJoes.export(witness) -->
         */
        witness(
        ): TestAPI.TestAsyncFunctions;
        /**
         * <!-- FishyJoes.export(defaultExercise6) -->
         */
        defaultExercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
    }
    /**
     * <!-- FishyJoes.export(TestAsyncFunctions) -->
     */
    interface TestAsyncFunctions {
        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        readonly add3Things: (_0: number, _1: number, _2: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(const42) -->
         */
        readonly const42: () => Promise<number>;
        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        readonly fifthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>;
        /**
         * <!-- FishyJoes.export(iabs) -->
         */
        readonly iabs: (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        readonly intCompose: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        readonly makeList: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>;
        /**
         * <!-- FishyJoes.export(six) -->
         */
        readonly six: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        readonly willThrow: () => Promise<number>;
        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        exercise0(
            fn: () => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        exercise1(
            fn: (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        exercise2(
            fn: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        exercise3(
            fn: (_0: number, _1: number, _2: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        exercise4(
            fn: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        exercise5(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        exercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(thunkTwiceMaker) -->
         */
        thunkTwiceMaker(
            thunk: () => Promise<void>
        ): () => Promise<void>;
        /**
         * <!-- FishyJoes.export(defaultExercise6) -->
         */
        defaultExercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(witness) -->
         */
        witness(
        ): TestAPI.TestAsyncFunctions;
    }
    interface TestAsyncFunctionsCore {
        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        readonly add3Things: (_0: number, _1: number, _2: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(const42) -->
         */
        readonly const42: () => Promise<number>;
        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        readonly fifthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>;
        /**
         * <!-- FishyJoes.export(iabs) -->
         */
        readonly iabs: (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        readonly intCompose: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        readonly makeList: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>;
        /**
         * <!-- FishyJoes.export(six) -->
         */
        readonly six: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        readonly willThrow: () => Promise<number>;
        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        exercise0(
            this: TestAsyncFunctions,
            fn: () => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        exercise1(
            this: TestAsyncFunctions,
            fn: (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        exercise2(
            this: TestAsyncFunctions,
            fn: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        exercise3(
            this: TestAsyncFunctions,
            fn: (_0: number, _1: number, _2: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        exercise4(
            this: TestAsyncFunctions,
            fn: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        exercise5(
            this: TestAsyncFunctions,
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        exercise6(
            this: TestAsyncFunctions,
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(thunkTwiceMaker) -->
         */
        thunkTwiceMaker(
            this: TestAsyncFunctions,
            thunk: () => Promise<void>
        ): () => Promise<void>;
        /**
         * <!-- FishyJoes.export(defaultExercise6) -->
         */
        defaultExercise6?(
            this: TestAsyncFunctions,
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(witness) -->
         */
        witness(
            this: TestAsyncFunctions
        ): TestAPI.TestAsyncFunctions;
    }
    namespace TestAsyncFunctions {
        function fromCore(core: TestAsyncFunctionsCore): TestAsyncFunctions
    }
    /**
     * <!-- FishyJoes.export(TestAsyncSwiftSideFunctionsClass, conformances: [TestAsyncFunctions]) -->
     */
    export class TestAsyncSwiftSideFunctionsClass implements TestAsyncFunctions {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(const42) -->
         */
        readonly const42: () => Promise<number>;
        /**
         * <!-- FishyJoes.export(iabs) -->
         */
        readonly iabs: (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        readonly intCompose: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        readonly add3Things: (_0: number, _1: number, _2: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        readonly makeList: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>;
        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        readonly fifthThing: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>;
        /**
         * <!-- FishyJoes.export(six) -->
         */
        readonly six: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>;
        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        readonly willThrow: () => Promise<number>;
        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        exercise0(
            fn: () => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        exercise1(
            fn: (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        exercise2(
            fn: (_0: (_0: number) => Promise<number>, _1: (_0: number) => Promise<number>) => (_0: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        exercise3(
            fn: (_0: number, _1: number, _2: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        exercise4(
            fn: (_0: string, _1: string, _2: string, _3: string) => Promise<string[]>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        exercise5(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>) => Promise<() => Promise<number>>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        exercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
        /**
         * <!-- FishyJoes.export(thunkTwiceMaker) -->
         */
        thunkTwiceMaker(
            thunk: () => Promise<void>
        ): () => Promise<void>;
        /**
         * <!-- FishyJoes.export(witness) -->
         */
        witness(
        ): TestAPI.TestAsyncFunctions;
        /**
         * <!-- FishyJoes.export(init) -->
         */
        static init(
        ): TestAPI.TestAsyncSwiftSideFunctionsClass;
        /**
         * <!-- FishyJoes.export(defaultExercise6) -->
         */
        defaultExercise6(
            fn: (_0: string, _1: number, _2: number, _3: string, _4: () => Promise<number>, _5: number) => Promise<number>
        ): Promise<string>;
    }
    /**
     * <!-- FishyJoes.export(TestLeadingUnderscoredProp) -->
     */
    interface TestLeadingUnderscoredProp {
        /**
         * <!-- FishyJoes.export(_leadingUnderscoreProp) -->
         */
        readonly _leadingUnderscoreProp: string;
    }
    /**
     * // <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp, TestLeadingUnderscoredMethod]) -->
     * <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp]) -->
     */
    export class TestLeadingUnderscoredPropStruct implements TestLeadingUnderscoredProp {
        constructor(_leadingUnderscoreProp: string)
        _leadingUnderscoreProp: string;
    }
    /**
     * <!-- FishyJoes.export(TestMethodsProtocol) -->
     */
    interface TestMethodsProtocol {
        /**
         * <!-- FishyJoes.export(foo) -->
         */
        foo(
        ): void;
        /**
         * <!-- FishyJoes.export(bar) -->
         */
        bar(
        ): boolean;
        /**
         * <!-- FishyJoes.export(baz) -->
         */
        baz(
            qux: boolean
        ): void;
        /**
         * <!-- FishyJoes.export(garply) -->
         */
        garply(
            _0: string
        ): string;
        /**
         * <!-- FishyJoes.export(xyzzy) -->
         */
        xyzzy(
            thud: number,
            grault: number[]
        ): string;
        /**
         * <!-- FishyJoes.export(plugh) -->
         */
        plugh(
            fred: [boolean, number, string[]]
        ): [boolean, number, string];
    }
    /**
     * <!-- FishyJoes.export(TestOptionalsProtocol) -->
     */
    interface TestOptionalsProtocol {
        /**
         * <!-- FishyJoes.export(flarp) -->
         */
        readonly flarp?: string;
        /**
         * <!-- FishyJoes.export(wombat) -->
         */
        wombat(
            zxc: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(spqr) -->
         */
        spqr(
            pippo: TestAPI.AssociatedDataEnum
        ): number;
    }
    /**
     * <!-- FishyJoes.export(TestPropertiesProtocol) -->
     */
    interface TestPropertiesProtocol {
        /**
         * <!-- FishyJoes.export(corge) -->
         */
        readonly corge: string;
        /**
         * <!-- FishyJoes.export(frobby) -->
         */
        readonly frobby: number[];
    }
    /**
     * <!-- FishyJoes.exportReference(TestProtocolClass, conformances: [TestMethodsProtocol, TestPropertiesProtocol, TestOptionalsProtocol]) -->
     */
    export class TestProtocolClass implements TestMethodsProtocol, TestOptionalsProtocol, TestPropertiesProtocol {
        private constructor()
        private _inhibitStructuralTyping: any
        /**
         * <!-- FishyJoes.export(corge) -->
         */
        corge: string;
        /**
         * <!-- FishyJoes.export(flarp) -->
         */
        flarp?: string;
        /**
         * <!-- FishyJoes.export(frobby) -->
         */
        readonly frobby: number[];
        /**
         * <!-- FishyJoes.export(foo) -->
         */
        foo(
        ): void;
        /**
         * <!-- FishyJoes.export(bar) -->
         */
        bar(
        ): boolean;
        /**
         * <!-- FishyJoes.export(baz) -->
         */
        baz(
            qux: boolean
        ): void;
        /**
         * <!-- FishyJoes.export(garply) -->
         */
        garply(
            str: string
        ): string;
        /**
         * <!-- FishyJoes.export(xyzzy) -->
         */
        xyzzy(
            thud: number,
            grault: number[]
        ): string;
        /**
         * <!-- FishyJoes.export(plugh) -->
         */
        plugh(
            fred: [boolean, number, string[]]
        ): [boolean, number, string];
        /**
         * <!-- FishyJoes.export(init) -->
         */
        static init(
            corge: string,
            options?: {
                "flarp"?: Optional<string> /* defaults to `nil` */,
            }
        ): TestAPI.TestProtocolClass;
        /**
         * <!-- FishyJoes.export(wombat) -->
         */
        wombat(
            zxc: Optional<number>
        ): Optional<number>;
        /**
         * <!-- FishyJoes.export(spqr) -->
         */
        spqr(
            pippo: TestAPI.AssociatedDataEnum
        ): number;
    }
    export type TestProtocolEnum = "qux";
    export namespace TestProtocolEnum {
        /**
         * <!-- FishyJoes.export(bar) -->
         */
        function bar(
            self: TestAPI.TestProtocolEnum
        ): boolean;
        /**
         * <!-- FishyJoes.export(baz) -->
         */
        function baz(
            self: TestAPI.TestProtocolEnum,
            qux: boolean
        ): void;
        /**
         * <!-- FishyJoes.export(foo) -->
         */
        function foo(
            self: TestAPI.TestProtocolEnum
        ): void;
        /**
         * <!-- FishyJoes.export(garply) -->
         */
        function garply(
            self: TestAPI.TestProtocolEnum,
            str: string
        ): string;
        /**
         * <!-- FishyJoes.export(plugh) -->
         */
        function plugh(
            self: TestAPI.TestProtocolEnum,
            fred: [boolean, number, string[]]
        ): [boolean, number, string];
        /**
         * <!-- FishyJoes.export(xyzzy) -->
         */
        function xyzzy(
            self: TestAPI.TestProtocolEnum,
            thud: number,
            grault: number[]
        ): string;
    }
    /**
     * <!-- FishyJoes.export(TestProtocolStruct, conformances: [TestMethodsProtocol, TestPropertiesProtocol]) -->
     */
    export class TestProtocolStruct implements TestMethodsProtocol, TestPropertiesProtocol {
        constructor(corge: string)
        corge: string;
        /**
         * <!-- FishyJoes.export(frobby) -->
         */
        readonly frobby: number[];
        /**
         * <!-- FishyJoes.export(foo) -->
         */
        foo(
        ): void;
        /**
         * <!-- FishyJoes.export(bar) -->
         */
        bar(
        ): boolean;
        /**
         * <!-- FishyJoes.export(baz) -->
         */
        baz(
            qux: boolean
        ): void;
        /**
         * <!-- FishyJoes.export(garply) -->
         */
        garply(
            str: string
        ): string;
        /**
         * <!-- FishyJoes.export(xyzzy) -->
         */
        xyzzy(
            thud: number,
            grault: number[]
        ): string;
        /**
         * <!-- FishyJoes.export(plugh) -->
         */
        plugh(
            fred: [boolean, number, string[]]
        ): [boolean, number, string];
    }
    export type Tuples = never;
    export namespace Tuples {
        /**
         * <!-- FishyJoes.export(checkTuples) -->
         */
        function checkTuples(
            t2: [number, string],
            t3: [string, number, string],
            t4: [[number, string], [string, number, string], string, boolean],
            t5: [string, number, [[number, string], [string, number, string], string, boolean], [string, number, string], [number, string]],
            t6: [string, number, number, [[number, string], [string, number, string], string, boolean], [string, number, [[number, string], [string, number, string], string, boolean], [string, number, string], [number, string]], boolean]
        ): boolean;
        /**
         * <!-- FishyJoes.export(tuple2) -->
         */
        const tuple2: [number, string];
        /**
         * <!-- FishyJoes.export(tuple3) -->
         */
        const tuple3: [string, number, string];
        /**
         * <!-- FishyJoes.export(tuple4) -->
         */
        const tuple4: [[number, string], [string, number, string], string, boolean];
        /**
         * <!-- FishyJoes.export(tuple5) -->
         */
        const tuple5: [string, number, [[number, string], [string, number, string], string, boolean], [string, number, string], [number, string]];
        /**
         * <!-- FishyJoes.export(tuple6) -->
         */
        const tuple6: [string, number, number, [[number, string], [string, number, string], string, boolean], [string, number, [[number, string], [string, number, string], string, boolean], [string, number, string], [number, string]], boolean];
    }
    export type URLs = never;
    export namespace URLs {
        /**
         * <!-- FishyJoes.export(echo) -->
         */
        function echo(
            url: URL
        ): URL;
        /**
         * <!-- FishyJoes.export(localFile) -->
         */
        const localFile: URL;
        /**
         * <!-- FishyJoes.export(remoteFile) -->
         */
        const remoteFile: URL;
        /**
         * <!-- FishyJoes.export(simple) -->
         */
        const simple: URL;
    }
    export type UnicodeScalar_PuttingTypesIntoQuestionablePlaces = "thing";
    export namespace UnicodeScalar_PuttingTypesIntoQuestionablePlaces {
        /**
         * <!-- FishyJoes.export(testCall) -->
         */
        function testCall(
            self: TestAPI.UnicodeScalar_PuttingTypesIntoQuestionablePlaces
        ): number;
    }
}

export declare function init(): Promise<{
    Runtime: typeof Runtime,
    TestAPI: typeof TestAPI,
}>;

export default TestAPI;
