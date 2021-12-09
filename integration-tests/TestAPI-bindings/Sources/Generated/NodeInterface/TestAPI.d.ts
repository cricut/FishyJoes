export declare namespace TestAPI {
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

    export type Optional<T> = T | undefined;
}

export declare function init(): Promise<typeof TestAPI>;
export default TestAPI;
