using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestAsyncSwiftSideFunctionsClass) -->
    /// </summary>
    public class TestAsyncSwiftSideFunctionsClass : SwiftReference, Cricut.TestAPI.TestAsyncFunctions {
        internal TestAsyncSwiftSideFunctionsClass(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(add3Things) -->
        /// </summary>
        public System.Func<float, double, nint, System.Threading.Tasks.Task<double>> GetAdd3Things() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_add3Things(Loader.env, thisHandle.ptr, out exn).Consume<System.Func<float, double, nint, System.Threading.Tasks.Task<double>>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_add3Things(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(const42) -->
        /// </summary>
        public System.Func<System.Threading.Tasks.Task<nint>> GetConst42() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_const42(Loader.env, thisHandle.ptr, out exn).Consume<System.Func<System.Threading.Tasks.Task<nint>>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_const42(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(fifthThing) -->
        /// </summary>
        public System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> GetFifthThing() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_fifthThing(Loader.env, thisHandle.ptr, out exn).Consume<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_fifthThing(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(iabs) -->
        /// </summary>
        public System.Func<nint, System.Threading.Tasks.Task<nint>> GetIabs() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_iabs(Loader.env, thisHandle.ptr, out exn).Consume<System.Func<nint, System.Threading.Tasks.Task<nint>>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_iabs(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(intCompose) -->
        /// </summary>
        public System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> GetIntCompose() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_intCompose(Loader.env, thisHandle.ptr, out exn).Consume<System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_intCompose(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(makeList) -->
        /// </summary>
        public System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> GetMakeList() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_makeList(Loader.env, thisHandle.ptr, out exn).Consume<System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_makeList(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(six) -->
        /// </summary>
        public System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> GetSix() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_six(Loader.env, thisHandle.ptr, out exn).Consume<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_six(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(willThrow) -->
        /// </summary>
        public System.Func<System.Threading.Tasks.Task<nint>> GetWillThrow() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_willThrow(Loader.env, thisHandle.ptr, out exn).Consume<System.Func<System.Threading.Tasks.Task<nint>>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestAsyncSwiftSideFunctionsClass_willThrow(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(exercise0) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise0(
            System.Func<System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise0(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise0(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise1) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise1(
            System.Func<nint, System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise1(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise1(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise2) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise2(
            System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise2(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise2(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise3) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise3(
            System.Func<float, double, nint, System.Threading.Tasks.Task<double>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise3(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise3(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise4) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise4(
            System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise4(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise4(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise5) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise5(
            System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise5(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise5(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(exercise6) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise6(
            System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise6(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_exercise6(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fn,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(thunkTwiceMaker) -->
        /// </summary>
        public System.Func<System.Threading.Tasks.Task> ThunkTwiceMaker(
            System.Func<System.Threading.Tasks.Task> thunk
        ) {
            using var _thisHandle = new GCRef(this);
            using var _thunkHandle = new GCRef(thunk);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_thunkTwiceMaker(Loader.env, _thisHandle.ptr, _thunkHandle.ptr, out _exn)).Consume<System.Func<System.Threading.Tasks.Task>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_thunkTwiceMaker(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef thunk,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(witness) -->
        /// </summary>
        public Cricut.TestAPI.TestAsyncFunctions Witness(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_witness(Loader.env, _thisHandle.ptr, out _exn)).Consume<Cricut.TestAPI.TestAsyncFunctions>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_witness(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(init) -->
        /// </summary>
        public static Cricut.TestAPI.TestAsyncSwiftSideFunctionsClass Init(
        ) {
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_init(Loader.env, out _exn)).Consume<Cricut.TestAPI.TestAsyncSwiftSideFunctionsClass>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncSwiftSideFunctionsClass_init(
            IntPtr envRef,
            out CreatedRef exn
        );

        static TestAsyncSwiftSideFunctionsClass() { _TypeSetup._ensureLoaded(); }
    }
}
