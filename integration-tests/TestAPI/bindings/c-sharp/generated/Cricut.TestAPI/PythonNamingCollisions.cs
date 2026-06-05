using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(PythonNamingCollisions) -->
    /// </summary>
    public record PythonNamingCollisions {
        private PythonNamingCollisions() {}

        /// <summary>
        /// <!-- FishyJoes.export(class) -->
        /// </summary>
        public staticnint Class {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_PythonNamingCollisions_class(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_PythonNamingCollisions_class(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(__dunder__) -->
        /// </summary>
        public staticnint __dunder__ {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_PythonNamingCollisions___dunder__(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_PythonNamingCollisions___dunder__(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(isNaN) -->
        /// </summary>
        public staticbool IsNaN {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_PythonNamingCollisions_isNaN(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        [return: MarshalAs(UnmanagedType.I1)]
        private static extern bool __iota_get_TestAPI_PythonNamingCollisions_isNaN(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(_leadingUnderscore) -->
        /// </summary>
        public staticnint _leadingUnderscore {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_PythonNamingCollisions__leadingUnderscore(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_PythonNamingCollisions__leadingUnderscore(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(list) -->
        /// </summary>
        public staticnint List {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_PythonNamingCollisions_list(Loader.env, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_PythonNamingCollisions_list(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(Url) -->
        /// </summary>
        public staticstring Url {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_PythonNamingCollisions_Url(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_PythonNamingCollisions_Url(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(URL) -->
        /// </summary>
        public staticstring URL {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_PythonNamingCollisions_URL(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_PythonNamingCollisions_URL(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(from) -->
        /// </summary>
        public staticstring From(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_PythonNamingCollisions_from(Loader.env, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_PythonNamingCollisions_from(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(keywordArgs) -->
        /// </summary>
        public staticnint KeywordArgs(
            nint _class,
            nint list
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_PythonNamingCollisions_keywordArgs(Loader.env, _class, list, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_PythonNamingCollisions_keywordArgs(
            IntPtr envRef,
            nint _class,
            nint list,
            out CreatedRef exn
        );

        static PythonNamingCollisions() { _TypeSetup._ensureLoaded(); }
    }
}
