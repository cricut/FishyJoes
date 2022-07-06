using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using Cricut.FishyJoesRuntime;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Collections) -->
     */
    public class Collections : SwiftReference {
        Collections(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(arrayOfInt) -->
         */
        public nint[] arrayOfInt {
            get => Check((out Exception? exn) => __cs_get_Collections_arrayOfInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern nint[] __cs_get_Collections_arrayOfInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(setOfInt) -->
         */
        public System.Collections.Generic.HashSet<nint> setOfInt {
            get => Check((out Exception? exn) => __cs_get_Collections_setOfInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern System.Collections.Generic.HashSet<nint> __cs_get_Collections_setOfInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(dictionaryOfIntToInt) -->
         */
        public System.Collections.Generic.Dictionary<nint, nint> dictionaryOfIntToInt {
            get => Check((out Exception? exn) => __cs_get_Collections_dictionaryOfIntToInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern System.Collections.Generic.Dictionary<nint, nint> __cs_get_Collections_dictionaryOfIntToInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maybeArrayOfInt) -->
         */
        public nint[]? maybeArrayOfInt {
            get => Check((out Exception? exn) => __cs_get_Collections_maybeArrayOfInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern nint[]? __cs_get_Collections_maybeArrayOfInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maybeSetOfInt) -->
         */
        public HashSet<nint>? maybeSetOfInt {
            get => Check((out Exception? exn) => __cs_get_Collections_maybeSetOfInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern HashSet<nint>? __cs_get_Collections_maybeSetOfInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
         */
        public Dictionary<nint, nint>? maybeDictionaryOfIntToInt {
            get => Check((out Exception? exn) => __cs_get_Collections_maybeDictionaryOfIntToInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern Dictionary<nint, nint>? __cs_get_Collections_maybeDictionaryOfIntToInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
         */
        public nint?[]? maybeArrayOfMaybeInt {
            get => Check((out Exception? exn) => __cs_get_Collections_maybeArrayOfMaybeInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern nint?[]? __cs_get_Collections_maybeArrayOfMaybeInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
         */
        public HashSet<nint?>? maybeSetOfMaybeInt {
            get => Check((out Exception? exn) => __cs_get_Collections_maybeSetOfMaybeInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern HashSet<nint?>? __cs_get_Collections_maybeSetOfMaybeInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
         */
        public Dictionary<nint, nint?>? maybeDictionaryOfIntToMaybeInt {
            get => Check((out Exception? exn) => __cs_get_Collections_maybeDictionaryOfIntToMaybeInt(out exn));
        }

        [DllImport("TestAPI")]
        private static extern Dictionary<nint, nint?>? __cs_get_Collections_maybeDictionaryOfIntToMaybeInt(out Exception? exn);

        /**
         * <!-- FishyJoes.export(defaultCollectionHolder) -->
         */
        public Cricut.TestAPI.Collections.CollectionHolder defaultCollectionHolder {
            get => Check((out Exception? exn) => __cs_get_Collections_defaultCollectionHolder(out exn));
        }

        [DllImport("TestAPI")]
        private static extern Cricut.TestAPI.Collections.CollectionHolder __cs_get_Collections_defaultCollectionHolder(out Exception? exn);

        /**
         * <!-- FishyJoes.export(echoArrayOfInt) -->
         */
        public nint[] echoArrayOfInt(
            nint[] arrayOfInt
        ) => Check((out Exception? exn) => __cs_Collections_echoArrayOfInt(arrayOfInt, out exn));
        [DllImport("TestAPI")]
        static extern nint[] __cs_Collections_echoArrayOfInt(
            nint[] arrayOfInt,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoSetOfInt) -->
         */
        public System.Collections.Generic.HashSet<nint> echoSetOfInt(
            System.Collections.Generic.HashSet<nint> setOfInt
        ) => Check((out Exception? exn) => __cs_Collections_echoSetOfInt(setOfInt, out exn));
        [DllImport("TestAPI")]
        static extern System.Collections.Generic.HashSet<nint> __cs_Collections_echoSetOfInt(
            System.Collections.Generic.HashSet<nint> setOfInt,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
         */
        public System.Collections.Generic.Dictionary<nint, nint> echoDictionaryOfIntToInt(
            System.Collections.Generic.Dictionary<nint, nint> dictionaryOfIntToInt
        ) => Check((out Exception? exn) => __cs_Collections_echoDictionaryOfIntToInt(dictionaryOfIntToInt, out exn));
        [DllImport("TestAPI")]
        static extern System.Collections.Generic.Dictionary<nint, nint> __cs_Collections_echoDictionaryOfIntToInt(
            System.Collections.Generic.Dictionary<nint, nint> dictionaryOfIntToInt,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
         */
        public nint?[]? echoMaybeArrayOfMaybeInt(
            nint?[]? maybeArrayOfMaybeInt
        ) => Check((out Exception? exn) => __cs_Collections_echoMaybeArrayOfMaybeInt(maybeArrayOfMaybeInt, out exn));
        [DllImport("TestAPI")]
        static extern nint?[]? __cs_Collections_echoMaybeArrayOfMaybeInt(
            nint?[]? maybeArrayOfMaybeInt,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
         */
        public HashSet<nint?>? echoMaybeSetOfMaybeInt(
            HashSet<nint?>? maybeSetOfMaybeInt
        ) => Check((out Exception? exn) => __cs_Collections_echoMaybeSetOfMaybeInt(maybeSetOfMaybeInt, out exn));
        [DllImport("TestAPI")]
        static extern HashSet<nint?>? __cs_Collections_echoMaybeSetOfMaybeInt(
            HashSet<nint?>? maybeSetOfMaybeInt,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
         */
        public Dictionary<nint, nint?>? echoMaybeDictionaryOfIntToMaybeInt(
            Dictionary<nint, nint?>? maybeDictionaryOfIntToMaybeInt
        ) => Check((out Exception? exn) => __cs_Collections_echoMaybeDictionaryOfIntToMaybeInt(maybeDictionaryOfIntToMaybeInt, out exn));
        [DllImport("TestAPI")]
        static extern Dictionary<nint, nint?>? __cs_Collections_echoMaybeDictionaryOfIntToMaybeInt(
            Dictionary<nint, nint?>? maybeDictionaryOfIntToMaybeInt,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(Collections.CollectionHolder) -->
         */
        public class CollectionHolder {
            bool[] boolArray;
            System.Collections.Generic.HashSet<bool> boolSet;
            System.Collections.Generic.Dictionary<bool, bool> boolDictionary;
            nint[] integerArray;
            System.Collections.Generic.HashSet<nint> integerSet;
            System.Collections.Generic.Dictionary<nint, nint> integerDictionary;
            String[] stringArray;
            System.Collections.Generic.HashSet<String> stringSet;
            System.Collections.Generic.Dictionary<String, String> stringDictionary;

            CollectionHolder(
                bool[] boolArray,
                System.Collections.Generic.HashSet<bool> boolSet,
                System.Collections.Generic.Dictionary<bool, bool> boolDictionary,
                nint[] integerArray,
                System.Collections.Generic.HashSet<nint> integerSet,
                System.Collections.Generic.Dictionary<nint, nint> integerDictionary,
                String[] stringArray,
                System.Collections.Generic.HashSet<String> stringSet,
                System.Collections.Generic.Dictionary<String, String> stringDictionary
            ) {
                this.boolArray = boolArray;
                this.boolSet = boolSet;
                this.boolDictionary = boolDictionary;
                this.integerArray = integerArray;
                this.integerSet = integerSet;
                this.integerDictionary = integerDictionary;
                this.stringArray = stringArray;
                this.stringSet = stringSet;
                this.stringDictionary = stringDictionary;
            }

            /**
             * <!-- FishyJoes.export(staticPropery) -->
             */
            public nint?[] staticPropery {
                get => Check((out Exception? exn) => __cs_get_Collections_CollectionHolder_staticPropery(out exn));
            }

            [DllImport("TestAPI")]
            private static extern nint?[] __cs_get_Collections_CollectionHolder_staticPropery(out Exception? exn);

            /**
             * <!-- FishyJoes.export(staticMutablePropery) -->
             */
            public nint?[] staticMutablePropery {
                get => Check((out Exception? exn) => __cs_get_Collections_CollectionHolder_staticMutablePropery(out exn));
                set { Check((out Exception? exn) => __cs_set_Collections_CollectionHolder_staticMutablePropery(value, out exn)); }
            }

            [DllImport("TestAPI")]
            private static extern nint?[] __cs_get_Collections_CollectionHolder_staticMutablePropery(out Exception? exn);

            [DllImport("TestAPI")]
            private static extern void __cs_set_Collections_CollectionHolder_staticMutablePropery(nint?[] value, out Exception? exn);

            static CollectionHolder() { _TypeSetup._ensureLoaded(); }
        }
        static Collections() { _TypeSetup._ensureLoaded(); }
    }
}
