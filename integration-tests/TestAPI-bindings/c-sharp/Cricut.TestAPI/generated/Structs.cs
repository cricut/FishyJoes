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
                        __iota_get_Structs_ReferenceStruct_Immutable(thisHandle.ptr, out exn).Consume<string>()
                    );
                }
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_Structs_ReferenceStruct_Immutable(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(mutable) -->
            /// </summary>
            public string Mutable {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_Structs_ReferenceStruct_Mutable(thisHandle.ptr, out exn).Consume<string>()
                    );
                }
                set {
                    using var thisHandle = new GCRef(this);
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __iota_set_Structs_ReferenceStruct_Mutable(thisHandle.ptr, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_Structs_ReferenceStruct_Mutable(UnownedRef self, out CreatedRef exn);

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __iota_set_Structs_ReferenceStruct_Mutable(UnownedRef self, UnownedRef value, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(create) -->
            /// </summary>
            public static Cricut.TestAPI.Structs.ReferenceStruct Create(
            ) {
                return Check((out CreatedRef _exn) => __iota_Structs_ReferenceStruct_create(out _exn)).Consume<Cricut.TestAPI.Structs.ReferenceStruct>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Structs_ReferenceStruct_create(
                out CreatedRef exn
            );

            public override bool Equals(
                object? other
            ) {
                using var thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.TestAPI.Structs.ReferenceStruct);
                return Check((out CreatedRef exn) => __iota_Structs_ReferenceStruct_equals(thisHandle.ptr, otherHandle.ptr, out exn));
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __iota_Structs_ReferenceStruct_equals(
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_Structs_ReferenceStruct_hash(_thisHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __iota_Structs_ReferenceStruct_hash(
                UnownedRef self,
                out CreatedRef exn
            );

            static ReferenceStruct() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
        /// </summary>
        public record MemberwiseStruct {
            public string Immutable;
            public string Mutable;

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
                return Check((out CreatedRef _exn) => __iota_Structs_MemberwiseStruct_create(out _exn)).Consume<Cricut.TestAPI.Structs.MemberwiseStruct>();
            }

            [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_Structs_MemberwiseStruct_create(
                out CreatedRef exn
            );

            static MemberwiseStruct() { _TypeSetup._ensureLoaded(); }
        }
        static Structs() { _TypeSetup._ensureLoaded(); }
    }
}
