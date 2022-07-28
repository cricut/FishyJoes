using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para><!-- FishyJoes.exportReference(Collections) --></para>
    /// </summary>
    public class Collections : SwiftReference {
        internal Collections(IntPtr reference): base(reference) {}

        /// <summary>
        /// <para><!-- FishyJoes.export(arrayOfInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IList<nint> ArrayOfInt {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.IList<nint>>(__cs_get_Collections_ArrayOfInt(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_ArrayOfInt(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(setOfInt) --></para>
        /// </summary>
        public static System.Collections.Generic.ISet<nint> SetOfInt {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.ISet<nint>>(__cs_get_Collections_SetOfInt(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_SetOfInt(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(dictionaryOfIntToInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint> DictionaryOfIntToInt {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.IDictionary<nint, nint>>(__cs_get_Collections_DictionaryOfIntToInt(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_DictionaryOfIntToInt(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(maybeArrayOfInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IList<nint>? MaybeArrayOfInt {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.IList<nint>?>(__cs_get_Collections_MaybeArrayOfInt(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_MaybeArrayOfInt(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(maybeSetOfInt) --></para>
        /// </summary>
        public static System.Collections.Generic.ISet<nint>? MaybeSetOfInt {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.ISet<nint>?>(__cs_get_Collections_MaybeSetOfInt(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_MaybeSetOfInt(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(maybeDictionaryOfIntToInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint>? MaybeDictionaryOfIntToInt {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.IDictionary<nint, nint>?>(__cs_get_Collections_MaybeDictionaryOfIntToInt(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_MaybeDictionaryOfIntToInt(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(maybeArrayOfMaybeInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IList<nint?>? MaybeArrayOfMaybeInt {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.IList<nint?>?>(__cs_get_Collections_MaybeArrayOfMaybeInt(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_MaybeArrayOfMaybeInt(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(maybeSetOfMaybeInt) --></para>
        /// </summary>
        public static System.Collections.Generic.ISet<nint?>? MaybeSetOfMaybeInt {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.ISet<nint?>?>(__cs_get_Collections_MaybeSetOfMaybeInt(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_MaybeSetOfMaybeInt(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(maybeDictionaryOfIntToMaybeInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint?>? MaybeDictionaryOfIntToMaybeInt {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.IDictionary<nint, nint?>?>(__cs_get_Collections_MaybeDictionaryOfIntToMaybeInt(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_MaybeDictionaryOfIntToMaybeInt(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(defaultCollectionHolder) --></para>
        /// </summary>
        public static Cricut.TestAPI.Collections.CollectionHolder DefaultCollectionHolder {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<Cricut.TestAPI.Collections.CollectionHolder>(__cs_get_Collections_DefaultCollectionHolder(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Collections_DefaultCollectionHolder(out IntPtr exn);

        /// <summary>
        /// <para><!-- FishyJoes.export(echoArrayOfInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IList<nint> EchoArrayOfInt(
            System.Collections.Generic.IList<nint> arrayOfInt
        ) {
            using var _arrayOfIntHandle = new GCRef(arrayOfInt);
            return ConsumeHandle<System.Collections.Generic.IList<nint>>(
                Check((out IntPtr _exn) => __cs_Collections_echoArrayOfInt(_arrayOfIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Collections_echoArrayOfInt(
            IntPtr arrayOfInt,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(echoSetOfInt) --></para>
        /// </summary>
        public static System.Collections.Generic.ISet<nint> EchoSetOfInt(
            System.Collections.Generic.ISet<nint> setOfInt
        ) {
            using var _setOfIntHandle = new GCRef(setOfInt);
            return ConsumeHandle<System.Collections.Generic.ISet<nint>>(
                Check((out IntPtr _exn) => __cs_Collections_echoSetOfInt(_setOfIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Collections_echoSetOfInt(
            IntPtr setOfInt,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(echoDictionaryOfIntToInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint> EchoDictionaryOfIntToInt(
            System.Collections.Generic.IDictionary<nint, nint> dictionaryOfIntToInt
        ) {
            using var _dictionaryOfIntToIntHandle = new GCRef(dictionaryOfIntToInt);
            return ConsumeHandle<System.Collections.Generic.IDictionary<nint, nint>>(
                Check((out IntPtr _exn) => __cs_Collections_echoDictionaryOfIntToInt(_dictionaryOfIntToIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Collections_echoDictionaryOfIntToInt(
            IntPtr dictionaryOfIntToInt,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(echoMaybeArrayOfMaybeInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IList<nint?>? EchoMaybeArrayOfMaybeInt(
            System.Collections.Generic.IList<nint?>? maybeArrayOfMaybeInt
        ) {
            using var _maybeArrayOfMaybeIntHandle = new GCRef(maybeArrayOfMaybeInt);
            return ConsumeHandle<System.Collections.Generic.IList<nint?>?>(
                Check((out IntPtr _exn) => __cs_Collections_echoMaybeArrayOfMaybeInt(_maybeArrayOfMaybeIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Collections_echoMaybeArrayOfMaybeInt(
            IntPtr maybeArrayOfMaybeInt,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(echoMaybeSetOfMaybeInt) --></para>
        /// </summary>
        public static System.Collections.Generic.ISet<nint?>? EchoMaybeSetOfMaybeInt(
            System.Collections.Generic.ISet<nint?>? maybeSetOfMaybeInt
        ) {
            using var _maybeSetOfMaybeIntHandle = new GCRef(maybeSetOfMaybeInt);
            return ConsumeHandle<System.Collections.Generic.ISet<nint?>?>(
                Check((out IntPtr _exn) => __cs_Collections_echoMaybeSetOfMaybeInt(_maybeSetOfMaybeIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Collections_echoMaybeSetOfMaybeInt(
            IntPtr maybeSetOfMaybeInt,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(echoMaybeDictionaryOfIntToMaybeInt) --></para>
        /// </summary>
        public static System.Collections.Generic.IDictionary<nint, nint?>? EchoMaybeDictionaryOfIntToMaybeInt(
            System.Collections.Generic.IDictionary<nint, nint?>? maybeDictionaryOfIntToMaybeInt
        ) {
            using var _maybeDictionaryOfIntToMaybeIntHandle = new GCRef(maybeDictionaryOfIntToMaybeInt);
            return ConsumeHandle<System.Collections.Generic.IDictionary<nint, nint?>?>(
                Check((out IntPtr _exn) => __cs_Collections_echoMaybeDictionaryOfIntToMaybeInt(_maybeDictionaryOfIntToMaybeIntHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Collections_echoMaybeDictionaryOfIntToMaybeInt(
            IntPtr maybeDictionaryOfIntToMaybeInt,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(collectionMapper) --></para>
        /// </summary>
        public static System.Collections.Generic.IList<nint?>? CollectionMapper(
            System.Collections.Generic.IList<nint?>? collection,
            System.Func<System.Collections.Generic.IList<nint?>?, System.Collections.Generic.IList<nint?>?> mapper
        ) {
            using var _collectionHandle = new GCRef(collection);
            using var _mapperHandle = new GCRef(mapper);
            return ConsumeHandle<System.Collections.Generic.IList<nint?>?>(
                Check((out IntPtr _exn) => __cs_Collections_collectionMapper(_collectionHandle.ptr, _mapperHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Collections_collectionMapper(
            IntPtr collection,
            IntPtr mapper,
            out IntPtr exn
        );

        /// <summary>
        /// <para><!-- FishyJoes.export(Collections.CollectionHolder) --></para>
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
            /// <para><!-- FishyJoes.export(staticPropery) --></para>
            /// </summary>
            public static System.Collections.Generic.IList<nint?> StaticPropery {
                get {
                    return Check((out IntPtr exn) => 
                        ConsumeHandle<System.Collections.Generic.IList<nint?>>(__cs_get_Collections_CollectionHolder_StaticPropery(out exn))
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern IntPtr __cs_get_Collections_CollectionHolder_StaticPropery(out IntPtr exn);

            /// <summary>
            /// <para><!-- FishyJoes.export(staticMutablePropery) --></para>
            /// </summary>
            public static System.Collections.Generic.IList<nint?> StaticMutablePropery {
                get {
                    return Check((out IntPtr exn) => 
                        ConsumeHandle<System.Collections.Generic.IList<nint?>>(__cs_get_Collections_CollectionHolder_StaticMutablePropery(out exn))
                    );
                }
                set {
                    using var valueHandle = new GCRef(value);
                    Check((out IntPtr exn) => 
                        __cs_set_Collections_CollectionHolder_StaticMutablePropery(valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern IntPtr __cs_get_Collections_CollectionHolder_StaticMutablePropery(out IntPtr exn);

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_set_Collections_CollectionHolder_StaticMutablePropery(IntPtr value, out IntPtr exn);

            static CollectionHolder() { _TypeSetup._ensureLoaded(); }
        }
        static Collections() { _TypeSetup._ensureLoaded(); }
    }
}
