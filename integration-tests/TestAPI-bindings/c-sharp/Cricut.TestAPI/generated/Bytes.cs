using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Bytes) -->
    /// </summary>
    public class Bytes : SwiftReference {
        internal Bytes(IntPtr reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(bytes, cSharp: TheBytes) -->
        /// </summary>
        public static System.Collections.Generic.IList<byte> TheBytes {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<System.Collections.Generic.IList<byte>>(__cs_get_Bytes_TheBytes(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Bytes_TheBytes(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(data) -->
        /// </summary>
        public static byte[] Data {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<byte[]>(__cs_get_Bytes_Data(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Bytes_Data(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(echoBytes) -->
        /// </summary>
        public static System.Collections.Generic.IList<byte> EchoBytes(
            System.Collections.Generic.IList<byte> bytes
        ) {
            using var _bytesHandle = new GCRef(bytes);
            return ConsumeHandle<System.Collections.Generic.IList<byte>>(
                Check((out IntPtr _exn) => __cs_Bytes_echoBytes(_bytesHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Bytes_echoBytes(
            IntPtr bytes,
            out IntPtr exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echoData) -->
        /// </summary>
        public static byte[] EchoData(
            byte[] data
        ) {
            using var _dataHandle = new GCRef(data);
            return ConsumeHandle<byte[]>(
                Check((out IntPtr _exn) => __cs_Bytes_echoData(_dataHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Bytes_echoData(
            IntPtr data,
            out IntPtr exn
        );

        static Bytes() { _TypeSetup._ensureLoaded(); }
    }
}
