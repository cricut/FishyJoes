using System;
using System.Runtime.InteropServices;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    internal class SwiftFunctionImpl : SwiftReference {

        internal SwiftFunctionImpl(IntPtr reference) : base(reference) {}

        internal object? invoke0() {
            return Check((out IntPtr exn) => ConsumeHandle<object?>(FishyJoesRuntime_SwiftFunctionImpl_invoke0(
                this.reference, out exn
            )));
        }

        internal object? invoke1(object? p0) {
            using var a0 = new GCRef(p0);
            return Check((out IntPtr exn) => ConsumeHandle<object?>(FishyJoesRuntime_SwiftFunctionImpl_invoke1(
                this.reference, a0.ptr, out exn
            )));
        }

        internal object? invoke2(object? p0, object? p1) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            return Check((out IntPtr exn) => ConsumeHandle<object?>(FishyJoesRuntime_SwiftFunctionImpl_invoke2(
                this.reference, a0.ptr, a1.ptr, out exn
            )));
        }

        internal object? invoke3(object? p0, object? p1, object? p2) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            return Check((out IntPtr exn) => ConsumeHandle<object?>(FishyJoesRuntime_SwiftFunctionImpl_invoke3(
                this.reference, a0.ptr, a1.ptr, a2.ptr, out exn
            )));
        }

        internal object? invoke4(object? p0, object? p1, object? p2, object? p3) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            using var a3 = new GCRef(p3);
            return Check((out IntPtr exn) => ConsumeHandle<object?>(FishyJoesRuntime_SwiftFunctionImpl_invoke4(
                this.reference, a0.ptr, a1.ptr, a2.ptr, a3.ptr, out exn
            )));
        }

        internal object? invoke5(object? p0, object? p1, object? p2, object? p3, object? p4) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            using var a3 = new GCRef(p3);
            using var a4 = new GCRef(p4);
            return Check((out IntPtr exn) => ConsumeHandle<object?>(FishyJoesRuntime_SwiftFunctionImpl_invoke5(
                this.reference, a0.ptr, a1.ptr, a2.ptr, a3.ptr, a4.ptr, out exn
            )));
        }

        internal object? invoke6(object? p0, object? p1, object? p2, object? p3, object? p4, object? p5) {
            using var a0 = new GCRef(p0);
            using var a1 = new GCRef(p1);
            using var a2 = new GCRef(p2);
            using var a3 = new GCRef(p3);
            using var a4 = new GCRef(p4);
            using var a5 = new GCRef(p5);
            return Check((out IntPtr exn) => ConsumeHandle<object?>(FishyJoesRuntime_SwiftFunctionImpl_invoke6(
                this.reference, a0.ptr, a1.ptr, a2.ptr, a3.ptr, a4.ptr, a5.ptr, out exn
            )));
        }

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern IntPtr FishyJoesRuntime_SwiftFunctionImpl_invoke0(IntPtr self, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern IntPtr FishyJoesRuntime_SwiftFunctionImpl_invoke1(IntPtr self, IntPtr p0, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern IntPtr FishyJoesRuntime_SwiftFunctionImpl_invoke2(IntPtr self, IntPtr p0, IntPtr p1, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern IntPtr FishyJoesRuntime_SwiftFunctionImpl_invoke3(IntPtr self, IntPtr p0, IntPtr p1, IntPtr p2, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern IntPtr FishyJoesRuntime_SwiftFunctionImpl_invoke4(IntPtr self, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern IntPtr FishyJoesRuntime_SwiftFunctionImpl_invoke5(IntPtr self, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, IntPtr p4, out IntPtr exn);
        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern IntPtr FishyJoesRuntime_SwiftFunctionImpl_invoke6(IntPtr self, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, IntPtr p4, IntPtr p5, out IntPtr exn);
    }

    public partial class Loader {
        public static void FishyJoesRuntime_Function0Converter_setup<R>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function0Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Func<R>)(() =>
                        (R)impl.invoke0()!
                    ));
                })),
                bag<Invoke0>((IntPtr fn, out IntPtr innerExn) => Catching(out innerExn, () =>
                    PassOwnership(PeekHandle<System.Func<R>>(fn)(
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function1Converter_setup<R, P0>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function1Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Func<P0, R>)((P0 p0) =>
                        (R)impl.invoke1(p0)!
                    ));
                })),
                bag<Invoke1>((IntPtr fn, IntPtr p0, out IntPtr innerExn) => Catching(out innerExn, () =>
                    PassOwnership(PeekHandle<System.Func<P0, R>>(fn)(
                        PeekHandle<P0>(p0)
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function2Converter_setup<R, P0, P1>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function2Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Func<P0, P1, R>)((P0 p0, P1 p1) =>
                        (R)impl.invoke2(p0, p1)!
                    ));
                })),
                bag<Invoke2>((IntPtr fn, IntPtr p0, IntPtr p1, out IntPtr innerExn) => Catching(out innerExn, () =>
                    PassOwnership(PeekHandle<System.Func<P0, P1, R>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1)
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function3Converter_setup<R, P0, P1, P2>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function3Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Func<P0, P1, P2, R>)((P0 p0, P1 p1, P2 p2) =>
                        (R)impl.invoke3(p0, p1, p2)!
                    ));
                })),
                bag<Invoke3>((IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, out IntPtr innerExn) => Catching(out innerExn, () =>
                    PassOwnership(PeekHandle<System.Func<P0, P1, P2, R>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1),
                        PeekHandle<P2>(p2)
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function4Converter_setup<R, P0, P1, P2, P3>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function4Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Func<P0, P1, P2, P3, R>)((P0 p0, P1 p1, P2 p2, P3 p3) =>
                        (R)impl.invoke4(p0, p1, p2, p3)!
                    ));
                })),
                bag<Invoke4>((IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, out IntPtr innerExn) => Catching(out innerExn, () =>
                    PassOwnership(PeekHandle<System.Func<P0, P1, P2, P3, R>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1),
                        PeekHandle<P2>(p2),
                        PeekHandle<P3>(p3)
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function5Converter_setup<R, P0, P1, P2, P3, P4>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function5Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Func<P0, P1, P2, P3, P4, R>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4) =>
                        (R)impl.invoke5(p0, p1, p2, p3, p4)!
                    ));
                })),
                bag<Invoke5>((IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, IntPtr p4, out IntPtr innerExn) => Catching(out innerExn, () =>
                    PassOwnership(PeekHandle<System.Func<P0, P1, P2, P3, P4, R>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1),
                        PeekHandle<P2>(p2),
                        PeekHandle<P3>(p3),
                        PeekHandle<P4>(p4)
                    ))
                )),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function6Converter_setup<R, P0, P1, P2, P3, P4, P5>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function6Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Func<P0, P1, P2, P3, P4, P5, R>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5) =>
                        (R)impl.invoke6(p0, p1, p2, p3, p4, p5)!
                    ));
                })),
                bag<Invoke6>((IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, IntPtr p4, IntPtr p5, out IntPtr innerExn) => Catching(out innerExn, () =>
                    PassOwnership(PeekHandle<System.Func<P0, P1, P2, P3, P4, P5, R>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1),
                        PeekHandle<P2>(p2),
                        PeekHandle<P3>(p3),
                        PeekHandle<P4>(p4),
                        PeekHandle<P5>(p5)
                    ))
                )),
                out exn
            );
        }

        delegate IntPtr Constructor(IntPtr reference, out IntPtr exn);
        delegate IntPtr Invoke0(IntPtr fn, out IntPtr exn);
        delegate IntPtr Invoke1(IntPtr fn, IntPtr p0, out IntPtr exn);
        delegate IntPtr Invoke2(IntPtr fn, IntPtr p0, IntPtr p1, out IntPtr exn);
        delegate IntPtr Invoke3(IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, out IntPtr exn);
        delegate IntPtr Invoke4(IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, out IntPtr exn);
        delegate IntPtr Invoke5(IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, IntPtr p4, out IntPtr exn);
        delegate IntPtr Invoke6(IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, IntPtr p4, IntPtr p5, out IntPtr exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Function0Converter_setup(string typeName, Constructor constructor, Invoke0 invoke, out IntPtr exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Function1Converter_setup(string typeName, Constructor constructor, Invoke1 invoke, out IntPtr exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Function2Converter_setup(string typeName, Constructor constructor, Invoke2 invoke, out IntPtr exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Function3Converter_setup(string typeName, Constructor constructor, Invoke3 invoke, out IntPtr exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Function4Converter_setup(string typeName, Constructor constructor, Invoke4 invoke, out IntPtr exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Function5Converter_setup(string typeName, Constructor constructor, Invoke5 invoke, out IntPtr exn);

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        static extern void FishyJoesRuntime_Function6Converter_setup(string typeName, Constructor constructor, Invoke6 invoke, out IntPtr exn);

        // MARK: Actions
        public static void FishyJoesRuntime_Function0Converter_setup(string name, out IntPtr exn) {
            FishyJoesRuntime_Function0Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Action)(() =>
                        impl.invoke0()
                    ));
                })),
                bag<Invoke0>((IntPtr fn, out IntPtr innerExn) => Catching(out innerExn, () => {
                    PeekHandle<System.Action>(fn)(
                    );
                    return IntPtr.Zero;
                })),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function1Converter_setup<P0>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function1Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Action<P0>)((P0 p0) =>
                        impl.invoke1(p0)
                    ));
                })),
                bag<Invoke1>((IntPtr fn, IntPtr p0, out IntPtr innerExn) => Catching(out innerExn, () => {
                    PeekHandle<System.Action<P0>>(fn)(
                        PeekHandle<P0>(p0)
                    );
                    return IntPtr.Zero;
                })),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function2Converter_setup<P0, P1>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function2Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Action<P0, P1>)((P0 p0, P1 p1) =>
                        impl.invoke2(p0, p1)
                    ));
                })),
                bag<Invoke2>((IntPtr fn, IntPtr p0, IntPtr p1, out IntPtr innerExn) => Catching(out innerExn, () => {
                    PeekHandle<System.Action<P0, P1>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1)
                    );
                    return IntPtr.Zero;
                })),
                out exn
            );
        }


        public static void FishyJoesRuntime_Function3Converter_setup<P0, P1, P2>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function3Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Action<P0, P1, P2>)((P0 p0, P1 p1, P2 p2) =>
                        impl.invoke3(p0, p1, p2)
                    ));
                })),
                bag<Invoke3>((IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, out IntPtr innerExn) => Catching(out innerExn, () => {
                    PeekHandle<System.Action<P0, P1, P2>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1),
                        PeekHandle<P2>(p2)
                    );
                    return IntPtr.Zero;
                })),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function4Converter_setup<P0, P1, P2, P3>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function4Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Action<P0, P1, P2, P3>)((P0 p0, P1 p1, P2 p2, P3 p3) =>
                        impl.invoke4(p0, p1, p2, p3)
                    ));
                })),
                bag<Invoke4>((IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, out IntPtr innerExn) => Catching(out innerExn, () => {
                    PeekHandle<System.Action<P0, P1, P2, P3>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1),
                        PeekHandle<P2>(p2),
                        PeekHandle<P3>(p3)
                    );
                    return IntPtr.Zero;
                })),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function5Converter_setup<P0, P1, P2, P3, P4>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function5Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Action<P0, P1, P2, P3, P4>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4) =>
                        impl.invoke5(p0, p1, p2, p3, p4)
                    ));
                })),
                bag<Invoke5>((IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, IntPtr p4, out IntPtr innerExn) => Catching(out innerExn, () => {
                    PeekHandle<System.Action<P0, P1, P2, P3, P4>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1),
                        PeekHandle<P2>(p2),
                        PeekHandle<P3>(p3),
                        PeekHandle<P4>(p4)
                    );
                    return IntPtr.Zero;
                })),
                out exn
            );
        }

        public static void FishyJoesRuntime_Function6Converter_setup<P0, P1, P2, P3, P4, P5>(string name, out IntPtr exn) {
            FishyJoesRuntime_Function6Converter_setup(
                name,
                bag<Constructor>((IntPtr swiftRef, out IntPtr innerExn) => Catching(out innerExn, () => {
                    var impl = new SwiftFunctionImpl(swiftRef);
                    return PassOwnership((System.Action<P0, P1, P2, P3, P4, P5>)((P0 p0, P1 p1, P2 p2, P3 p3, P4 p4, P5 p5) =>
                        impl.invoke6(p0, p1, p2, p3, p4, p5)
                    ));
                })),
                bag<Invoke6>((IntPtr fn, IntPtr p0, IntPtr p1, IntPtr p2, IntPtr p3, IntPtr p4, IntPtr p5, out IntPtr innerExn) => Catching(out innerExn, () => {
                    PeekHandle<System.Action<P0, P1, P2, P3, P4, P5>>(fn)(
                        PeekHandle<P0>(p0),
                        PeekHandle<P1>(p1),
                        PeekHandle<P2>(p2),
                        PeekHandle<P3>(p3),
                        PeekHandle<P4>(p4),
                        PeekHandle<P5>(p5)
                    );
                    return IntPtr.Zero;
                })),
                out exn
            );
        }

        private static void setupFunctions() {
            // Generic types need to be set up as instantiated types, so nothing to do here.
        }
    }
}
