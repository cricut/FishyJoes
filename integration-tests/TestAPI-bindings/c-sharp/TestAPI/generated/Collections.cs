using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Collections) -->
     */
    public class Collections : SwiftReference {
        internal Collections(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(arrayOfInt) -->
         */
        public static nint[] arrayOfInt {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<nint[]>(__cs_get_Collections_arrayOfInt(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_arrayOfInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(setOfInt) -->
         */
        public static System.Collections.Generic.HashSet<nint> setOfInt {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Collections.Generic.HashSet<nint>>(__cs_get_Collections_setOfInt(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_setOfInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(dictionaryOfIntToInt) -->
         */
        public static System.Collections.Generic.Dictionary<nint, nint> dictionaryOfIntToInt {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Collections.Generic.Dictionary<nint, nint>>(__cs_get_Collections_dictionaryOfIntToInt(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_dictionaryOfIntToInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maybeArrayOfInt) -->
         */
        public static nint[]? maybeArrayOfInt {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<nint[]?>(__cs_get_Collections_maybeArrayOfInt(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_maybeArrayOfInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maybeSetOfInt) -->
         */
        public static System.Collections.Generic.HashSet<nint>? maybeSetOfInt {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Collections.Generic.HashSet<nint>?>(__cs_get_Collections_maybeSetOfInt(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_maybeSetOfInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
         */
        public static System.Collections.Generic.Dictionary<nint, nint>? maybeDictionaryOfIntToInt {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Collections.Generic.Dictionary<nint, nint>?>(__cs_get_Collections_maybeDictionaryOfIntToInt(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_maybeDictionaryOfIntToInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
         */
        public static nint?[]? maybeArrayOfMaybeInt {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<nint?[]?>(__cs_get_Collections_maybeArrayOfMaybeInt(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_maybeArrayOfMaybeInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
         */
        public static System.Collections.Generic.HashSet<nint?>? maybeSetOfMaybeInt {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Collections.Generic.HashSet<nint?>?>(__cs_get_Collections_maybeSetOfMaybeInt(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_maybeSetOfMaybeInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
         */
        public static System.Collections.Generic.Dictionary<nint, nint?>? maybeDictionaryOfIntToMaybeInt {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<System.Collections.Generic.Dictionary<nint, nint?>?>(__cs_get_Collections_maybeDictionaryOfIntToMaybeInt(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_maybeDictionaryOfIntToMaybeInt(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(defaultCollectionHolder) -->
         */
        public static Cricut.TestAPI.Collections.CollectionHolder defaultCollectionHolder {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<Cricut.TestAPI.Collections.CollectionHolder>(__cs_get_Collections_defaultCollectionHolder(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Collections_defaultCollectionHolder(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(echoArrayOfInt) -->
         */
        public static nint[] echoArrayOfInt(
            nint[] arrayOfInt
        ) {
            using var _arrayOfIntHandle = new GCRef(arrayOfInt);
            return ConsumeHandle<nint[]>(
                Check((out IntPtr _exn) => __cs_Collections_echoArrayOfInt(_arrayOfIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Collections_echoArrayOfInt(
            IntPtr arrayOfInt,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoSetOfInt) -->
         */
        public static System.Collections.Generic.HashSet<nint> echoSetOfInt(
            System.Collections.Generic.HashSet<nint> setOfInt
        ) {
            using var _setOfIntHandle = new GCRef(setOfInt);
            return ConsumeHandle<System.Collections.Generic.HashSet<nint>>(
                Check((out IntPtr _exn) => __cs_Collections_echoSetOfInt(_setOfIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Collections_echoSetOfInt(
            IntPtr setOfInt,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
         */
        public static System.Collections.Generic.Dictionary<nint, nint> echoDictionaryOfIntToInt(
            System.Collections.Generic.Dictionary<nint, nint> dictionaryOfIntToInt
        ) {
            using var _dictionaryOfIntToIntHandle = new GCRef(dictionaryOfIntToInt);
            return ConsumeHandle<System.Collections.Generic.Dictionary<nint, nint>>(
                Check((out IntPtr _exn) => __cs_Collections_echoDictionaryOfIntToInt(_dictionaryOfIntToIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Collections_echoDictionaryOfIntToInt(
            IntPtr dictionaryOfIntToInt,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
         */
        public static nint?[]? echoMaybeArrayOfMaybeInt(
            nint?[]? maybeArrayOfMaybeInt
        ) {
            using var _maybeArrayOfMaybeIntHandle = new GCRef(maybeArrayOfMaybeInt);
            return ConsumeHandle<nint?[]?>(
                Check((out IntPtr _exn) => __cs_Collections_echoMaybeArrayOfMaybeInt(_maybeArrayOfMaybeIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Collections_echoMaybeArrayOfMaybeInt(
            IntPtr maybeArrayOfMaybeInt,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
         */
        public static System.Collections.Generic.HashSet<nint?>? echoMaybeSetOfMaybeInt(
            System.Collections.Generic.HashSet<nint?>? maybeSetOfMaybeInt
        ) {
            using var _maybeSetOfMaybeIntHandle = new GCRef(maybeSetOfMaybeInt);
            return ConsumeHandle<System.Collections.Generic.HashSet<nint?>?>(
                Check((out IntPtr _exn) => __cs_Collections_echoMaybeSetOfMaybeInt(_maybeSetOfMaybeIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Collections_echoMaybeSetOfMaybeInt(
            IntPtr maybeSetOfMaybeInt,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
         */
        public static System.Collections.Generic.Dictionary<nint, nint?>? echoMaybeDictionaryOfIntToMaybeInt(
            System.Collections.Generic.Dictionary<nint, nint?>? maybeDictionaryOfIntToMaybeInt
        ) {
            using var _maybeDictionaryOfIntToMaybeIntHandle = new GCRef(maybeDictionaryOfIntToMaybeInt);
            return ConsumeHandle<System.Collections.Generic.Dictionary<nint, nint?>?>(
                Check((out IntPtr _exn) => __cs_Collections_echoMaybeDictionaryOfIntToMaybeInt(_maybeDictionaryOfIntToMaybeIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Collections_echoMaybeDictionaryOfIntToMaybeInt(
            IntPtr maybeDictionaryOfIntToMaybeInt,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(Collections.CollectionHolder) -->
         */
        public struct CollectionHolder {
            public bool[] boolArray;
            public System.Collections.Generic.HashSet<bool> boolSet;
            public System.Collections.Generic.Dictionary<bool, bool> boolDictionary;
            public nint[] integerArray;
            public System.Collections.Generic.HashSet<nint> integerSet;
            public System.Collections.Generic.Dictionary<nint, nint> integerDictionary;
            public string[] stringArray;
            public System.Collections.Generic.HashSet<string> stringSet;
            public System.Collections.Generic.Dictionary<string, string> stringDictionary;

            public CollectionHolder(
                bool[] boolArray,
                System.Collections.Generic.HashSet<bool> boolSet,
                System.Collections.Generic.Dictionary<bool, bool> boolDictionary,
                nint[] integerArray,
                System.Collections.Generic.HashSet<nint> integerSet,
                System.Collections.Generic.Dictionary<nint, nint> integerDictionary,
                string[] stringArray,
                System.Collections.Generic.HashSet<string> stringSet,
                System.Collections.Generic.Dictionary<string, string> stringDictionary
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
            public static nint?[] staticPropery {
                get => Check((out IntPtr exn) => {
                    return ConsumeHandle<nint?[]>(__cs_get_Collections_CollectionHolder_staticPropery(out exn));
                });
            }

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern IntPtr __cs_get_Collections_CollectionHolder_staticPropery(out IntPtr exn);

            /**
             * <!-- FishyJoes.export(staticMutablePropery) -->
             */
            public static nint?[] staticMutablePropery {
                get => Check((out IntPtr exn) => {
                    return ConsumeHandle<nint?[]>(__cs_get_Collections_CollectionHolder_staticMutablePropery(out exn));
                });
                set {
                    Check((out IntPtr exn) => {
                        using var valueHandle = new GCRef(value);
                        __cs_set_Collections_CollectionHolder_staticMutablePropery(valueHandle.ptr, out exn);
                    });
                }
            }

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern IntPtr __cs_get_Collections_CollectionHolder_staticMutablePropery(out IntPtr exn);

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern void __cs_set_Collections_CollectionHolder_staticMutablePropery(IntPtr value, out IntPtr exn);

            static CollectionHolder() { _TypeSetup._ensureLoaded(); }
        }
        static Collections() { _TypeSetup._ensureLoaded(); }
    }
}
