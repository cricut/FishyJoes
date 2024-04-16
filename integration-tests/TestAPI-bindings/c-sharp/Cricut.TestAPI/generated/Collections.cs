using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Collections) -->
    /// </summary>
    public record Collections {
        private Collections() {}

        /// <summary>
        /// <!-- FishyJoes.export(arrayOfInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint> ArrayOfInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_arrayOfInt(Loader.env, out exn).Consume<System.Collections.Generic.IList<nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_arrayOfInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(setOfInt) -->
        /// </summary>
        public static System.Collections.Generic.ISet<nint> SetOfInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_setOfInt(Loader.env, out exn).Consume<System.Collections.Generic.ISet<nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_setOfInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(dictionaryOfIntToInt) -->
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint> DictionaryOfIntToInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_dictionaryOfIntToInt(Loader.env, out exn).Consume<System.Collections.Generic.IDictionary<nint, nint>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_dictionaryOfIntToInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(arrayOfBigTuples) -->
        /// </summary>
        public static System.Collections.Generic.IList<System.Tuple<sbyte, short, int, long>> ArrayOfBigTuples {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_arrayOfBigTuples(Loader.env, out exn).Consume<System.Collections.Generic.IList<System.Tuple<sbyte, short, int, long>>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_arrayOfBigTuples(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeArrayOfInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint>? MaybeArrayOfInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_maybeArrayOfInt(Loader.env, out exn).Consume<System.Collections.Generic.IList<nint>?>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_maybeArrayOfInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeSetOfInt) -->
        /// </summary>
        public static System.Collections.Generic.ISet<nint>? MaybeSetOfInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_maybeSetOfInt(Loader.env, out exn).Consume<System.Collections.Generic.ISet<nint>?>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_maybeSetOfInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint>? MaybeDictionaryOfIntToInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt(Loader.env, out exn).Consume<System.Collections.Generic.IDictionary<nint, nint>?>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_maybeDictionaryOfIntToInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint?>? MaybeArrayOfMaybeInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_maybeArrayOfMaybeInt(Loader.env, out exn).Consume<System.Collections.Generic.IList<nint?>?>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_maybeArrayOfMaybeInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.ISet<nint?>? MaybeSetOfMaybeInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_maybeSetOfMaybeInt(Loader.env, out exn).Consume<System.Collections.Generic.ISet<nint?>?>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_maybeSetOfMaybeInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint?>? MaybeDictionaryOfIntToMaybeInt {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt(Loader.env, out exn).Consume<System.Collections.Generic.IDictionary<nint, nint?>?>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_maybeDictionaryOfIntToMaybeInt(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(defaultCollectionHolder) -->
        /// </summary>
        public static Cricut.TestAPI.Collections.CollectionHolder DefaultCollectionHolder {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Collections_defaultCollectionHolder(Loader.env, out exn).Consume<Cricut.TestAPI.Collections.CollectionHolder>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Collections_defaultCollectionHolder(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoArrayOfInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint> EchoArrayOfInt(
            System.Collections.Generic.IList<nint> arrayOfInt
        ) {
            using var _arrayOfIntHandle = new GCRef(arrayOfInt);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Collections_echoArrayOfInt(Loader.env, _arrayOfIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Collections_echoArrayOfInt(
            IntPtr envRef,
            UnownedRef arrayOfInt,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoSetOfInt) -->
        /// </summary>
        public static System.Collections.Generic.ISet<nint> EchoSetOfInt(
            System.Collections.Generic.ISet<nint> setOfInt
        ) {
            using var _setOfIntHandle = new GCRef(setOfInt);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Collections_echoSetOfInt(Loader.env, _setOfIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.ISet<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Collections_echoSetOfInt(
            IntPtr envRef,
            UnownedRef setOfInt,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoDictionaryOfIntToInt) -->
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint> EchoDictionaryOfIntToInt(
            System.Collections.Generic.IDictionary<nint, nint> dictionaryOfIntToInt
        ) {
            using var _dictionaryOfIntToIntHandle = new GCRef(dictionaryOfIntToInt);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Collections_echoDictionaryOfIntToInt(Loader.env, _dictionaryOfIntToIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.IDictionary<nint, nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Collections_echoDictionaryOfIntToInt(
            IntPtr envRef,
            UnownedRef dictionaryOfIntToInt,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint?>? EchoMaybeArrayOfMaybeInt(
            System.Collections.Generic.IList<nint?>? maybeArrayOfMaybeInt
        ) {
            using var _maybeArrayOfMaybeIntHandle = new GCRef(maybeArrayOfMaybeInt);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt(Loader.env, _maybeArrayOfMaybeIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<nint?>?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Collections_echoMaybeArrayOfMaybeInt(
            IntPtr envRef,
            UnownedRef maybeArrayOfMaybeInt,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoMaybeSetOfMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.ISet<nint?>? EchoMaybeSetOfMaybeInt(
            System.Collections.Generic.ISet<nint?>? maybeSetOfMaybeInt
        ) {
            using var _maybeSetOfMaybeIntHandle = new GCRef(maybeSetOfMaybeInt);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Collections_echoMaybeSetOfMaybeInt(Loader.env, _maybeSetOfMaybeIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.ISet<nint?>?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Collections_echoMaybeSetOfMaybeInt(
            IntPtr envRef,
            UnownedRef maybeSetOfMaybeInt,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint?>? EchoMaybeDictionaryOfIntToMaybeInt(
            System.Collections.Generic.IDictionary<nint, nint?>? maybeDictionaryOfIntToMaybeInt
        ) {
            using var _maybeDictionaryOfIntToMaybeIntHandle = new GCRef(maybeDictionaryOfIntToMaybeInt);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt(Loader.env, _maybeDictionaryOfIntToMaybeIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.IDictionary<nint, nint?>?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Collections_echoMaybeDictionaryOfIntToMaybeInt(
            IntPtr envRef,
            UnownedRef maybeDictionaryOfIntToMaybeInt,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(collectionMapper) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint?>? CollectionMapper(
            System.Collections.Generic.IList<nint?>? collection,
            System.Func<System.Collections.Generic.IList<nint?>?, System.Collections.Generic.IList<nint?>?> mapper
        ) {
            using var _collectionHandle = new GCRef(collection);
            using var _mapperHandle = new GCRef(mapper);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Collections_collectionMapper(Loader.env, _collectionHandle.ptr, _mapperHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<nint?>?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Collections_collectionMapper(
            IntPtr envRef,
            UnownedRef collection,
            UnownedRef mapper,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(Collections.CollectionHolder) -->
        /// </summary>
        public record CollectionHolder {
            public System.Collections.Generic.IList<bool> BoolArray { get; set; }
            public System.Collections.Generic.ISet<bool> BoolSet { get; set; }
            public System.Collections.Generic.IDictionary<bool, bool> BoolDictionary { get; set; }
            public System.Collections.Generic.IList<nint> IntegerArray { get; set; }
            public System.Collections.Generic.ISet<nint> IntegerSet { get; set; }
            public System.Collections.Generic.IDictionary<nint, nint> IntegerDictionary { get; set; }
            public System.Collections.Generic.IList<string> StringArray { get; set; }
            public System.Collections.Generic.ISet<string> StringSet { get; set; }
            public System.Collections.Generic.IDictionary<string, string> StringDictionary { get; set; }

            public CollectionHolder(
                System.Collections.Generic.IList<bool> BoolArray,
                System.Collections.Generic.ISet<bool> BoolSet,
                System.Collections.Generic.IDictionary<bool, bool> BoolDictionary,
                System.Collections.Generic.IList<nint> IntegerArray,
                System.Collections.Generic.ISet<nint> IntegerSet,
                System.Collections.Generic.IDictionary<nint, nint> IntegerDictionary,
                System.Collections.Generic.IList<string> StringArray,
                System.Collections.Generic.ISet<string> StringSet,
                System.Collections.Generic.IDictionary<string, string> StringDictionary
            ) {
                this.BoolArray = BoolArray;
                this.BoolSet = BoolSet;
                this.BoolDictionary = BoolDictionary;
                this.IntegerArray = IntegerArray;
                this.IntegerSet = IntegerSet;
                this.IntegerDictionary = IntegerDictionary;
                this.StringArray = StringArray;
                this.StringSet = StringSet;
                this.StringDictionary = StringDictionary;
            }

            /// <summary>
            /// <!-- FishyJoes.export(staticProperty) -->
            /// </summary>
            public static System.Collections.Generic.IList<nint?> StaticProperty {
                get {
                    return Check((out CreatedRef exn) =>
                        __iota_get_TestAPI_Collections_CollectionHolder_staticProperty(Loader.env, out exn).Consume<System.Collections.Generic.IList<nint?>>()
                    );
                }
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_TestAPI_Collections_CollectionHolder_staticProperty(IntPtr envRef, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(staticMutableProperty) -->
            /// </summary>
            public static System.Collections.Generic.IList<nint?> StaticMutableProperty {
                get {
                    return Check((out CreatedRef exn) =>
                        __iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty(Loader.env, out exn).Consume<System.Collections.Generic.IList<nint?>>()
                    );
                }
                set {
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty(Loader.env, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_TestAPI_Collections_CollectionHolder_staticMutableProperty(IntPtr envRef, out CreatedRef exn);

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __iota_set_TestAPI_Collections_CollectionHolder_staticMutableProperty(IntPtr envRef, UnownedRef value, out CreatedRef exn);

            static CollectionHolder() { _TypeSetup._ensureLoaded(); }
        }
        static Collections() { _TypeSetup._ensureLoaded(); }
    }
}
