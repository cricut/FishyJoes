using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Structs) -->
     */
    public class Structs : SwiftReference {
        internal Structs(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
         */
        public class ReferenceStruct : SwiftReference {
            internal ReferenceStruct(IntPtr reference): base(reference) {}

            /**
             * <!-- FishyJoes.export(immutable) -->
             */
            public string immutable {
                get => Check((out IntPtr exn) => {
                    using var thisHandle = new GCRef(this);
                    return ConsumeHandle<string>(__cs_get_Structs_ReferenceStruct_immutable(thisHandle.ptr, out exn));
                });
                set {
                    Check((out IntPtr exn) => {
                        using var thisHandle = new GCRef(this);
                        using var valueHandle = new GCRef(value);
                        __cs_set_Structs_ReferenceStruct_immutable(thisHandle.ptr, valueHandle.ptr, out exn);
                    });
                }
            }

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern IntPtr __cs_get_Structs_ReferenceStruct_immutable(IntPtr self, out IntPtr exn);

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern void __cs_set_Structs_ReferenceStruct_immutable(IntPtr self, IntPtr value, out IntPtr exn);

            /**
             * <!-- FishyJoes.export(mutable) -->
             */
            public string mutable {
                get => Check((out IntPtr exn) => {
                    using var thisHandle = new GCRef(this);
                    return ConsumeHandle<string>(__cs_get_Structs_ReferenceStruct_mutable(thisHandle.ptr, out exn));
                });
                set {
                    Check((out IntPtr exn) => {
                        using var thisHandle = new GCRef(this);
                        using var valueHandle = new GCRef(value);
                        __cs_set_Structs_ReferenceStruct_mutable(thisHandle.ptr, valueHandle.ptr, out exn);
                    });
                }
            }

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern IntPtr __cs_get_Structs_ReferenceStruct_mutable(IntPtr self, out IntPtr exn);

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern void __cs_set_Structs_ReferenceStruct_mutable(IntPtr self, IntPtr value, out IntPtr exn);

            /**
             * <!-- FishyJoes.export(create) -->
             */
            public static Cricut.TestAPI.Structs.ReferenceStruct create(
            ) {
                return ConsumeHandle<Cricut.TestAPI.Structs.ReferenceStruct>(
                    Check((out IntPtr _exn) => __cs_Structs_ReferenceStruct_create(out _exn))
                );
            }

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
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

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
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

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern int __cs_Structs_ReferenceStruct_hash(
                IntPtr self,
                out IntPtr exn
            );

            static ReferenceStruct() { _TypeSetup._ensureLoaded(); }
        }

        /**
         * <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
         */
        public struct MemberwiseStruct {
            public string immutable;
            public string mutable;

            public MemberwiseStruct(
                string immutable,
                string mutable
            ) {
                this.immutable = immutable;
                this.mutable = mutable;
            }

            /**
             * <!-- FishyJoes.export(create) -->
             */
            public static Cricut.TestAPI.Structs.MemberwiseStruct create(
            ) {
                return ConsumeHandle<Cricut.TestAPI.Structs.MemberwiseStruct>(
                    Check((out IntPtr _exn) => __cs_Structs_MemberwiseStruct_create(out _exn))
                );
            }

            [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
            private static extern IntPtr __cs_Structs_MemberwiseStruct_create(
                out IntPtr exn
            );

            static MemberwiseStruct() { _TypeSetup._ensureLoaded(); }
        }
        static Structs() { _TypeSetup._ensureLoaded(); }
    }
}
