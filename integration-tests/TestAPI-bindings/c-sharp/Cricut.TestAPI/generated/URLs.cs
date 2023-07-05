using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(URLs) -->
    /// </summary>
    public record URLs {
        private URLs() {}

        /// <summary>
        /// <!-- FishyJoes.export(simple) -->
        /// </summary>
        public static System.Uri Simple {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_URLs_Simple(out exn).Consume<System.Uri>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_URLs_Simple(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(remoteFile) -->
        /// </summary>
        public static System.Uri RemoteFile {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_URLs_RemoteFile(out exn).Consume<System.Uri>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_URLs_RemoteFile(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(localFile) -->
        /// </summary>
        public static System.Uri LocalFile {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_URLs_LocalFile(out exn).Consume<System.Uri>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_URLs_LocalFile(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static System.Uri Echo(
            System.Uri url
        ) {
            using var _urlHandle = new GCRef(url);
            return Check((out CreatedRef _exn) => __cs_URLs_echo(_urlHandle.ptr, out _exn)).Consume<System.Uri>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_URLs_echo(
            UnownedRef url,
            out CreatedRef exn
        );

        static URLs() { _TypeSetup._ensureLoaded(); }
    }
}
