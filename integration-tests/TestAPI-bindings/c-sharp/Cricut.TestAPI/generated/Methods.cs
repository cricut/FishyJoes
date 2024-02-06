using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Methods) -->
    /// </summary>
    public class Methods : SwiftReference {
        internal Methods(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(staticGet) -->
        /// </summary>
        public static nint GetStaticGet() {
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_Methods_staticGet(Loader.env, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Methods_staticGet(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.exportAsMethod(staticGetMethod) -->
        /// </summary>
        public static nint GetStaticGetMethod() {
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_Methods_staticGetMethod(Loader.env, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Methods_staticGetMethod(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(staticModifiable) -->
        /// </summary>
        public static nint GetStaticModifiable() {
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_Methods_staticModifiable(Loader.env, out exn)
            );
        }
        public static void SetStaticModifiable(nint value) {
            Check((out CreatedRef exn) =>
                __iota_set_TestAPI_Methods_staticModifiable(Loader.env, value, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Methods_staticModifiable(IntPtr envRef, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_Methods_staticModifiable(IntPtr envRef, nint value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(staticStored) -->
        /// </summary>
        public static nint StaticStored {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Methods_staticStored(Loader.env, out exn)
                );
            }
            set {
                Check((out CreatedRef exn) =>
                    __iota_set_TestAPI_Methods_staticStored(Loader.env, value, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Methods_staticStored(IntPtr envRef, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_Methods_staticStored(IntPtr envRef, nint value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(instanceGet) -->
        /// </summary>
        public nint GetInstanceGet() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_Methods_instanceGet(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Methods_instanceGet(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(garply) -->
        /// </summary>
        public nint GetGarply() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_Methods_garply(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Methods_garply(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.exportAsMethod(instanceGetMethod) -->
        /// </summary>
        public nint GetInstanceGetMethod() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_Methods_instanceGetMethod(Loader.env, thisHandle.ptr, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Methods_instanceGetMethod(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(instanceModifiable) -->
        /// </summary>
        public nint GetInstanceModifiable() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_Methods_instanceModifiable(Loader.env, thisHandle.ptr, out exn)
            );
        }
        public void SetInstanceModifiable(nint value) {
            using var thisHandle = new GCRef(this);
            Check((out CreatedRef exn) =>
                __iota_set_TestAPI_Methods_instanceModifiable(Loader.env, thisHandle.ptr, value, out exn)
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Methods_instanceModifiable(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_Methods_instanceModifiable(IntPtr envRef, UnownedRef self, nint value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(instanceStored) -->
        /// </summary>
        public nint InstanceStored {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Methods_instanceStored(Loader.env, thisHandle.ptr, out exn)
                );
            }
            set {
                using var thisHandle = new GCRef(this);
                Check((out CreatedRef exn) =>
                    __iota_set_TestAPI_Methods_instanceStored(Loader.env, thisHandle.ptr, value, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_get_TestAPI_Methods_instanceStored(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_Methods_instanceStored(IntPtr envRef, UnownedRef self, nint value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public static Cricut.TestAPI.Methods Create(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_create(Loader.env, out _exn)).Consume<Cricut.TestAPI.Methods>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_create(
            IntPtr envRef,
            out CreatedRef exn
        );

        static Methods() { _TypeSetup._ensureLoaded(); }
    }
}
