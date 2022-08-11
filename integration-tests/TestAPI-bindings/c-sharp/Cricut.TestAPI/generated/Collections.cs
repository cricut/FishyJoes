using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Collections) -->
    /// </summary>
    public class Collections : SwiftReference {
        internal Collections(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(arrayOfInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint> ArrayOfInt {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_ArrayOfInt(out exn).Consume<System.Collections.Generic.IList<nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_ArrayOfInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(setOfInt) -->
        /// </summary>
        public static System.Collections.Generic.ISet<nint> SetOfInt {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_SetOfInt(out exn).Consume<System.Collections.Generic.ISet<nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_SetOfInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(dictionaryOfIntToInt) -->
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint> DictionaryOfIntToInt {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_DictionaryOfIntToInt(out exn).Consume<System.Collections.Generic.IDictionary<nint, nint>>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_DictionaryOfIntToInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeArrayOfInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint>? MaybeArrayOfInt {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_MaybeArrayOfInt(out exn).Consume<System.Collections.Generic.IList<nint>?>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_MaybeArrayOfInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeSetOfInt) -->
        /// </summary>
        public static System.Collections.Generic.ISet<nint>? MaybeSetOfInt {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_MaybeSetOfInt(out exn).Consume<System.Collections.Generic.ISet<nint>?>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_MaybeSetOfInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeDictionaryOfIntToInt) -->
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint>? MaybeDictionaryOfIntToInt {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_MaybeDictionaryOfIntToInt(out exn).Consume<System.Collections.Generic.IDictionary<nint, nint>?>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_MaybeDictionaryOfIntToInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeArrayOfMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint?>? MaybeArrayOfMaybeInt {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_MaybeArrayOfMaybeInt(out exn).Consume<System.Collections.Generic.IList<nint?>?>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_MaybeArrayOfMaybeInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeSetOfMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.ISet<nint?>? MaybeSetOfMaybeInt {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_MaybeSetOfMaybeInt(out exn).Consume<System.Collections.Generic.ISet<nint?>?>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_MaybeSetOfMaybeInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) -->
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint?>? MaybeDictionaryOfIntToMaybeInt {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_MaybeDictionaryOfIntToMaybeInt(out exn).Consume<System.Collections.Generic.IDictionary<nint, nint?>?>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_MaybeDictionaryOfIntToMaybeInt(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(defaultCollectionHolder) -->
        /// </summary>
        public static Cricut.TestAPI.Collections.CollectionHolder DefaultCollectionHolder {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Collections_DefaultCollectionHolder(out exn).Consume<Cricut.TestAPI.Collections.CollectionHolder>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Collections_DefaultCollectionHolder(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoArrayOfInt) -->
        /// </summary>
        public static System.Collections.Generic.IList<nint> EchoArrayOfInt(
            System.Collections.Generic.IList<nint> arrayOfInt
        ) {
            using var _arrayOfIntHandle = new GCRef(arrayOfInt);
            return Check((out CreatedRef _exn) => __cs_Collections_echoArrayOfInt(_arrayOfIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<nint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Collections_echoArrayOfInt(
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
            return Check((out CreatedRef _exn) => __cs_Collections_echoSetOfInt(_setOfIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.ISet<nint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Collections_echoSetOfInt(
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
            return Check((out CreatedRef _exn) => __cs_Collections_echoDictionaryOfIntToInt(_dictionaryOfIntToIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.IDictionary<nint, nint>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Collections_echoDictionaryOfIntToInt(
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
            return Check((out CreatedRef _exn) => __cs_Collections_echoMaybeArrayOfMaybeInt(_maybeArrayOfMaybeIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<nint?>?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Collections_echoMaybeArrayOfMaybeInt(
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
            return Check((out CreatedRef _exn) => __cs_Collections_echoMaybeSetOfMaybeInt(_maybeSetOfMaybeIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.ISet<nint?>?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Collections_echoMaybeSetOfMaybeInt(
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
            return Check((out CreatedRef _exn) => __cs_Collections_echoMaybeDictionaryOfIntToMaybeInt(_maybeDictionaryOfIntToMaybeIntHandle.ptr, out _exn)).Consume<System.Collections.Generic.IDictionary<nint, nint?>?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Collections_echoMaybeDictionaryOfIntToMaybeInt(
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
            return Check((out CreatedRef _exn) => __cs_Collections_collectionMapper(_collectionHandle.ptr, _mapperHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<nint?>?>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Collections_collectionMapper(
            UnownedRef collection,
            UnownedRef mapper,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(Collections.CollectionHolder) -->
        /// </summary>
        public record CollectionHolder {
            public System.Collections.Generic.IList<bool> BoolArray;
            public System.Collections.Generic.ISet<bool> BoolSet;
            public System.Collections.Generic.IDictionary<bool, bool> BoolDictionary;
            public System.Collections.Generic.IList<nint> IntegerArray;
            public System.Collections.Generic.ISet<nint> IntegerSet;
            public System.Collections.Generic.IDictionary<nint, nint> IntegerDictionary;
            public System.Collections.Generic.IList<string> StringArray;
            public System.Collections.Generic.ISet<string> StringSet;
            public System.Collections.Generic.IDictionary<string, string> StringDictionary;

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
            /// <!-- FishyJoes.export(staticPropery) -->
            /// </summary>
            public static System.Collections.Generic.IList<nint?> StaticPropery {
                get {
                    return Check((out CreatedRef exn) =>
                        __cs_get_Collections_CollectionHolder_StaticPropery(out exn).Consume<System.Collections.Generic.IList<nint?>>()
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_Collections_CollectionHolder_StaticPropery(out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(staticMutablePropery) -->
            /// </summary>
            public static System.Collections.Generic.IList<nint?> StaticMutablePropery {
                get {
                    return Check((out CreatedRef exn) =>
                        __cs_get_Collections_CollectionHolder_StaticMutablePropery(out exn).Consume<System.Collections.Generic.IList<nint?>>()
                    );
                }
                set {
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __cs_set_Collections_CollectionHolder_StaticMutablePropery(valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_Collections_CollectionHolder_StaticMutablePropery(out CreatedRef exn);

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_set_Collections_CollectionHolder_StaticMutablePropery(UnownedRef value, out CreatedRef exn);

            static CollectionHolder() { _TypeSetup._ensureLoaded(); }
        }
        static Collections() { _TypeSetup._ensureLoaded(); }
    }
}
