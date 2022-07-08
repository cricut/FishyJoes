using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Bytes) -->
     */
    public class Bytes : SwiftReference {
        internal Bytes(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(bytes) -->
         */
        public static byte[] bytes {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<byte[]>(__cs_get_Bytes_bytes(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Bytes_bytes(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(data) -->
         */
        public static byte[] data {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<byte[]>(__cs_get_Bytes_data(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Bytes_data(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(echoBytes) -->
         */
        public static byte[] echoBytes(
            byte[] bytes
        ) {
            using var _bytesHandle = new GCRef(bytes);
            return ConsumeHandle<byte[]>(
                Check((out IntPtr _exn) => __cs_Bytes_echoBytes(_bytesHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Bytes_echoBytes(
            IntPtr bytes,
            out IntPtr exn
        );

        /**
         * <!-- FishyJoes.export(echoData) -->
         */
        public static byte[] echoData(
            byte[] data
        ) {
            using var _dataHandle = new GCRef(data);
            return ConsumeHandle<byte[]>(
                Check((out IntPtr _exn) => __cs_Bytes_echoData(_dataHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Bytes_echoData(
            IntPtr data,
            out IntPtr exn
        );

        static Bytes() { _TypeSetup._ensureLoaded(); }
    }
}
