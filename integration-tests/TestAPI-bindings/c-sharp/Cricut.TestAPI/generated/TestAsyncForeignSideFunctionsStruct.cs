using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestAsyncForeignSideFunctionsStruct, conformances: [TestAsyncFunctions]) -->
    /// </summary>
    public record TestAsyncForeignSideFunctionsStruct: TestAsyncFunctions {
        public System.Func<System.Threading.Tasks.Task<nint>> GetConst42() {
            return Const42;
        }
        public System.Func<System.Threading.Tasks.Task<nint>> Const42 { get; internal set; }
        public System.Func<nint, System.Threading.Tasks.Task<nint>> GetIabs() {
            return Iabs;
        }
        public System.Func<nint, System.Threading.Tasks.Task<nint>> Iabs { get; internal set; }
        public System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> GetIntCompose() {
            return IntCompose;
        }
        public System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> IntCompose { get; internal set; }
        public System.Func<float, double, nint, System.Threading.Tasks.Task<double>> GetAdd3Things() {
            return Add3Things;
        }
        public System.Func<float, double, nint, System.Threading.Tasks.Task<double>> Add3Things { get; internal set; }
        public System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> GetMakeList() {
            return MakeList;
        }
        public System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> MakeList { get; internal set; }
        public System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> GetFifthThing() {
            return FifthThing;
        }
        public System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> FifthThing { get; internal set; }
        public System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> GetSix() {
            return Six;
        }
        public System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> Six { get; internal set; }
        public System.Func<System.Threading.Tasks.Task<nint>> GetWillThrow() {
            return WillThrow;
        }
        public System.Func<System.Threading.Tasks.Task<nint>> WillThrow { get; internal set; }
        public System.Func<System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>> GetExercise0Fun() {
            return Exercise0Fun;
        }
        public System.Func<System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>> Exercise0Fun { get; internal set; }
        public System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>> GetExercise1Fun() {
            return Exercise1Fun;
        }
        public System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>> Exercise1Fun { get; internal set; }
        public System.Func<System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>, System.Threading.Tasks.Task<string>> GetExercise2Fun() {
            return Exercise2Fun;
        }
        public System.Func<System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>, System.Threading.Tasks.Task<string>> Exercise2Fun { get; internal set; }
        public System.Func<System.Func<float, double, nint, System.Threading.Tasks.Task<double>>, System.Threading.Tasks.Task<string>> GetExercise3Fun() {
            return Exercise3Fun;
        }
        public System.Func<System.Func<float, double, nint, System.Threading.Tasks.Task<double>>, System.Threading.Tasks.Task<string>> Exercise3Fun { get; internal set; }
        public System.Func<System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>>, System.Threading.Tasks.Task<string>> GetExercise4Fun() {
            return Exercise4Fun;
        }
        public System.Func<System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>>, System.Threading.Tasks.Task<string>> Exercise4Fun { get; internal set; }
        public System.Func<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>>, System.Threading.Tasks.Task<string>> GetExercise5Fun() {
            return Exercise5Fun;
        }
        public System.Func<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>>, System.Threading.Tasks.Task<string>> Exercise5Fun { get; internal set; }
        public System.Func<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>> GetExercise6Fun() {
            return Exercise6Fun;
        }
        public System.Func<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>> Exercise6Fun { get; internal set; }
        public System.Func<System.Func<System.Threading.Tasks.Task>, System.Func<System.Threading.Tasks.Task>> GetThunkTwiceMakerFun() {
            return ThunkTwiceMakerFun;
        }
        public System.Func<System.Func<System.Threading.Tasks.Task>, System.Func<System.Threading.Tasks.Task>> ThunkTwiceMakerFun { get; internal set; }

        public TestAsyncForeignSideFunctionsStruct(
            System.Func<System.Threading.Tasks.Task<nint>> Const42,
            System.Func<nint, System.Threading.Tasks.Task<nint>> Iabs,
            System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>> IntCompose,
            System.Func<float, double, nint, System.Threading.Tasks.Task<double>> Add3Things,
            System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>> MakeList,
            System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>> FifthThing,
            System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>> Six,
            System.Func<System.Threading.Tasks.Task<nint>> WillThrow,
            System.Func<System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>> Exercise0Fun,
            System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>> Exercise1Fun,
            System.Func<System.Func<System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>, System.Func<nint, System.Threading.Tasks.Task<nint>>>, System.Threading.Tasks.Task<string>> Exercise2Fun,
            System.Func<System.Func<float, double, nint, System.Threading.Tasks.Task<double>>, System.Threading.Tasks.Task<string>> Exercise3Fun,
            System.Func<System.Func<string, string, string, string, System.Threading.Tasks.Task<System.Collections.Generic.IList<string>>>, System.Threading.Tasks.Task<string>> Exercise4Fun,
            System.Func<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<System.Func<System.Threading.Tasks.Task<nint>>>>, System.Threading.Tasks.Task<string>> Exercise5Fun,
            System.Func<System.Func<string, nint, double, string, System.Func<System.Threading.Tasks.Task<nint>>, nint, System.Threading.Tasks.Task<nint>>, System.Threading.Tasks.Task<string>> Exercise6Fun,
            System.Func<System.Func<System.Threading.Tasks.Task>, System.Func<System.Threading.Tasks.Task>> ThunkTwiceMakerFun
        ) {
            this.Const42 = Const42;
            this.Iabs = Iabs;
            this.IntCompose = IntCompose;
            this.Add3Things = Add3Things;
            this.MakeList = MakeList;
            this.FifthThing = FifthThing;
            this.Six = Six;
            this.WillThrow = WillThrow;
            this.Exercise0Fun = Exercise0Fun;
            this.Exercise1Fun = Exercise1Fun;
            this.Exercise2Fun = Exercise2Fun;
            this.Exercise3Fun = Exercise3Fun;
            this.Exercise4Fun = Exercise4Fun;
            this.Exercise5Fun = Exercise5Fun;
            this.Exercise6Fun = Exercise6Fun;
            this.ThunkTwiceMakerFun = ThunkTwiceMakerFun;
        }

        /// <summary>
        /// <!-- FishyJoes.export(exercise0) -->
        /// </summary>
        public System.Threading.Tasks.Task<string> Exercise0(
            System.Func<System.Threading.Tasks.Task<nint>> fn
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fnHandle = new GCRef(fn);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise0(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise1(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise2(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise3(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise4(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise5(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6(Loader.env, _thisHandle.ptr, _fnHandle.ptr, out _exn)).Consume<System.Threading.Tasks.Task<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_exercise6(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker(Loader.env, _thisHandle.ptr, _thunkHandle.ptr, out _exn)).Consume<System.Func<System.Threading.Tasks.Task>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_thunkTwiceMaker(
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
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness(Loader.env, _thisHandle.ptr, out _exn)).Consume<Cricut.TestAPI.TestAsyncFunctions>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestAsyncForeignSideFunctionsStruct_witness(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static TestAsyncForeignSideFunctionsStruct() { _TypeSetup._ensureLoaded(); }
    }
}
