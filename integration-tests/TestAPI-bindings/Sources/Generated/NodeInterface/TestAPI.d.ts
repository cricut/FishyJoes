export declare namespace TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Bytes) -->
     */
    export class Bytes {
        private constructor()

        /**
         * <!-- FishyJoes.export(bytes) -->
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
         * <!-- FishyJoes.export(maybeDictionaryOfMaybeIntToMaybeInt) -->
         */
        static readonly maybeDictionaryOfMaybeIntToMaybeInt?: Map<number, number>;

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
         * <!-- FishyJoes.export(echoMaybeDictionaryOfMaybeIntToMaybeInt) -->
         */
        static echoMaybeDictionaryOfMaybeIntToMaybeInt(
            maybeDictionaryOfMaybeIntToMaybeInt: Optional<Map<number, number>>
        ): Optional<Map<number, number>>;
    }

    /**
     * <!-- FishyJoes.exportReference(ExportedByReference) -->
     */
    export class ExportedByReference {
        private constructor()

        /**
         * <!-- FishyJoes.export(text) -->
         */
        text: string;

        /**
         * <!-- FishyJoes.export(create) -->
         */
        static create(
        ): ExportedByReference;
    }

    /**
     * <!-- FishyJoes.exportReference(Primitives) -->
     */
    export class Primitives {
        private constructor()

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

    export type Optional<T> = T | undefined;
}

export declare function init(): Promise<typeof TestAPI>;
export default TestAPI;
