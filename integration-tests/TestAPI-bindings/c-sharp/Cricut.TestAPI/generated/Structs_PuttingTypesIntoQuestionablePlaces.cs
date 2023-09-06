using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Structs_PuttingTypesIntoQuestionablePlaces) -->
    /// </summary>
    public class Structs_PuttingTypesIntoQuestionablePlaces : SwiftReference {
        internal Structs_PuttingTypesIntoQuestionablePlaces(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public static Cricut.TestAPI.Structs_PuttingTypesIntoQuestionablePlaces Create(
        ) {
            return Check((out CreatedRef _exn) => __cs_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create(out _exn)).Consume<Cricut.TestAPI.Structs_PuttingTypesIntoQuestionablePlaces>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_create(
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(testCall) -->
        /// </summary>
        public nint TestCall(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __cs_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall(_thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_TestAPI_Structs_PuttingTypesIntoQuestionablePlaces_testCall(
            UnownedRef self,
            out CreatedRef exn
        );

        static Structs_PuttingTypesIntoQuestionablePlaces() { _TypeSetup._ensureLoaded(); }
    }
}
