namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Bytes) -->
    /// </summary>
    public record Bytes {
        private Bytes() {}

        /// <summary>
        /// <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
        /// </summary>
        public static System.Collections.Generic.IList<byte> TheBytes {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Bytes_bytes(Loader.env, out exn).Consume<System.Collections.Generic.IList<byte>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Bytes_bytes(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(data) -->
        /// </summary>
        public static byte[] Data {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Bytes_data(Loader.env, out exn).Consume<byte[]>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Bytes_data(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoBytes) -->
        /// </summary>
        public static System.Collections.Generic.IList<byte> EchoBytes(
            System.Collections.Generic.IList<byte> bytes
        ) {
            using var _bytesHandle = new GCRef(bytes);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Bytes_echoBytes(Loader.env, _bytesHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<byte>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Bytes_echoBytes(
            IntPtr envRef,
            UnownedRef bytes,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoData) -->
        /// </summary>
        public static byte[] EchoData(
            byte[] data
        ) {
            using var _dataHandle = new GCRef(data);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Bytes_echoData(Loader.env, _dataHandle.ptr, out _exn)).Consume<byte[]>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Bytes_echoData(
            IntPtr envRef,
            UnownedRef data,
            out CreatedRef exn
        );

        static Bytes() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;
