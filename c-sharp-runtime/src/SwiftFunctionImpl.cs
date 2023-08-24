using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    internal class SwiftFunctionImpl : SwiftReference {

        internal SwiftFunctionImpl(ConsumedRef reference) : base(reference) {}

        internal object? invoke0() {
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0(
                this.internalReference, out exn
            ).Consume<object?>());
        }

        internal object? invoke1(object? p0) {
            using var a0 = new GCRef(p0);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1(
                this.internalReference, a0.ptr, out exn
            ).Consume<object?>());
        }

        internal object? invoke2(object? p0, object? p1) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2(
                this.internalReference, a0.ptr, a1.ptr, out exn
            ).Consume<object?>());
        }

        internal object? invoke3(object? p0, object? p1, object? p2) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3(
                this.internalReference, a0.ptr, a1.ptr, a2.ptr, out exn
            ).Consume<object?>());
        }

        internal object? invoke4(object? p0, object? p1, object? p2, object? p3) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            using var a3 = new GCRef(p3);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4(
                this.internalReference, a0.ptr, a1.ptr, a2.ptr, a3.ptr, out exn
            ).Consume<object?>());
        }

        internal object? invoke5(object? p0, object? p1, object? p2, object? p3, object? p4) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            using var a3 = new GCRef(p3);
            using var a4 = new GCRef(p4);
            return Check((out CreatedRef exn) => FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5(
                this.internalReference, a0.ptr, a1.ptr, a2.ptr, a3.ptr, a4.ptr, out exn
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
                this.internalReference, a0.ptr, a1.ptr, a2.ptr, a3.ptr, a4.ptr, a5.ptr, out exn
            ).Consume<object?>());
        }

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke0(
            UnownedRef self,
            out CreatedRef exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke1(
            UnownedRef self,
            UnownedRef p0,
            out CreatedRef exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke2(
            UnownedRef self,
            UnownedRef p0,
            UnownedRef p1,
            out CreatedRef exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke3(
            UnownedRef self,
            UnownedRef p0,
            UnownedRef p1,
            UnownedRef p2,
            out CreatedRef exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke4(
            UnownedRef self,
            UnownedRef p0,
            UnownedRef p1,
            UnownedRef p2,
            UnownedRef p3,
            out CreatedRef exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke5(
            UnownedRef self,
            UnownedRef p0,
            UnownedRef p1,
            UnownedRef p2,
            UnownedRef p3,
            UnownedRef p4,
            out CreatedRef exn
        );

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern CreatedRef FishyJoesCommonRuntime_SwiftFunctionImpl_invoke6(
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
        public static void FishyJoesCommonRuntime_Function0Converter_setup<R>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function0Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Func<R>)(() =>
                        (R)impl.invoke0()!
                    ));
                })),
                bag<Invoke0>((UnownedRef fn, out CreatedRef innerExn) => Catching(out innerExn, () =>
                    new CreatedRef(fn.Peek<System.Func<R>>()(
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function1Converter_setup<R, P0>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function1Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Func<P0, R>)((P0 p0) =>
                        (R)impl.invoke1(p0)!
                    ));
                })),
                bag<Invoke1>((UnownedRef fn, ConsumedRef p0, out CreatedRef innerExn) => Catching(out innerExn, () =>
                    new CreatedRef(fn.Peek<System.Func<P0, R>>()(
                        p0.Consume<P0>()
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function2Converter_setup<R, P0, P1>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function2Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Func<P0, P1, R>)((P0 p0, P1 p1) =>
                        (R)impl.invoke2(p0, p1)!
                    ));
                })),
                bag<Invoke2>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, out CreatedRef innerExn) => Catching(out innerExn, () =>
                    new CreatedRef(fn.Peek<System.Func<P0, P1, R>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>()
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function3Converter_setup<R, P0, P1, P2>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function3Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Func<P0, P1, P2, R>)((P0 p0, P1 p1, P2 p2) =>
                        (R)impl.invoke3(p0, p1, p2)!
                    ));
                })),
                bag<Invoke3>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, out CreatedRef innerExn) => Catching(out innerExn, () =>
                    new CreatedRef(fn.Peek<System.Func<P0, P1, P2, R>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>(),
                        p2.Consume<P2>()
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function4Converter_setup<R, P0, P1, P2, P3>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function4Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Func<P0, P1, P2, P3, R>)((P0 p0, P1 p1, P2 p2, P3 p3) =>
                        (R)impl.invoke4(p0, p1, p2, p3)!
                    ));
                })),
                bag<Invoke4>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, ConsumedRef p3, out CreatedRef innerExn) => Catching(out innerExn, () =>
                    new CreatedRef(fn.Peek<System.Func<P0, P1, P2, P3, R>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>(),
                        p2.Consume<P2>(),
                        p3.Consume<P3>()
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function5Converter_setup<R, P0, P1, P2, P3, P4>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function5Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Func<P0, P1, P2, P3, P4, R>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4) =>
                        (R)impl.invoke5(p0, p1, p2, p3, p4)!
                    ));
                })),
                bag<Invoke5>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, ConsumedRef p3, ConsumedRef p4, out CreatedRef innerExn) => Catching(out innerExn, () =>
                    new CreatedRef(fn.Peek<System.Func<P0, P1, P2, P3, P4, R>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>(),
                        p2.Consume<P2>(),
                        p3.Consume<P3>(),
                        p4.Consume<P4>()
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function6Converter_setup<R, P0, P1, P2, P3, P4, P5>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function6Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Func<P0, P1, P2, P3, P4, P5, R>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5) =>
                        (R)impl.invoke6(p0, p1, p2, p3, p4, p5)!
                    ));
                })),
                bag<Invoke6>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, ConsumedRef p3, ConsumedRef p4, ConsumedRef p5, out CreatedRef innerExn) => Catching(out innerExn, () =>
                    new CreatedRef(fn.Peek<System.Func<P0, P1, P2, P3, P4, P5, R>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>(),
                        p2.Consume<P2>(),
                        p3.Consume<P3>(),
                        p4.Consume<P4>(),
                        p5.Consume<P5>()
                    ))
                )),
                out exn
            );
        }

        delegate CreatedRef Constructor(ConsumedRef reference, out CreatedRef exn);
        delegate CreatedRef Invoke0(UnownedRef fn, out CreatedRef exn);
        delegate CreatedRef Invoke1(UnownedRef fn, ConsumedRef p0, out CreatedRef exn);
        delegate CreatedRef Invoke2(UnownedRef fn, ConsumedRef p0, ConsumedRef p1, out CreatedRef exn);
        delegate CreatedRef Invoke3(UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, out CreatedRef exn);
        delegate CreatedRef Invoke4(UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, ConsumedRef p3, out CreatedRef exn);
        delegate CreatedRef Invoke5(UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, ConsumedRef p3, ConsumedRef p4, out CreatedRef exn);
        delegate CreatedRef Invoke6(UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, ConsumedRef p3, ConsumedRef p4, ConsumedRef p5, out CreatedRef exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCommonRuntime_Function0Converter_setup(string typeName, Constructor constructor, Invoke0 invoke, out CreatedRef exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCommonRuntime_Function1Converter_setup(string typeName, Constructor constructor, Invoke1 invoke, out CreatedRef exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCommonRuntime_Function2Converter_setup(string typeName, Constructor constructor, Invoke2 invoke, out CreatedRef exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCommonRuntime_Function3Converter_setup(string typeName, Constructor constructor, Invoke3 invoke, out CreatedRef exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCommonRuntime_Function4Converter_setup(string typeName, Constructor constructor, Invoke4 invoke, out CreatedRef exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCommonRuntime_Function5Converter_setup(string typeName, Constructor constructor, Invoke5 invoke, out CreatedRef exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesCommonRuntime_Function6Converter_setup(string typeName, Constructor constructor, Invoke6 invoke, out CreatedRef exn);

        // MARK: Actions
        public static void FishyJoesCommonRuntime_Function0Converter_setup(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function0Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Action)(() =>
                        impl.invoke0()
                    ));
                })),
                bag<Invoke0>((UnownedRef fn, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    fn.Peek<System.Action>()(
                    );
                    return CreatedRef.Null;
                })),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function1Converter_setup<P0>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function1Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Action<P0>)((P0 p0) =>
                        impl.invoke1(p0)
                    ));
                })),
                bag<Invoke1>((UnownedRef fn, ConsumedRef p0, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    fn.Peek<System.Action<P0>>()(
                        p0.Consume<P0>()
                    );
                    return CreatedRef.Null;
                })),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function2Converter_setup<P0, P1>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function2Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Action<P0, P1>)((P0 p0, P1 p1) =>
                        impl.invoke2(p0, p1)
                    ));
                })),
                bag<Invoke2>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    fn.Peek<System.Action<P0, P1>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>()
                    );
                    return CreatedRef.Null;
                })),
                out exn
            );
        }


        public static void FishyJoesCommonRuntime_Function3Converter_setup<P0, P1, P2>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function3Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Action<P0, P1, P2>)((P0 p0, P1 p1, P2 p2) =>
                        impl.invoke3(p0, p1, p2)
                    ));
                })),
                bag<Invoke3>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    fn.Peek<System.Action<P0, P1, P2>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>(),
                        p2.Consume<P2>()
                    );
                    return CreatedRef.Null;
                })),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function4Converter_setup<P0, P1, P2, P3>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function4Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Action<P0, P1, P2, P3>)((P0 p0, P1 p1, P2 p2, P3 p3) =>
                        impl.invoke4(p0, p1, p2, p3)
                    ));
                })),
                bag<Invoke4>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, ConsumedRef p3, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    fn.Peek<System.Action<P0, P1, P2, P3>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>(),
                        p2.Consume<P2>(),
                        p3.Consume<P3>()
                    );
                    return CreatedRef.Null;
                })),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function5Converter_setup<P0, P1, P2, P3, P4>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function5Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Action<P0, P1, P2, P3, P4>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4) =>
                        impl.invoke5(p0, p1, p2, p3, p4)
                    ));
                })),
                bag<Invoke5>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, ConsumedRef p3, ConsumedRef p4, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    fn.Peek<System.Action<P0, P1, P2, P3, P4>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>(),
                        p2.Consume<P2>(),
                        p3.Consume<P3>(),
                        p4.Consume<P4>()
                    );
                    return CreatedRef.Null;
                })),
                out exn
            );
        }

        public static void FishyJoesCommonRuntime_Function6Converter_setup<P0, P1, P2, P3, P4, P5>(string name, out CreatedRef exn) {
            FishyJoesCommonRuntime_Function6Converter_setup(
                name,
                bag<Constructor>((ConsumedRef swiftRef, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return new CreatedRef((System.Action<P0, P1, P2, P3, P4, P5>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5) =>
                        impl.invoke6(p0, p1, p2, p3, p4, p5)
                    ));
                })),
                bag<Invoke6>((UnownedRef fn, ConsumedRef p0, ConsumedRef p1, ConsumedRef p2, ConsumedRef p3, ConsumedRef p4, ConsumedRef p5, out CreatedRef innerExn) => Catching(out innerExn, () => {
                    fn.Peek<System.Action<P0, P1, P2, P3, P4, P5>>()(
                        p0.Consume<P0>(),
                        p1.Consume<P1>(),
                        p2.Consume<P2>(),
                        p3.Consume<P3>(),
                        p4.Consume<P4>(),
                        p5.Consume<P5>()
                    );
                    return CreatedRef.Null;
                })),
                out exn
            );
        }

        private static void setupFunctions() {
            // Generic types need to be set up as instantiated types, so nothing to do here.
        }
    }
}
