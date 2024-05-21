using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    internal class SwiftFunctionImpl : SwiftReference {

        internal SwiftFunctionImpl(ConsumedRef reference) : base(reference) {}

        internal object? invoke0() {
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0(
                Loader.env, this.internalReference, out exn
            ).Consume<object?>());
        }

        internal object? invoke1(object? p0) {
            using var a0 = new GCRef(p0);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1(
                Loader.env, this.internalReference, a0.ptr, out exn
            ).Consume<object?>());
        }

        internal object? invoke2(object? p0, object? p1) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2(
                Loader.env, this.internalReference, a0.ptr, a1.ptr, out exn
            ).Consume<object?>());
        }

        internal object? invoke3(object? p0, object? p1, object? p2) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3(
                Loader.env, this.internalReference, a0.ptr, a1.ptr, a2.ptr, out exn
            ).Consume<object?>());
        }

        internal object? invoke4(object? p0, object? p1, object? p2, object? p3) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            using var a3 = new GCRef(p3);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4(
                Loader.env, this.internalReference, a0.ptr, a1.ptr, a2.ptr, a3.ptr, out exn
            ).Consume<object?>());
        }

        internal object? invoke5(object? p0, object? p1, object? p2, object? p3, object? p4) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            using var a3 = new GCRef(p3);
            using var a4 = new GCRef(p4);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5(
                Loader.env, this.internalReference, a0.ptr, a1.ptr, a2.ptr, a3.ptr, a4.ptr, out exn
            ).Consume<object?>());
        }

        internal object? invoke6(object? p0, object? p1, object? p2, object? p3, object? p4, object? p5) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            using var a3 = new GCRef(p3);
            using var a4 = new GCRef(p4);
            using var a5 = new GCRef(p5);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke6(
                Loader.env, this.internalReference, a0.ptr, a1.ptr, a2.ptr, a3.ptr, a4.ptr, a5.ptr, out exn
            ).Consume<object?>());
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef p0,
            out CreatedRef exn
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef p0,
            UnownedRef p1,
            out CreatedRef exn
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef p0,
            UnownedRef p1,
            UnownedRef p2,
            out CreatedRef exn
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef p0,
            UnownedRef p1,
            UnownedRef p2,
            UnownedRef p3,
            out CreatedRef exn
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef p0,
            UnownedRef p1,
            UnownedRef p2,
            UnownedRef p3,
            UnownedRef p4,
            out CreatedRef exn
        );

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke6(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef p0,
            UnownedRef p1,
            UnownedRef p2,
            UnownedRef p3,
            UnownedRef p4,
            UnownedRef p5,
            out CreatedRef exn
        );
    }

    public partial class Loader {
        public static void FishyJoesCommonRuntime_Function0Converter_setup<R>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Func<R>)(() =>
                            (R)impl.invoke0()!
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () =>
                        new CreatedRef(fn.Peek<System.Func<R>>()(
                        ))
                    )),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function1Converter_setup<R, P0>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Func<P0, R>)((P0 p0) =>
                            (R)impl.invoke1(p0)!
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () =>
                        new CreatedRef(fn.Peek<System.Func<P0, R>>()(
                            arguments[0].Consume<P0>()
                        ))
                    )),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function2Converter_setup<R, P0, P1>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Func<P0, P1, R>)((P0 p0, P1 p1) =>
                            (R)impl.invoke2(p0, p1)!
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () =>
                        new CreatedRef(fn.Peek<System.Func<P0, P1, R>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>()
                        ))
                    )),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function3Converter_setup<R, P0, P1, P2>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Func<P0, P1, P2, R>)((P0 p0, P1 p1, P2 p2) =>
                            (R)impl.invoke3(p0, p1, p2)!
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () =>
                        new CreatedRef(fn.Peek<System.Func<P0, P1, P2, R>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>(),
                            arguments[2].Consume<P2>()
                        ))
                    )),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function4Converter_setup<R, P0, P1, P2, P3>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Func<P0, P1, P2, P3, R>)((P0 p0, P1 p1, P2 p2, P3 p3) =>
                            (R)impl.invoke4(p0, p1, p2, p3)!
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () =>
                        new CreatedRef(fn.Peek<System.Func<P0, P1, P2, P3, R>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>(),
                            arguments[2].Consume<P2>(),
                            arguments[3].Consume<P3>()
                        ))
                    )),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function5Converter_setup<R, P0, P1, P2, P3, P4>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Func<P0, P1, P2, P3, P4, R>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4) =>
                            (R)impl.invoke5(p0, p1, p2, p3, p4)!
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () =>
                        new CreatedRef(fn.Peek<System.Func<P0, P1, P2, P3, P4, R>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>(),
                            arguments[2].Consume<P2>(),
                            arguments[3].Consume<P3>(),
                            arguments[4].Consume<P4>()
                        ))
                    )),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function6Converter_setup<R, P0, P1, P2, P3, P4, P5>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Func<P0, P1, P2, P3, P4, P5, R>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5) =>
                            (R)impl.invoke6(p0, p1, p2, p3, p4, p5)!
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () =>
                        new CreatedRef(fn.Peek<System.Func<P0, P1, P2, P3, P4, P5, R>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>(),
                            arguments[2].Consume<P2>(),
                            arguments[3].Consume<P3>(),
                            arguments[4].Consume<P4>(),
                            arguments[5].Consume<P5>()
                        ))
                    )),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_AsyncFunction0Converter_setup(IntPtr envRef, out CreatedRef exn) {
            exn = CreatedRef.Null;
        }
        public static void FishyJoesCommonRuntime_AsyncFunction1Converter_setup(IntPtr envRef, out CreatedRef exn) {
            exn = CreatedRef.Null;
        }
        public static void FishyJoesCommonRuntime_AsyncFunction2Converter_setup(IntPtr envRef, out CreatedRef exn) {
            exn = CreatedRef.Null;
        }
        public static void FishyJoesCommonRuntime_AsyncFunction3Converter_setup(IntPtr envRef, out CreatedRef exn) {
            exn = CreatedRef.Null;
        }
        public static void FishyJoesCommonRuntime_AsyncFunction4Converter_setup(IntPtr envRef, out CreatedRef exn) {
            exn = CreatedRef.Null;
        }
        public static void FishyJoesCommonRuntime_AsyncFunction5Converter_setup(IntPtr envRef, out CreatedRef exn) {
            exn = CreatedRef.Null;
        }
        public static void FishyJoesCommonRuntime_AsyncFunction6Converter_setup(IntPtr envRef, out CreatedRef exn) {
            exn = CreatedRef.Null;
        }

        delegate CreatedRef Constructor(IntPtr context, ConsumedRef reference, out CreatedRef exn);
        unsafe delegate CreatedRef InvokeMethod(IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef exn);

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        extern static void FishyJoesCommonRuntime_FunctionConverter_setup(
            IntPtr envRef,
            string typeName,
            Constructor constructor,
            InvokeMethod invoke,
            IntPtr context,
            out CreatedRef exn
        );

        // MARK: Actions
        public static void FishyJoesCommonRuntime_Function0Converter_setup(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Action)(() =>
                            impl.invoke0()
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        fn.Peek<System.Action>()(
                        );
                        return CreatedRef.Null;
                    })),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function1Converter_setup<P0>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Action<P0>)((P0 p0) =>
                            impl.invoke1(p0)
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        fn.Peek<System.Action<P0>>()(
                            arguments[0].Consume<P0>()
                        );
                        return CreatedRef.Null;
                    })),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function2Converter_setup<P0, P1>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Action<P0, P1>)((P0 p0, P1 p1) =>
                            impl.invoke2(p0, p1)
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        fn.Peek<System.Action<P0, P1>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>()
                        );
                        return CreatedRef.Null;
                    })),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function3Converter_setup<P0, P1, P2>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Action<P0, P1, P2>)((P0 p0, P1 p1, P2 p2) =>
                            impl.invoke3(p0, p1, p2)
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        fn.Peek<System.Action<P0, P1, P2>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>(),
                            arguments[2].Consume<P2>()
                        );
                        return CreatedRef.Null;
                    })),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function4Converter_setup<P0, P1, P2, P3>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Action<P0, P1, P2, P3>)((P0 p0, P1 p1, P2 p2, P3 p3) =>
                            impl.invoke4(p0, p1, p2, p3)
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        fn.Peek<System.Action<P0, P1, P2, P3>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>(),
                            arguments[2].Consume<P2>(),
                            arguments[3].Consume<P3>()
                        );
                        return CreatedRef.Null;
                    })),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function5Converter_setup<P0, P1, P2, P3, P4>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Action<P0, P1, P2, P3, P4>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4) =>
                            impl.invoke5(p0, p1, p2, p3, p4)
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        fn.Peek<System.Action<P0, P1, P2, P3, P4>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>(),
                            arguments[2].Consume<P2>(),
                            arguments[3].Consume<P3>(),
                            arguments[4].Consume<P4>()
                        );
                        return CreatedRef.Null;
                    })),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        public static void FishyJoesCommonRuntime_Function6Converter_setup<P0, P1, P2, P3, P4, P5>(IntPtr envRef, string name, out CreatedRef exn) {
            unsafe {
                FishyJoesCommonRuntime_FunctionConverter_setup(
                    envRef,
                    name,
                    bag<Constructor>((IntPtr context, ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        var impl = new SwiftFunctionImpl(swiftRef);
                        return new CreatedRef((System.Action<P0, P1, P2, P3, P4, P5>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5) =>
                            impl.invoke6(p0, p1, p2, p3, p4, p5)
                        ));
                    })),
                    bag<InvokeMethod>((IntPtr context, UnownedRef fn, ConsumedRef* arguments, out CreatedRef innerExn) => Catching(out innerExn, () => {
                        fn.Peek<System.Action<P0, P1, P2, P3, P4, P5>>()(
                            arguments[0].Consume<P0>(),
                            arguments[1].Consume<P1>(),
                            arguments[2].Consume<P2>(),
                            arguments[3].Consume<P3>(),
                            arguments[4].Consume<P4>(),
                            arguments[5].Consume<P5>()
                        );
                        return CreatedRef.Null;
                    })),
                    IntPtr.Zero,
                    out exn
                );
            }
        }

        private static void setupFunctions() {
            // Generic types need to be set up as instantiated types, so nothing to do here.
        }
    }
}
