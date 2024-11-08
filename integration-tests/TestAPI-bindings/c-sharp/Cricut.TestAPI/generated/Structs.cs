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
                if (other as Cricut.TestAPI.Structs.ReferenceStruct == null) { return false; }
                using var thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.TestAPI.Structs.ReferenceStruct);
                return Check((out CreatedRef exn) => __iota_TestAPI_Structs_ReferenceStruct_equals(Loader.env, thisHandle.ptr, otherHandle.ptr, out exn));
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            [return: MarshalAs(UnmanagedType.I1)]
            private static extern bool __iota_TestAPI_Structs_ReferenceStruct_equals(
                IntPtr envRef,
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_get_TestAPI_Structs_ReferenceStruct_hash(Loader.env, _thisHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __iota_get_TestAPI_Structs_ReferenceStruct_hash(
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

            static MemberwiseStruct() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <!-- FishyJoes.export(Structs.TwentyOneItemStruct) -->
        /// </summary>
        public record TwentyOneItemStruct {
            public string A { get; set; }
            public string B { get; set; }
            public string C { get; set; }
            public string D { get; set; }
            public string E { get; set; }
            public string F { get; set; }
            public string G { get; set; }
            public string H { get; set; }
            public string I { get; set; }
            public string J { get; set; }
            public string K { get; set; }
            public string L { get; set; }
            public string M { get; set; }
            public string N { get; set; }
            public string O { get; set; }
            public string P { get; set; }
            public string Q { get; set; }
            public string R { get; set; }
            public string S { get; set; }
            public string T { get; set; }
            public string U { get; set; }

            public TwentyOneItemStruct(
                string A,
                string B,
                string C,
                string D,
                string E,
                string F,
                string G,
                string H,
                string I,
                string J,
                string K,
                string L,
                string M,
                string N,
                string O,
                string P,
                string Q,
                string R,
                string S,
                string T,
                string U
            ) {
                this.A = A;
                this.B = B;
                this.C = C;
                this.D = D;
                this.E = E;
                this.F = F;
                this.G = G;
                this.H = H;
                this.I = I;
                this.J = J;
                this.K = K;
                this.L = L;
                this.M = M;
                this.N = N;
                this.O = O;
                this.P = P;
                this.Q = Q;
                this.R = R;
                this.S = S;
                this.T = T;
                this.U = U;
            }

            static TwentyOneItemStruct() { _TypeSetup._ensureLoaded(); }
        }
        static Structs() { _TypeSetup._ensureLoaded(); }
    }
}
