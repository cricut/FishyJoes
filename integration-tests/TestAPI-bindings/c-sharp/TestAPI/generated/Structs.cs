using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para><!-- FishyJoes.exportReference(Structs) --></para>
    /// </summary>
    public class Structs : SwiftReference {
        internal Structs(IntPtr reference): base(reference) {}

        /// <summary>
        /// <para><!-- FishyJoes.exportReference(Structs.ReferenceStruct) --></para>
        /// </summary>
        public class ReferenceStruct : SwiftReference {
            internal ReferenceStruct(IntPtr reference): base(reference) {}

            /// <summary>
            /// <para><!-- FishyJoes.export(immutable) --></para>
            /// </summary>
            public string Immutable {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out IntPtr exn) => 
                        ConsumeHandle<string>(__cs_get_Structs_ReferenceStruct_Immutable(thisHandle.ptr, out exn))
                    );
                }
                set {
                    using var thisHandle = new GCRef(this);
                    using var valueHandle = new GCRef(value);
                    Check((out IntPtr exn) => 
                        __cs_set_Structs_ReferenceStruct_Immutable(thisHandle.ptr, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern IntPtr __cs_get_Structs_ReferenceStruct_Immutable(IntPtr self, out IntPtr exn);

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_set_Structs_ReferenceStruct_Immutable(IntPtr self, IntPtr value, out IntPtr exn);

            /// <summary>
            /// <para><!-- FishyJoes.export(mutable) --></para>
            /// </summary>
            public string Mutable {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out IntPtr exn) => 
                        ConsumeHandle<string>(__cs_get_Structs_ReferenceStruct_Mutable(thisHandle.ptr, out exn))
                    );
                }
                set {
                    using var thisHandle = new GCRef(this);
                    using var valueHandle = new GCRef(value);
                    Check((out IntPtr exn) => 
                        __cs_set_Structs_ReferenceStruct_Mutable(thisHandle.ptr, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern IntPtr __cs_get_Structs_ReferenceStruct_Mutable(IntPtr self, out IntPtr exn);

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_set_Structs_ReferenceStruct_Mutable(IntPtr self, IntPtr value, out IntPtr exn);

            /// <summary>
            /// <para><!-- FishyJoes.export(create) --></para>
            /// </summary>
            public static Cricut.TestAPI.Structs.ReferenceStruct Create(
            ) {
                return ConsumeHandle<Cricut.TestAPI.Structs.ReferenceStruct>(
                    Check((out IntPtr _exn) => __cs_Structs_ReferenceStruct_create(out _exn))
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern IntPtr __cs_Structs_ReferenceStruct_create(
                out IntPtr exn
            );

            public override bool Equals(
                object? other
            ) {
                using var thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.TestAPI.Structs.ReferenceStruct);
                return Check((out IntPtr exn) => __cs_Structs_ReferenceStruct_equals(thisHandle.ptr, otherHandle.ptr, out exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __cs_Structs_ReferenceStruct_equals(
                IntPtr lhs,
                IntPtr rhs,
                out IntPtr exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out IntPtr _exn) => __cs_Structs_ReferenceStruct_hash(_thisHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __cs_Structs_ReferenceStruct_hash(
                IntPtr self,
                out IntPtr exn
            );

            static ReferenceStruct() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <para><!-- FishyJoes.export(Structs.MemberwiseStruct) --></para>
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
            /// <para><!-- FishyJoes.export(create) --></para>
            /// </summary>
            public static Cricut.TestAPI.Structs.MemberwiseStruct Create(
            ) {
                return ConsumeHandle<Cricut.TestAPI.Structs.MemberwiseStruct>(
                    Check((out IntPtr _exn) => __cs_Structs_MemberwiseStruct_create(out _exn))
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern IntPtr __cs_Structs_MemberwiseStruct_create(
                out IntPtr exn
            );

            static MemberwiseStruct() { _TypeSetup._ensureLoaded(); }
        }
        static Structs() { _TypeSetup._ensureLoaded(); }
    }
}
