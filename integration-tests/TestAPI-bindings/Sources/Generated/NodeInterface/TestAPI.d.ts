export type Optional<T> = T | undefined;
export declare namespace TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Bytes) -->
     */
    export class Bytes {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
         */
        static readonly bytes: number[];

        /**
         * <!-- FishyJoes.export(data) -->
         */
        static readonly data: ArrayBuffer;

        /**
         * <!-- FishyJoes.export(echoBytes) -->
         */
        static echoBytes(
            bytes: number[]
        ): number[];

        /**
         * <!-- FishyJoes.export(echoData) -->
         */
        static echoData(
            data: ArrayBuffer
        ): ArrayBuffer;
    }

    /**
     * <!-- FishyJoes.exportReference(Collections) -->
     */
    export class Collections {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * <!-- FishyJoes.export(arrayOfInt) -->
         */
        static readonly arrayOfInt: number[];

        /**
         * <!-- FishyJoes.export(setOfInt) -->
         */
        static readonly setOfInt: Set<number>;

        /**
         * <!-- FishyJoes.export(dictionaryOfIntToInt) -->
         */
        static readonly dictionaryOfIntToInt: Map<number, number>;

        /**
         * <!-- FishyJoes.export(maybeArrayOfInt) -->
         */
        static readonly maybeArrayOfInt?: number[];

        /**
         * <!-- FishyJoes.export(maybeSetOfInt) -->
         */
        static readonly maybeSetOfInt?: Set<number>;

        /**
         * <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
         */
        static readonly maybeDictionaryOfIntToInt?: Map<number, number>;

        /**
         * <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
         */
        static readonly maybeArrayOfMaybeInt?: number[];

        /**
         * <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
         */
        static readonly maybeSetOfMaybeInt?: Set<number>;

        /**
         * <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
         */
        static readonly maybeDictionaryOfIntToMaybeInt?: Map<number, number>;

        /**
         * <!-- FishyJoes.export(defaultCollectionHolder) -->
         */
        static readonly defaultCollectionHolder: Collections.CollectionHolder;

        /**
         * <!-- FishyJoes.export(echoArrayOfInt) -->
         */
        static echoArrayOfInt(
            arrayOfInt: number[]
        ): number[];

        /**
         * <!-- FishyJoes.export(echoSetOfInt) -->
         */
        static echoSetOfInt(
            setOfInt: Set<number>
        ): Set<number>;

        /**
         * <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
         */
        static echoDictionaryOfIntToInt(
            dictionaryOfIntToInt: Map<number, number>
        ): Map<number, number>;

        /**
         * <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
         */
        static echoMaybeArrayOfMaybeInt(
            maybeArrayOfMaybeInt: Optional<number[]>
        ): Optional<number[]>;

        /**
         * <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
         */
        static echoMaybeSetOfMaybeInt(
            maybeSetOfMaybeInt: Optional<Set<number>>
        ): Optional<Set<number>>;

        /**
         * <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
         */
        static echoMaybeDictionaryOfIntToMaybeInt(
            maybeDictionaryOfIntToMaybeInt: Optional<Map<number, number>>
        ): Optional<Map<number, number>>;

        /**
         * <!-- FishyJoes.export(collectionMapper) -->
         */
        static collectionMapper(
            collection: Optional<number[]>,
            mapper: (_: number[]) => number[]
        ): Optional<number[]>;
    }
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
             * <!-- FishyJoes.export(staticPropery) -->
             */
            static readonly staticPropery: number[];

            /**
             * <!-- FishyJoes.export(staticMutablePropery) -->
             */
            static staticMutablePropery: number[];
        }
    }

    /**
     * <!-- FishyJoes.exportReference(DefaultArguments) -->
     */
    export class DefaultArguments {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * <!-- FishyJoes.export(echoDefaults) -->
         */
        static echoDefaults(
            x: Optional<number>,
            options?: {
                "y"?: Optional<number> /* defaults to `nil` */,
                "z"?: number /* defaults to `3.14` */,
            }
        ): string;
    }

    /**
     * <!-- FishyJoes.exportReference(Deprecations) -->
     */
    export class Deprecations {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * <!-- FishyJoes.export(deprecatedVariable) -->
         * @deprecated replace with `deprecatedMethod` ( <-- swift name, sorry )
         */
        static readonly deprecatedVariable: number;

        /**
         * <!-- FishyJoes.export(deprecatedMethod) -->
         * @deprecated don't use this
         */
        static deprecatedMethod(
        ): string;
    }

    /**
     * <!-- FishyJoes.exportReference(Functions) -->
     */
    export class Functions {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * <!-- FishyJoes.export(const42) -->
         */
        static readonly const42: () => number;

        /**
         * <!-- FishyJoes.export(abs) -->
         */
        static readonly abs: (_: number) => number;

        /**
         * <!-- FishyJoes.export(intCompose) -->
         */
        static readonly intCompose: (_: (_: number) => number, _: (_: number) => number) => (_: number) => number;

        /**
         * <!-- FishyJoes.export(add3Things) -->
         */
        static readonly add3Things: (_: number, _: number, _: number) => number;

        /**
         * <!-- FishyJoes.export(makeList) -->
         */
        static readonly makeList: (_: string, _: string, _: string, _: string) => string[];

        /**
         * <!-- FishyJoes.export(fifthThing) -->
         */
        static readonly fifthThing: (_: string, _: number, _: number, _: string, _: () => number) => () => number;

        /**
         * <!-- FishyJoes.export(sixthThing) -->
         */
        static readonly sixthThing: (_: string, _: number, _: number, _: string, _: () => number, _: number) => number;

        /**
         * <!-- FishyJoes.export(exercise0) -->
         */
        static exercise0(
            fn: () => number
        ): string;

        /**
         * <!-- FishyJoes.export(exercise1) -->
         */
        static exercise1(
            fn: (_: number) => number
        ): string;

        /**
         * <!-- FishyJoes.export(exercise2) -->
         */
        static exercise2(
            fn: (_: (_: number) => number, _: (_: number) => number) => (_: number) => number
        ): string;

        /**
         * <!-- FishyJoes.export(exercise3) -->
         */
        static exercise3(
            fn: (_: number, _: number, _: number) => number
        ): string;

        /**
         * <!-- FishyJoes.export(exercise4) -->
         */
        static exercise4(
            fn: (_: string, _: string, _: string, _: string) => string[]
        ): string;

        /**
         * <!-- FishyJoes.export(exercise5) -->
         */
        static exercise5(
            fn: (_: string, _: number, _: number, _: string, _: () => number) => () => number
        ): string;

        /**
         * <!-- FishyJoes.export(exercise6) -->
         */
        static exercise6(
            fn: (_: string, _: number, _: number, _: string, _: () => number, _: number) => number
        ): string;

        /**
         * <!-- FishyJoes.export(willThrow) -->
         */
        static willThrow(
        ): string;
    }
    export namespace Functions {
        /**
         * <!-- FishyJoes.exportReference(Functions.TheError) -->
         */
        export class TheError {
            private constructor()
            private _inhibitStructuralTyping: any
        }
    }

    /**
     * <!-- FishyJoes.exportReference(Primitives) -->
     */
    export class Primitives {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * <!-- FishyJoes.export(falseBool) -->
         */
        static readonly falseBool: boolean;

        /**
         * <!-- FishyJoes.export(trueBool) -->
         */
        static readonly trueBool: boolean;

        /**
         * <!-- FishyJoes.export(zeroUInt8) -->
         */
        static readonly zeroUInt8: number;

        /**
         * <!-- FishyJoes.export(minUInt8) -->
         */
        static readonly minUInt8: number;

        /**
         * <!-- FishyJoes.export(maxUInt8) -->
         */
        static readonly maxUInt8: number;

        /**
         * <!-- FishyJoes.export(zeroUInt16) -->
         */
        static readonly zeroUInt16: number;

        /**
         * <!-- FishyJoes.export(minUInt16) -->
         */
        static readonly minUInt16: number;

        /**
         * <!-- FishyJoes.export(maxUInt16) -->
         */
        static readonly maxUInt16: number;

        /**
         * <!-- FishyJoes.export(zeroUInt32) -->
         */
        static readonly zeroUInt32: number;

        /**
         * <!-- FishyJoes.export(minUInt32) -->
         */
        static readonly minUInt32: number;

        /**
         * <!-- FishyJoes.export(maxUInt32) -->
         */
        static readonly maxUInt32: number;

        /**
         * <!-- FishyJoes.export(zeroUInt64) -->
         */
        static readonly zeroUInt64: bigint;

        /**
         * <!-- FishyJoes.export(minUInt64) -->
         */
        static readonly minUInt64: bigint;

        /**
         * <!-- FishyJoes.export(maxUInt64) -->
         */
        static readonly maxUInt64: bigint;

        /**
         * <!-- FishyJoes.export(zeroInt8) -->
         */
        static readonly zeroInt8: number;

        /**
         * <!-- FishyJoes.export(minInt8) -->
         */
        static readonly minInt8: number;

        /**
         * <!-- FishyJoes.export(maxInt8) -->
         */
        static readonly maxInt8: number;

        /**
         * <!-- FishyJoes.export(zeroInt16) -->
         */
        static readonly zeroInt16: number;

        /**
         * <!-- FishyJoes.export(minInt16) -->
         */
        static readonly minInt16: number;

        /**
         * <!-- FishyJoes.export(maxInt16) -->
         */
        static readonly maxInt16: number;

        /**
         * <!-- FishyJoes.export(zeroInt32) -->
         */
        static readonly zeroInt32: number;

        /**
         * <!-- FishyJoes.export(minInt32) -->
         */
        static readonly minInt32: number;

        /**
         * <!-- FishyJoes.export(maxInt32) -->
         */
        static readonly maxInt32: number;

        /**
         * <!-- FishyJoes.export(zeroInt64) -->
         */
        static readonly zeroInt64: bigint;

        /**
         * <!-- FishyJoes.export(minInt64) -->
         */
        static readonly minInt64: bigint;

        /**
         * <!-- FishyJoes.export(maxInt64) -->
         */
        static readonly maxInt64: bigint;

        /**
         * <!-- FishyJoes.export(zeroInt) -->
         */
        static readonly zeroInt: number;

        /**
         * <!-- FishyJoes.export(minInt) -->
         */
        static readonly minInt: number;

        /**
         * <!-- FishyJoes.export(maxInt) -->
         */
        static readonly maxInt: number;

        /**
         * <!-- FishyJoes.export(zeroFloat) -->
         */
        static readonly zeroFloat: number;

        /**
         * <!-- FishyJoes.export(minFloat) -->
         */
        static readonly minFloat: number;

        /**
         * <!-- FishyJoes.export(maxFloat) -->
         */
        static readonly maxFloat: number;

        /**
         * <!-- FishyJoes.export(zeroDouble) -->
         */
        static readonly zeroDouble: number;

        /**
         * <!-- FishyJoes.export(minDouble) -->
         */
        static readonly minDouble: number;

        /**
         * <!-- FishyJoes.export(maxDouble) -->
         */
        static readonly maxDouble: number;

        /**
         * <!-- FishyJoes.export(manyBool) -->
         */
        static readonly manyBool: boolean[];

        /**
         * <!-- FishyJoes.export(manyUInt8) -->
         */
        static readonly manyUInt8: number[];

        /**
         * <!-- FishyJoes.export(manyUInt16) -->
         */
        static readonly manyUInt16: number[];

        /**
         * <!-- FishyJoes.export(manyUInt32) -->
         */
        static readonly manyUInt32: number[];

        /**
         * <!-- FishyJoes.export(manyUInt64) -->
         */
        static readonly manyUInt64: bigint[];

        /**
         * <!-- FishyJoes.export(manyInt8) -->
         */
        static readonly manyInt8: number[];

        /**
         * <!-- FishyJoes.export(manyInt16) -->
         */
        static readonly manyInt16: number[];

        /**
         * <!-- FishyJoes.export(manyInt32) -->
         */
        static readonly manyInt32: number[];

        /**
         * <!-- FishyJoes.export(manyInt64) -->
         */
        static readonly manyInt64: bigint[];

        /**
         * <!-- FishyJoes.export(manyFloat) -->
         */
        static readonly manyFloat: number[];

        /**
         * <!-- FishyJoes.export(manyDouble) -->
         */
        static readonly manyDouble: number[];

        /**
         * <!-- FishyJoes.export(manyMaybeBool) -->
         */
        static readonly manyMaybeBool: boolean[];

        /**
         * <!-- FishyJoes.export(manyMaybeUInt8) -->
         */
        static readonly manyMaybeUInt8: number[];

        /**
         * <!-- FishyJoes.export(manyMaybeUInt16) -->
         */
        static readonly manyMaybeUInt16: number[];

        /**
         * <!-- FishyJoes.export(manyMaybeUInt32) -->
         */
        static readonly manyMaybeUInt32: number[];

        /**
         * <!-- FishyJoes.export(manyMaybeUInt64) -->
         */
        static readonly manyMaybeUInt64: bigint[];

        /**
         * <!-- FishyJoes.export(manyMaybeInt8) -->
         */
        static readonly manyMaybeInt8: number[];

        /**
         * <!-- FishyJoes.export(manyMaybeInt16) -->
         */
        static readonly manyMaybeInt16: number[];

        /**
         * <!-- FishyJoes.export(manyMaybeInt32) -->
         */
        static readonly manyMaybeInt32: number[];

        /**
         * <!-- FishyJoes.export(manyMaybeInt64) -->
         */
        static readonly manyMaybeInt64: bigint[];

        /**
         * <!-- FishyJoes.export(manyMaybeFloat) -->
         */
        static readonly manyMaybeFloat: number[];

        /**
         * <!-- FishyJoes.export(manyMaybeDouble) -->
         */
        static readonly manyMaybeDouble: number[];

        /**
         * <!-- FishyJoes.export(defaultPrimitiveHolder) -->
         */
        static readonly defaultPrimitiveHolder: Primitives.PrimitiveHolder;

        /**
         * <!-- FishyJoes.export(echoBool) -->
         */
        static echoBool(
            value: boolean
        ): boolean;

        /**
         * <!-- FishyJoes.export(echoUInt8) -->
         */
        static echoUInt8(
            value: number
        ): number;

        /**
         * <!-- FishyJoes.export(echoUInt16) -->
         */
        static echoUInt16(
            value: number
        ): number;

        /**
         * <!-- FishyJoes.export(echoUInt32) -->
         */
        static echoUInt32(
            value: number
        ): number;

        /**
         * <!-- FishyJoes.export(echoUInt64) -->
         */
        static echoUInt64(
            value: bigint
        ): bigint;

        /**
         * <!-- FishyJoes.export(echoInt8) -->
         */
        static echoInt8(
            value: number
        ): number;

        /**
         * <!-- FishyJoes.export(echoInt16) -->
         */
        static echoInt16(
            value: number
        ): number;

        /**
         * <!-- FishyJoes.export(echoInt32) -->
         */
        static echoInt32(
            value: number
        ): number;

        /**
         * <!-- FishyJoes.export(echoInt64) -->
         */
        static echoInt64(
            value: bigint
        ): bigint;

        /**
         * <!-- FishyJoes.export(echoFloat) -->
         */
        static echoFloat(
            value: number
        ): number;

        /**
         * <!-- FishyJoes.export(echoDouble) -->
         */
        static echoDouble(
            value: number
        ): number;

        /**
         * <!-- FishyJoes.export(maybeEchoBool) -->
         */
        static maybeEchoBool(
            value: Optional<boolean>
        ): Optional<boolean>;

        /**
         * <!-- FishyJoes.export(maybeEchoUInt8) -->
         */
        static maybeEchoUInt8(
            value: Optional<number>
        ): Optional<number>;

        /**
         * <!-- FishyJoes.export(maybeEchoUInt16) -->
         */
        static maybeEchoUInt16(
            value: Optional<number>
        ): Optional<number>;

        /**
         * <!-- FishyJoes.export(maybeEchoUInt32) -->
         */
        static maybeEchoUInt32(
            value: Optional<number>
        ): Optional<number>;

        /**
         * <!-- FishyJoes.export(maybeEchoUInt64) -->
         */
        static maybeEchoUInt64(
            value: Optional<bigint>
        ): Optional<bigint>;

        /**
         * <!-- FishyJoes.export(maybeEchoInt8) -->
         */
        static maybeEchoInt8(
            value: Optional<number>
        ): Optional<number>;

        /**
         * <!-- FishyJoes.export(maybeEchoInt16) -->
         */
        static maybeEchoInt16(
            value: Optional<number>
        ): Optional<number>;

        /**
         * <!-- FishyJoes.export(maybeEchoInt32) -->
         */
        static maybeEchoInt32(
            value: Optional<number>
        ): Optional<number>;

        /**
         * <!-- FishyJoes.export(maybeEchoInt64) -->
         */
        static maybeEchoInt64(
            value: Optional<bigint>
        ): Optional<bigint>;

        /**
         * <!-- FishyJoes.export(maybeEchoFloat) -->
         */
        static maybeEchoFloat(
            value: Optional<number>
        ): Optional<number>;

        /**
         * <!-- FishyJoes.export(maybeEchoDouble) -->
         */
        static maybeEchoDouble(
            value: Optional<number>
        ): Optional<number>;

        /**
         * <!-- FishyJoes.export(valueMapper) -->
         */
        static valueMapper(
            value: Optional<number>,
            mapper: (_: number) => number
        ): Optional<number>;
    }
    export namespace Primitives {
        /**
         * <!-- FishyJoes.export(Primitives.PrimitiveHolder) -->
         */
        export class PrimitiveHolder {
            constructor(b: boolean, bq: Optional<boolean>, ui8: number, ui8q: Optional<number>, ui16: number, ui16q: Optional<number>, ui32: number, ui32q: Optional<number>, ui64: bigint, ui64q: Optional<bigint>, i8: number, i8q: Optional<number>, i16: number, i16q: Optional<number>, i32: number, i32q: Optional<number>, i64: bigint, i64q: Optional<bigint>, f: number, fq: Optional<number>, d: number, dq: Optional<number>)

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

            i8: number;

            i8q?: number;

            i16: number;

            i16q?: number;

            i32: number;

            i32q?: number;

            i64: bigint;

            i64q?: bigint;

            f: number;

            fq?: number;

            d: number;

            dq?: number;

            /**
             * <!-- FishyJoes.export(staticPropery) -->
             */
            static readonly staticPropery: number[];

            /**
             * <!-- FishyJoes.export(staticMutablePropery) -->
             */
            static staticMutablePropery: number[];
        }
    }

    /**
     * <!-- FishyJoes.exportReference(Strings) -->
     */
    export class Strings {
        private constructor()
        private _inhibitStructuralTyping: any

        /**
         * <!-- FishyJoes.export(simple) -->
         */
        static readonly simple: string;

        /**
         * <!-- FishyJoes.export(accent) -->
         */
        static readonly accent: string;

        /**
         * <!-- FishyJoes.export(script) -->
         */
        static readonly script: string;

        /**
         * <!-- FishyJoes.export(chinese) -->
         */
        static readonly chinese: string;

        /**
         * <!-- FishyJoes.export(chineseBMP) -->
         */
        static readonly chineseBMP: string;

        /**
         * <!-- FishyJoes.export(chineseSIP) -->
         */
        static readonly chineseSIP: string;

        /**
         * <!-- FishyJoes.export(emoji) -->
         */
        static readonly emoji: string;

        /**
         * <!-- FishyJoes.export(emojiMulti) -->
         */
        static readonly emojiMulti: string;

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        static echo(
            string: string
        ): string;
    }

    /**
     * <!-- FishyJoes.exportReference(Structs) -->
     */
    export class Structs {
        private constructor()
        private _inhibitStructuralTyping: any
    }
    export namespace Structs {
        /**
         * <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
         */
        export class MemberwiseStruct {
            constructor(immutable: string, mutable: string)

            immutable: string;

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
            immutable: string;

            /**
             * <!-- FishyJoes.export(mutable) -->
             */
            mutable: string;

            /**
             * <!-- FishyJoes.export(create) -->
             */
            static create(
            ): Structs.ReferenceStruct;
        }
    }

    export type AssociatedDataEnum = AssociatedDataEnum.Thing | AssociatedDataEnum.Other | AssociatedDataEnum.Bar;
    export type EmptyEnum = never;
    export type SimpleEnum = "red" | "green" | "blue";
    export type Tuples = never;

    export namespace AssociatedDataEnum {
        class _FictionalCommonSuperclass {
            constructor()

            /**
             * <!-- FishyJoes.export(intValue) -->
             */
            readonly intValue: number;

            /**
             * <!-- FishyJoes.export(plus) -->
             */
            plus(
                other: AssociatedDataEnum
            ): AssociatedDataEnum;
        }

        export class Thing extends _FictionalCommonSuperclass {
            constructor(value: number)

            readonly value: number;
        }

        export class Other extends _FictionalCommonSuperclass {
            constructor(unnamed: string, _1: number)

            readonly unnamed: string;

            readonly _1: number;
        }

        export class Bar extends _FictionalCommonSuperclass {
            constructor(named: string, _1: AssociatedDataEnum)

            readonly named: string;

            readonly _1: AssociatedDataEnum;
        }
    }

    export namespace EmptyEnum {
        class _FictionalCommonSuperclass {
            constructor()

            /**
             * <!-- FishyJoes.export(notGoingToHappen, noReturn: true) -->
             */
            static notGoingToHappen(
            ): EmptyEnum;
        }
    }

    export namespace Tuples {
        class _FictionalCommonSuperclass {
            constructor()

            /**
             * <!-- FishyJoes.export(tuple2) -->
             */
            static readonly tuple2: [number, string];

            /**
             * <!-- FishyJoes.export(tuple3) -->
             */
            static readonly tuple3: [string, number, string];

            /**
             * <!-- FishyJoes.export(tuple4) -->
             */
            static readonly tuple4: [[number, string], [string, number, string], string, boolean];

            /**
             * <!-- FishyJoes.export(tuple5) -->
             */
            static readonly tuple5: [string, number, [[number, string], [string, number, string], string, boolean], [string, number, string], [number, string]];

            /**
             * <!-- FishyJoes.export(tuple6) -->
             */
            static readonly tuple6: [string, number, number, [[number, string], [string, number, string], string, boolean], [string, number, [[number, string], [string, number, string], string, boolean], [string, number, string], [number, string]], boolean];

            /**
             * <!-- FishyJoes.export(checkTuples) -->
             */
            static checkTuples(
                t2: [number, string],
                t3: [string, number, string],
                t4: [[number, string], [string, number, string], string, boolean],
                t5: [string, number, [[number, string], [string, number, string], string, boolean], [string, number, string], [number, string]],
                t6: [string, number, number, [[number, string], [string, number, string], string, boolean], [string, number, [[number, string], [string, number, string], string, boolean], [string, number, string], [number, string]], boolean]
            ): boolean;
        }
    }
}

export declare function init(): Promise<{
    TestAPI: typeof TestAPI,
}>;
export default TestAPI;
