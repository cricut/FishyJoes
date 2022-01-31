export declare namespace TestAPI {
    /**
     * <!-- FishyJoes.export(AProtocolImplementation) -->
     */
    export class AProtocolImplementation {
        constructor(foo: string)

        foo: string;

        /**
         * <!-- FishyJoes.export(bar) -->
         */
        bar(
            x: number,
            y: number
        ): AProtocol;
    }

    export type Optional<T> = T | undefined;
    export type Bytes = ;
    export type Collections = ;
    export type Primitives = ;
    export type Strings = ;
    export type Structs = ;

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
}

export declare function init(): Promise<typeof TestAPI>;
export default TestAPI;
