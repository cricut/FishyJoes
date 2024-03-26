using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestAsyncFunctionsStruct) -->
    /// </summary>
    public record TestAsyncFunctionsStruct {
        public System.Func<System.Threading.Tasks.Task<nint>> Const42 { get; internal set; }
        public System.Func<nint, System.Threading.Tasks.Task<nint>> Iabs { get; internal set; }

        public TestAsyncFunctionsStruct(
            System.Func<System.Threading.Tasks.Task<nint>> Const42,
            System.Func<nint, System.Threading.Tasks.Task<nint>> Iabs
        ) {
            this.Const42 = Const42;
            this.Iabs = Iabs;
        }

        static TestAsyncFunctionsStruct() { _TypeSetup._ensureLoaded(); }
    }
}
