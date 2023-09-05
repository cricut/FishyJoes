using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(UnicodeScalar_PuttingTypesIntoQuestionablePlaces) -->
    /// </summary>
    public record UnicodeScalar_PuttingTypesIntoQuestionablePlaces {
        private UnicodeScalar_PuttingTypesIntoQuestionablePlaces() {}

        public sealed record Thing : UnicodeScalar_PuttingTypesIntoQuestionablePlaces;

        /// <summary>
        /// <!-- FishyJoes.export(testCall) -->
        /// </summary>
        public nint TestCall(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __cs_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall(_thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __cs_Swift_UnicodeScalar_PuttingTypesIntoQuestionablePlaces_testCall(
            UnownedRef self,
            out CreatedRef exn
        );

        static UnicodeScalar_PuttingTypesIntoQuestionablePlaces() { _TypeSetup._ensureLoaded(); }
    }
}
