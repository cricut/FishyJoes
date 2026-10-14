using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Results) -->
    /// </summary>
    public record Results {
        private Results() {}

        /// <summary>
        /// <!-- FishyJoes.export(aFailure) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.Result<nint, Cricut.TestAPI.Results.Error> GetAFailure() {
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_Results_aFailure(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.Result<nint, Cricut.TestAPI.Results.Error>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Results_aFailure(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(aSuccess) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.Result<nint, Cricut.TestAPI.Results.Error> GetASuccess() {
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_Results_aSuccess(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.Result<nint, Cricut.TestAPI.Results.Error>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Results_aSuccess(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(processResult) -->
        /// </summary>
        public static string ProcessResult(
            Cricut.FishyJoesRuntime.Result<string, Cricut.TestAPI.Results.Error> result
        ) {
            using var _resultHandle = new GCRef(result);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Results_processResult(Loader.env, _resultHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Results_processResult(
            IntPtr envRef,
            UnownedRef result,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(Results.Error) -->
        /// </summary>
        public record Error {
            public string Message { get; internal set; }

            public Error(
                string Message
            ) {
                this.Message = Message;
            }

            static Error() { _TypeSetup._ensureLoaded(); }
        }
        static Results() { _TypeSetup._ensureLoaded(); }
    }
}
