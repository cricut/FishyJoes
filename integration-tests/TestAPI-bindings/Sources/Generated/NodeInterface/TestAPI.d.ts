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

export declare namespace TestAPI {
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
        const doubleRange: SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoDoubleRange) -->
         */
        function echoDoubleRange(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoFloatRange) -->
         */
        function echoFloatRange(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoInt16Range) -->
         */
        function echoInt16Range(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoInt32Range) -->
         */
        function echoInt32Range(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoInt64Range) -->
         */
        function echoInt64Range(
            range: SwiftClosedRange<bigint>
        ): SwiftClosedRange<bigint>;

        /**
         * <!-- FishyJoes.export(echoInt8Range) -->
         */
        function echoInt8Range(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoIntRange) -->
         */
        function echoIntRange(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoStringRange) -->
         */
        function echoStringRange(
            range: SwiftClosedRange<string>
        ): SwiftClosedRange<string>;

        /**
         * <!-- FishyJoes.export(echoUInt16Range) -->
         */
        function echoUInt16Range(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoUInt32Range) -->
         */
        function echoUInt32Range(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoUInt64Range) -->
         */
        function echoUInt64Range(
            range: SwiftClosedRange<bigint>
        ): SwiftClosedRange<bigint>;

        /**
         * <!-- FishyJoes.export(echoUInt8Range) -->
         */
        function echoUInt8Range(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(echoUIntRange) -->
         */
        function echoUIntRange(
            range: SwiftClosedRange<number>
        ): SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(floatRange) -->
         */
        const floatRange: SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(int16Range) -->
         */
        const int16Range: SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(int32Range) -->
         */
        const int32Range: SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(int64Range) -->
         */
        const int64Range: SwiftClosedRange<bigint>;

        /**
         * <!-- FishyJoes.export(int8Range) -->
         */
        const int8Range: SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(intRange) -->
         */
        const intRange: SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(stringRange) -->
         */
        const stringRange: SwiftClosedRange<string>;

        /**
         * <!-- FishyJoes.export(uInt16Range) -->
         */
        const uInt16Range: SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(uInt32Range) -->
         */
        const uInt32Range: SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(uInt64Range) -->
         */
        const uInt64Range: SwiftClosedRange<bigint>;

        /**
         * <!-- FishyJoes.export(uInt8Range) -->
         */
        const uInt8Range: SwiftClosedRange<number>;

        /**
         * <!-- FishyJoes.export(uIntRange) -->
         */
        const uIntRange: SwiftClosedRange<number>;
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
            mapper: (_0: Optional<number>[]) => Optional<number>[]
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
            maybeDictionaryOfIntToMaybeInt: Optional<Map<number, number>>
        ): Optional<Map<number, number>>;

        /**
         * <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
         */
        function echoMaybeSetOfMaybeInt(
            maybeSetOfMaybeInt: Optional<Set<number>>
        ): Optional<Set<number>>;

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
        const maybeDictionaryOfIntToMaybeInt: Optional<Map<number, number>>;

        /**
         * <!-- FishyJoes.export(maybeSetOfInt) -->
         */
        const maybeSetOfInt: Optional<Set<number>>;

        /**
         * <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
         */
        const maybeSetOfMaybeInt: Optional<Set<number>>;

        /**
         * <!-- FishyJoes.export(setOfInt) -->
         */
        const setOfInt: Set<number>;
    }

    export type DefaultArguments = never;
    export namespace DefaultArguments {
        /**
         * <!-- FishyJoes.export(echoDefaults) -->
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

    export type Functions = never;
    export namespace Functions {
        /**
         * <!-- FishyJoes.exportReference(Functions.TheError) -->
         */
        export class TheError {
            private constructor()
            private _inhibitStructuralTyping: any
        }

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
            mapper: (_0: number) => number
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
            range: SwiftRange<number>
        ): SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(echoInt32Range) -->
         */
        function echoInt32Range(
            range: SwiftRange<number>
        ): SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(echoInt64Range) -->
         */
        function echoInt64Range(
            range: SwiftRange<bigint>
        ): SwiftRange<bigint>;

        /**
         * <!-- FishyJoes.export(echoInt8Range) -->
         */
        function echoInt8Range(
            range: SwiftRange<number>
        ): SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(echoIntRange) -->
         */
        function echoIntRange(
            range: SwiftRange<number>
        ): SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(echoUInt16Range) -->
         */
        function echoUInt16Range(
            range: SwiftRange<number>
        ): SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(echoUInt32Range) -->
         */
        function echoUInt32Range(
            range: SwiftRange<number>
        ): SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(echoUInt64Range) -->
         */
        function echoUInt64Range(
            range: SwiftRange<bigint>
        ): SwiftRange<bigint>;

        /**
         * <!-- FishyJoes.export(echoUInt8Range) -->
         */
        function echoUInt8Range(
            range: SwiftRange<number>
        ): SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(echoUIntRange) -->
         */
        function echoUIntRange(
            range: SwiftRange<number>
        ): SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(int16Range) -->
         */
        const int16Range: SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(int32Range) -->
         */
        const int32Range: SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(int64Range) -->
         */
        const int64Range: SwiftRange<bigint>;

        /**
         * <!-- FishyJoes.export(int8Range) -->
         */
        const int8Range: SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(intRange) -->
         */
        const intRange: SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(uInt16Range) -->
         */
        const uInt16Range: SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(uInt32Range) -->
         */
        const uInt32Range: SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(uInt64Range) -->
         */
        const uInt64Range: SwiftRange<bigint>;

        /**
         * <!-- FishyJoes.export(uInt8Range) -->
         */
        const uInt8Range: SwiftRange<number>;

        /**
         * <!-- FishyJoes.export(uIntRange) -->
         */
        const uIntRange: SwiftRange<number>;
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
        }
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
}
export declare function init(): Promise<{
    TestAPI: typeof TestAPI,
}>;
export default TestAPI;
