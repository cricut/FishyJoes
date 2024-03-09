using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Structs) -->
    /// </summary>
    public record Structs {
        private Structs() {}

        /// <summary>
        /// <!-- FishyJoes.export(Structs.DougStruct) -->
        /// </summary>
        public record DougStruct {
            public string Str { get; set; }

            public DougStruct(
                string Str
            ) {
                this.Str = Str;
            }

            /// <summary>
            /// <!-- FishyJoes.export(cat) -->
            /// </summary>
            public string Cat(
                string str
            ) {
                using var _thisHandle = new GCRef(this);
                using var _strHandle = new GCRef(str);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_DougStruct_cat(Loader.env, _thisHandle.ptr, _strHandle.ptr, out _exn)).Consume<string>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Structs_DougStruct_cat(
                IntPtr envRef,
                UnownedRef self,
                UnownedRef str,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(create) -->
            /// </summary>
            public static Cricut.TestAPI.Structs.DougStruct Create(
                string str
            ) {
                using var _strHandle = new GCRef(str);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_DougStruct_create(Loader.env, _strHandle.ptr, out _exn)).Consume<Cricut.TestAPI.Structs.DougStruct>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Structs_DougStruct_create(
                IntPtr envRef,
                UnownedRef str,
                out CreatedRef exn
            );

            static DougStruct() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <!-- FishyJoes.export(Structs.MutableStruct) -->
        /// </summary>
        public record MutableStruct {
            public nint I { get; set; }

            public MutableStruct(
                nint I
            ) {
                this.I = I;
            }

            /// <summary>
            /// <!-- FishyJoes.export(asyncGetI) -->
            /// </summary>
            public System.Threading.Tasks.Task<nint> AsyncGetI(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_MutableStruct_asyncGetI(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Structs_MutableStruct_asyncGetI(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(increment) -->
            /// </summary>
            public void Increment(
            ) {
                using var _thisHandle = new GCRef(this);
                Check((out CreatedRef _exn) => __iota_TestAPI_Structs_MutableStruct_increment(Loader.env, _thisHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __iota_TestAPI_Structs_MutableStruct_increment(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(incrementAsync) -->
            /// </summary>
            public System.Threading.Tasks.Task IncrementAsync(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_MutableStruct_incrementAsync(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Structs_MutableStruct_incrementAsync(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(create) -->
            /// </summary>
            public static Cricut.TestAPI.Structs.MutableStruct Create(
            ) {
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_MutableStruct_create(Loader.env, out _exn)).Consume<Cricut.TestAPI.Structs.MutableStruct>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Structs_MutableStruct_create(
                IntPtr envRef,
                out CreatedRef exn
            );

            static MutableStruct() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
        /// </summary>
        public class ReferenceStruct : SwiftReference {
            internal ReferenceStruct(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// <!-- FishyJoes.export(immutable) -->
            /// </summary>
            public string Immutable {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_TestAPI_Structs_ReferenceStruct_immutable(Loader.env, thisHandle.ptr, out exn).Consume<string>()
                    );
                }
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_TestAPI_Structs_ReferenceStruct_immutable(IntPtr envRef, UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(mutable) -->
            /// </summary>
            public string Mutable {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_TestAPI_Structs_ReferenceStruct_mutable(Loader.env, thisHandle.ptr, out exn).Consume<string>()
                    );
                }
                set {
                    using var thisHandle = new GCRef(this);
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __iota_set_TestAPI_Structs_ReferenceStruct_mutable(Loader.env, thisHandle.ptr, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_TestAPI_Structs_ReferenceStruct_mutable(IntPtr envRef, UnownedRef self, out CreatedRef exn);

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __iota_set_TestAPI_Structs_ReferenceStruct_mutable(IntPtr envRef, UnownedRef self, UnownedRef value, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(create) -->
            /// </summary>
            public static Cricut.TestAPI.Structs.ReferenceStruct Create(
            ) {
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_ReferenceStruct_create(Loader.env, out _exn)).Consume<Cricut.TestAPI.Structs.ReferenceStruct>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Structs_ReferenceStruct_create(
                IntPtr envRef,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(asyncGetMutable) -->
            /// </summary>
            public System.Threading.Tasks.Task<string> AsyncGetMutable(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Structs_ReferenceStruct_asyncGetMutable(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            public override bool Equals(
                object? other
            ) {
                using var thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.TestAPI.Structs.ReferenceStruct);
                return Check((out CreatedRef exn) => __iota_TestAPI_Structs_ReferenceStruct_equals(Loader.env, thisHandle.ptr, otherHandle.ptr, out exn));
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __iota_TestAPI_Structs_ReferenceStruct_equals(
                IntPtr envRef,
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_ReferenceStruct_hash(Loader.env, _thisHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __iota_TestAPI_Structs_ReferenceStruct_hash(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            static ReferenceStruct() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
        /// </summary>
        public record MemberwiseStruct {
            public string Immutable { get; internal set; }
            public string Mutable { get; set; }

            public MemberwiseStruct(
                string Immutable,
                string Mutable
            ) {
                this.Immutable = Immutable;
                this.Mutable = Mutable;
            }

            /// <summary>
            /// <!-- FishyJoes.export(asyncGetMutable) -->
            /// </summary>
            public System.Threading.Tasks.Task<string> AsyncGetMutable(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_MemberwiseStruct_asyncGetMutable(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Structs_MemberwiseStruct_asyncGetMutable(
                IntPtr envRef,
                UnownedRef self,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(create) -->
            /// </summary>
            public static Cricut.TestAPI.Structs.MemberwiseStruct Create(
            ) {
                return Check((out CreatedRef _exn) => __iota_TestAPI_Structs_MemberwiseStruct_create(Loader.env, out _exn)).Consume<Cricut.TestAPI.Structs.MemberwiseStruct>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_TestAPI_Structs_MemberwiseStruct_create(
                IntPtr envRef,
                out CreatedRef exn
            );

            static MemberwiseStruct() { _TypeSetup._ensureLoaded(); }
        }
        static Structs() { _TypeSetup._ensureLoaded(); }
    }
}
