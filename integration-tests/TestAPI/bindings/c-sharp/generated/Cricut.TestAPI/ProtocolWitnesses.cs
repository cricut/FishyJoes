using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(ProtocolWitnesses) -->
    /// </summary>
    public record ProtocolWitnesses {
        private ProtocolWitnesses() {}

        /// <summary>
        /// <!-- FishyJoes.export(describeAProtocol) -->
        /// </summary>
        public static string DescribeAProtocol(
            Cricut.TestAPI.AProtocol value,
            nint x,
            nint y
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_ProtocolWitnesses_describeAProtocol(Loader.env, _valueHandle.ptr, x, y, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ProtocolWitnesses_describeAProtocol(
            IntPtr envRef,
            UnownedRef value,
            nint x,
            nint y,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(returnAProtocol) -->
        /// </summary>
        public static Cricut.TestAPI.AProtocol ReturnAProtocol(
            Cricut.TestAPI.AProtocol value
        ) {
            using var _valueHandle = new GCRef(value);
            return Check((out CreatedRef _exn) => __iota_TestAPI_ProtocolWitnesses_returnAProtocol(Loader.env, _valueHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AProtocol>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_ProtocolWitnesses_returnAProtocol(
            IntPtr envRef,
            UnownedRef value,
            out CreatedRef exn
        );

        static ProtocolWitnesses() { _TypeSetup._ensureLoaded(); }
    }
}
