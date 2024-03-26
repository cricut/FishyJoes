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
        public System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> IntCompose { get; internal set; }
        public System.Func<float, double, nint, System.Threading.Tasks.Task<double>> Add3Things { get; internal set; }
        public System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> MakeList { get; internal set; }

        public TestAsyncFunctionsStruct(
            System.Func<System.Threading.Tasks.Task<nint>> Const42,
            System.Func<nint, System.Threading.Tasks.Task<nint>> Iabs,
            System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> IntCompose,
            System.Func<float, double, nint, System.Threading.Tasks.Task<double>> Add3Things,
            System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> MakeList
        ) {
            this.Const42 = Const42;
            this.Iabs = Iabs;
            this.IntCompose = IntCompose;
            this.Add3Things = Add3Things;
            this.MakeList = MakeList;
        }

        static TestAsyncFunctionsStruct() { _TypeSetup._ensureLoaded(); }
    }
}
