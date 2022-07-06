using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using Cricut.FishyJoesRuntime;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Structs) -->
     */
    public class Structs : SwiftReference {
        Structs(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.exportReference(Structs.ReferenceStruct) -->
         */
        public class ReferenceStruct : SwiftReference {
            ReferenceStruct(IntPtr reference): base(reference) {}

            /**
             * <!-- FishyJoes.export(immutable) -->
             */
            public String immutable {
                get => Check((out Exception? exn) => __cs_get_Structs_ReferenceStruct_immutable(this, out exn));
                set { Check((out Exception? exn) => __cs_set_Structs_ReferenceStruct_immutable(this, value, out exn)); }
            }

            [DllImport("TestAPI")]
            private static extern String __cs_get_Structs_ReferenceStruct_immutable(object self, out Exception? exn);

            [DllImport("TestAPI")]
            private static extern void __cs_set_Structs_ReferenceStruct_immutable(object self, String value, out Exception? exn);

            /**
             * <!-- FishyJoes.export(mutable) -->
             */
            public String mutable {
                get => Check((out Exception? exn) => __cs_get_Structs_ReferenceStruct_mutable(this, out exn));
                set { Check((out Exception? exn) => __cs_set_Structs_ReferenceStruct_mutable(this, value, out exn)); }
            }

            [DllImport("TestAPI")]
            private static extern String __cs_get_Structs_ReferenceStruct_mutable(object self, out Exception? exn);

            [DllImport("TestAPI")]
            private static extern void __cs_set_Structs_ReferenceStruct_mutable(object self, String value, out Exception? exn);

            /**
             * <!-- FishyJoes.export(create) -->
             */
            public Cricut.TestAPI.Structs.ReferenceStruct create(
            ) => Check((out Exception? exn) => __cs_Structs_ReferenceStruct_create(out exn));
            [DllImport("TestAPI")]
            static extern Cricut.TestAPI.Structs.ReferenceStruct __cs_Structs_ReferenceStruct_create(
                out Exception? exn
            );

            public override bool Equals(
                object? other
            ) => Check((out Exception? exn) => __cs_Structs_ReferenceStruct_equals(this, other as Cricut.TestAPI.Structs.ReferenceStruct, out exn));

            [DllImport("TestAPI")]
            static extern bool __cs_Structs_ReferenceStruct_equals(
                Cricut.TestAPI.Structs.ReferenceStruct lhs,
                Cricut.TestAPI.Structs.ReferenceStruct? rhs,
                out Exception? exn
            );

            public override int GetHashCode(
            ) => Check((out Exception? exn) => __cs_Structs_ReferenceStruct_hash(this, out exn));
            [DllImport("TestAPI")]
            static extern int __cs_Structs_ReferenceStruct_hash(
                object self,
                out Exception? exn
            );

            static ReferenceStruct() { _TypeSetup._ensureLoaded(); }
        }

        /**
         * <!-- FishyJoes.export(Structs.MemberwiseStruct) -->
         */
        public class MemberwiseStruct {
            String immutable;
            String mutable;

            MemberwiseStruct(
                String immutable,
                String mutable
            ) {
                this.immutable = immutable;
                this.mutable = mutable;
            }

            /**
             * <!-- FishyJoes.export(create) -->
             */
            public Cricut.TestAPI.Structs.MemberwiseStruct create(
            ) => Check((out Exception? exn) => __cs_Structs_MemberwiseStruct_create(out exn));
            [DllImport("TestAPI")]
            static extern Cricut.TestAPI.Structs.MemberwiseStruct __cs_Structs_MemberwiseStruct_create(
                out Exception? exn
            );

            static MemberwiseStruct() { _TypeSetup._ensureLoaded(); }
        }
        static Structs() { _TypeSetup._ensureLoaded(); }
    }
}
