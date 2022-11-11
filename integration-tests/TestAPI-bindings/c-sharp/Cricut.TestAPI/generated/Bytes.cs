using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

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
                    __cs_get_Bytes_TheBytes(out exn).Consume<System.Collections.Generic.IList<byte>>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Bytes_TheBytes(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(data) -->
        /// </summary>
        public static byte[] Data {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_Bytes_Data(out exn).Consume<byte[]>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Bytes_Data(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoBytes) -->
        /// </summary>
        public static System.Collections.Generic.IList<byte> EchoBytes(
            System.Collections.Generic.IList<byte> bytes
        ) {
            using var _bytesHandle = new GCRef(bytes);
            return Check((out CreatedRef _exn) => __cs_Bytes_echoBytes(_bytesHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<byte>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Bytes_echoBytes(
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
            return Check((out CreatedRef _exn) => __cs_Bytes_echoData(_dataHandle.ptr, out _exn)).Consume<byte[]>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Bytes_echoData(
            UnownedRef data,
            out CreatedRef exn
        );

        static Bytes() { _TypeSetup._ensureLoaded(); }
    }
}
