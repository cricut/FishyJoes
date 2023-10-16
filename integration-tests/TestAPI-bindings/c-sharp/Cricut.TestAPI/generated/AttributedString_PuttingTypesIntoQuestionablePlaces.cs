using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AttributedString_PuttingTypesIntoQuestionablePlaces) -->
    /// </summary>
    public record AttributedString_PuttingTypesIntoQuestionablePlaces {
        public string X { get; private set; }

        public AttributedString_PuttingTypesIntoQuestionablePlaces(
            string X
        ) {
            this.X = X;
        }

        /// <summary>
        /// <!-- FishyJoes.export(testCall) -->
        /// </summary>
        public nint TestCall(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_Foundation_AttributedString_PuttingTypesIntoQuestionablePlaces_testCall(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static AttributedString_PuttingTypesIntoQuestionablePlaces() { _TypeSetup._ensureLoaded(); }
    }
}
