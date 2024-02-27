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

        /// <summary>
        /// <!-- FishyJoes.export(doublePlusGood) -->
        /// </summary>
        public nint DoublePlusGood(
            nint a,
            double b
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_doublePlusGood(Loader.env, _thisHandle.ptr, a, b, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_Methods_doublePlusGood(
            IntPtr envRef,
            UnownedRef self,
            nint a,
            double b,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(async42) -->
        /// </summary>
        public System.Threading.Tasks.Task<nint> Async42(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_async42(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_async42(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(asyncYield) -->
        /// </summary>
        public System.Threading.Tasks.Task<nint> AsyncYield(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_asyncYield(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_asyncYield(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(asyncSleep) -->
        /// </summary>
        public System.Threading.Tasks.Task<nint> AsyncSleep(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_asyncSleep(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_asyncSleep(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(asyncVoid) -->
        /// </summary>
        public System.Threading.Tasks.Task AsyncVoid(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_asyncVoid(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_asyncVoid(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(asyncDouble) -->
        /// </summary>
        public System.Threading.Tasks.Task<double> AsyncDouble(
            double d
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_asyncDouble(Loader.env, _thisHandle.ptr, d, out _exn)).Consume<System.Threading.Tasks.Task<double>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_asyncDouble(
            IntPtr envRef,
            UnownedRef self,
            double d,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(asyncMultipleArgs) -->
        /// </summary>
        public System.Threading.Tasks.Task<nint> AsyncMultipleArgs(
            nint i,
            System.Func<System.Threading.Tasks.Task<nint>> j
        ) {
            using var _thisHandle = new GCRef(this);
            using var _jHandle = new GCRef(j);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_asyncMultipleArgs(Loader.env, _thisHandle.ptr, i, _jHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_asyncMultipleArgs(
            IntPtr envRef,
            UnownedRef self,
            nint i,
            UnownedRef j,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(asyncThrowing) -->
        /// </summary>
        public System.Threading.Tasks.Task AsyncThrowing(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_asyncThrowing(Loader.env, _thisHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_asyncThrowing(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(asyncCallbackFunc0) -->
        /// </summary>
        public System.Threading.Tasks.Task<nint> AsyncCallbackFunc0(
            System.Func<System.Threading.Tasks.Task<nint>> callback
        ) {
            using var _thisHandle = new GCRef(this);
            using var _callbackHandle = new GCRef(callback);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_asyncCallbackFunc0(Loader.env, _thisHandle.ptr, _callbackHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_asyncCallbackFunc0(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef callback,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(staticAsync42) -->
        /// </summary>
        public static System.Threading.Tasks.Task<nint> StaticAsync42(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_staticAsync42(Loader.env, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_staticAsync42(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(staticAsyncYield) -->
        /// </summary>
        public static System.Threading.Tasks.Task<nint> StaticAsyncYield(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_staticAsyncYield(Loader.env, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_staticAsyncYield(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(staticAsyncSleep) -->
        /// </summary>
        public static System.Threading.Tasks.Task<nint> StaticAsyncSleep(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_staticAsyncSleep(Loader.env, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_staticAsyncSleep(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(staticAsyncVoid) -->
        /// </summary>
        public static System.Threading.Tasks.Task StaticAsyncVoid(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_staticAsyncVoid(Loader.env, out _exn)).Consume<System.Threading.Tasks.Task>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_staticAsyncVoid(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(staticAsyncDouble) -->
        /// </summary>
        public static System.Threading.Tasks.Task<double> StaticAsyncDouble(
            double d
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_staticAsyncDouble(Loader.env, d, out _exn)).Consume<System.Threading.Tasks.Task<double>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_staticAsyncDouble(
            IntPtr envRef,
            double d,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(staticAsyncMultipleArgs) -->
        /// </summary>
        public static System.Threading.Tasks.Task<nint> StaticAsyncMultipleArgs(
            nint i,
            System.Func<System.Threading.Tasks.Task<nint>> j
        ) {
            using var _jHandle = new GCRef(j);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_staticAsyncMultipleArgs(Loader.env, i, _jHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_staticAsyncMultipleArgs(
            IntPtr envRef,
            nint i,
            UnownedRef j,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(staticAsyncThrowing) -->
        /// </summary>
        public static System.Threading.Tasks.Task StaticAsyncThrowing(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_staticAsyncThrowing(Loader.env, out _exn)).Consume<System.Threading.Tasks.Task>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_staticAsyncThrowing(
            IntPtr envRef,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(staticAsyncCallbackFunc0) -->
        /// </summary>
        public static System.Threading.Tasks.Task<nint> StaticAsyncCallbackFunc0(
            System.Func<System.Threading.Tasks.Task<nint>> callback
        ) {
            using var _callbackHandle = new GCRef(callback);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Methods_staticAsyncCallbackFunc0(Loader.env, _callbackHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<nint>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Methods_staticAsyncCallbackFunc0(
            IntPtr envRef,
            UnownedRef callback,
            out CreatedRef exn
        );

        static Methods() { _TypeSetup._ensureLoaded(); }
    }
}
