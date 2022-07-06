using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using Cricut.FishyJoesRuntime;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Bytes) -->
     */
    public class Bytes : SwiftReference {
        Bytes(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(bytes) -->
         */
        public byte[] bytes {
            get => Check((out Exception? exn) => __cs_get_Bytes_bytes(out exn));
        }

        [DllImport("TestAPI")]
        private static extern byte[] __cs_get_Bytes_bytes(out Exception? exn);

        /**
         * <!-- FishyJoes.export(data) -->
         */
        public byte[] data {
            get => Check((out Exception? exn) => __cs_get_Bytes_data(out exn));
        }

        [DllImport("TestAPI")]
        private static extern byte[] __cs_get_Bytes_data(out Exception? exn);

        /**
         * <!-- FishyJoes.export(echoBytes) -->
         */
        public byte[] echoBytes(
            byte[] bytes
        ) => Check((out Exception? exn) => __cs_Bytes_echoBytes(bytes, out exn));
        [DllImport("TestAPI")]
        static extern byte[] __cs_Bytes_echoBytes(
            byte[] bytes,
            out Exception? exn
        );

        /**
         * <!-- FishyJoes.export(echoData) -->
         */
        public byte[] echoData(
            byte[] data
        ) => Check((out Exception? exn) => __cs_Bytes_echoData(data, out exn));
        [DllImport("TestAPI")]
        static extern byte[] __cs_Bytes_echoData(
            byte[] data,
            out Exception? exn
        );

        static Bytes() { _TypeSetup._ensureLoaded(); }
    }
}
