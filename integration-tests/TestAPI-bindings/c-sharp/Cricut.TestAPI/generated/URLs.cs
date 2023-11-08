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
                    __iota_get_TestAPI_URLs_simple(Loader.env, out exn).Consume<System.Uri>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_URLs_simple(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(remoteFile) -->
        /// </summary>
        public static System.Uri RemoteFile {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_URLs_remoteFile(Loader.env, out exn).Consume<System.Uri>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_URLs_remoteFile(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(localFile) -->
        /// </summary>
        public static System.Uri LocalFile {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_URLs_localFile(Loader.env, out exn).Consume<System.Uri>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_URLs_localFile(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static System.Uri Echo(
            System.Uri url
        ) {
            using var _urlHandle = new GCRef(url);
            return Check((out CreatedRef _exn) => __iota_TestAPI_URLs_echo(Loader.env, _urlHandle.ptr, out _exn)).Consume<System.Uri>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_URLs_echo(
            IntPtr envRef,
            UnownedRef url,
            out CreatedRef exn
        );

        static URLs() { _TypeSetup._ensureLoaded(); }
    }
}
