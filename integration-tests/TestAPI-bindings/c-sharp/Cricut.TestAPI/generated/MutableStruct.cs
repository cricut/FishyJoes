using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(MutableStruct) -->
    /// </summary>
    public record MutableStruct {
        public nint I;

        public MutableStruct(
            nint I
        ) {
            this.I = I;
        }

        /// <summary>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public static Cricut.TestAPI.MutableStruct Create(
        ) {
            return Check((out CreatedRef _exn) => __cs_Structs_MutableStruct_create(out _exn)).Consume<Cricut.TestAPI.MutableStruct>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Structs_MutableStruct_create(
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(increment) -->
        /// </summary>
        public void Increment(
        ) {
            using var _thisHandle = new GCRef(this);
            Check((out CreatedRef _exn) => __cs_Structs_MutableStruct_increment(_thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_Structs_MutableStruct_increment(
            UnownedRef self,
            out CreatedRef exn
        );

        static MutableStruct() { _TypeSetup._ensureLoaded(); }
    }
}
