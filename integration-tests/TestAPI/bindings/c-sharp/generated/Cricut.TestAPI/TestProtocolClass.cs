using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(TestProtocolClass) -->
    /// </summary>
    public class TestProtocolClass : SwiftReference, Cricut.TestAPI.TestMethodsProtocol, Cricut.TestAPI.TestOptionalsProtocol, Cricut.TestAPI.TestPropertiesProtocol {
        internal TestProtocolClass(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(corge) -->
        /// </summary>
        public string Corge {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestProtocolClass_corge(Loader.env, thisHandle.ptr, out exn).Consume<string>()
                );
            }
            set {
                using var thisHandle = new GCRef(this);
                using var valueHandle = new GCRef(value);
                Check((out CreatedRef exn) =>
                    __iota_set_TestAPI_TestProtocolClass_corge(Loader.env, thisHandle.ptr, valueHandle.ptr, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestProtocolClass_corge(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_TestProtocolClass_corge(IntPtr envRef, UnownedRef self, UnownedRef value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(flarp) -->
        /// </summary>
        public string? Flarp {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_TestProtocolClass_flarp(Loader.env, thisHandle.ptr, out exn).Consume<string?>()
                );
            }
            set {
                using var thisHandle = new GCRef(this);
                using var valueHandle = new GCRef(value);
                Check((out CreatedRef exn) =>
                    __iota_set_TestAPI_TestProtocolClass_flarp(Loader.env, thisHandle.ptr, valueHandle.ptr, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestProtocolClass_flarp(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_set_TestAPI_TestProtocolClass_flarp(IntPtr envRef, UnownedRef self, UnownedRef value, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(frobby) -->
        /// </summary>
        public System.Collections.Generic.IList<nint> GetFrobby() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __iota_get_TestAPI_TestProtocolClass_frobby(Loader.env, thisHandle.ptr, out exn).Consume<System.Collections.Generic.IList<nint>>()
            );
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_TestProtocolClass_frobby(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(corge) -->
        /// </summary>
        public string GetCorge(
        ) {
            return Corge;
        }

        /// <summary>
        /// <!-- FishyJoes.export(flarp) -->
        /// </summary>
        public string? GetFlarp(
        ) {
            return Flarp;
        }

        /// <summary>
        /// <!-- FishyJoes.export(foo) -->
        /// </summary>
        public void Foo(
        ) {
            using var _thisHandle = new GCRef(this);
            Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolClass_foo(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestProtocolClass_foo(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(bar) -->
        /// </summary>
        public bool Bar(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolClass_bar(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_TestAPI_TestProtocolClass_bar(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(baz) -->
        /// </summary>
        public void Baz(
            bool qux
        ) {
            using var _thisHandle = new GCRef(this);
            Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolClass_baz(Loader.env, _thisHandle.ptr, qux, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_TestAPI_TestProtocolClass_baz(
            IntPtr envRef,
            UnownedRef self,
            bool qux,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(garply) -->
        /// </summary>
        public string Garply(
            string str
        ) {
            using var _thisHandle = new GCRef(this);
            using var _strHandle = new GCRef(str);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolClass_garply(Loader.env, _thisHandle.ptr, _strHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocolClass_garply(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef str,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(xyzzy) -->
        /// </summary>
        public string Xyzzy(
            nint thud,
            System.Collections.Generic.IList<double> grault
        ) {
            using var _thisHandle = new GCRef(this);
            using var _graultHandle = new GCRef(grault);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolClass_xyzzy(Loader.env, _thisHandle.ptr, thud, _graultHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocolClass_xyzzy(
            IntPtr envRef,
            UnownedRef self,
            nint thud,
            UnownedRef grault,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(plugh) -->
        /// </summary>
        public System.Tuple<bool, nint, string> Plugh(
            System.Tuple<bool, double, System.Collections.Generic.IList<string>> fred
        ) {
            using var _thisHandle = new GCRef(this);
            using var _fredHandle = new GCRef(fred);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolClass_plugh(Loader.env, _thisHandle.ptr, _fredHandle.ptr, out _exn)).Consume<System.Tuple<bool, nint, string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocolClass_plugh(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef fred,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(init) -->
        /// </summary>
        public static Cricut.TestAPI.TestProtocolClass Init(
            string corge,
            string? flarp = null
        ) {
            using var _corgeHandle = new GCRef(corge);
            using var _flarpHandle = new GCRef(flarp);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolClass_init(Loader.env, _corgeHandle.ptr, _flarpHandle.ptr, out _exn)).Consume<Cricut.TestAPI.TestProtocolClass>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocolClass_init(
            IntPtr envRef,
            UnownedRef corge,
            UnownedRef flarp,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(wombat) -->
        /// </summary>
        public double? Wombat(
            nint? zxc
        ) {
            using var _thisHandle = new GCRef(this);
            using var _zxcHandle = new GCRef(zxc);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolClass_wombat(Loader.env, _thisHandle.ptr, _zxcHandle.ptr, out _exn)).Consume<double?>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_TestProtocolClass_wombat(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef zxc,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(spqr) -->
        /// </summary>
        public nint Spqr(
            Cricut.TestAPI.AssociatedDataEnum pippo
        ) {
            using var _thisHandle = new GCRef(this);
            using var _pippoHandle = new GCRef(pippo);
            return Check((out CreatedRef _exn) => __iota_TestAPI_TestProtocolClass_spqr(Loader.env, _thisHandle.ptr, _pippoHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern nint __iota_TestAPI_TestProtocolClass_spqr(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef pippo,
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            if (other as Cricut.TestAPI.TestProtocolClass == null) { return false; }
            using var thisHandle = new GCRef(this);
            using var otherHandle = new GCRef(other as Cricut.TestAPI.TestProtocolClass);
            return Check((out CreatedRef exn) => __iota_TestAPI_TestProtocolClass_equals(Loader.env, thisHandle.ptr, otherHandle.ptr, out exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_TestAPI_TestProtocolClass_equals(
            IntPtr envRef,
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_get_TestAPI_TestProtocolClass_hash(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_get_TestAPI_TestProtocolClass_hash(
            IntPtr envRef,
            UnownedRef self,
            out CreatedRef exn
        );

        static TestProtocolClass() { _TypeSetup._ensureLoaded(); }
    }
}
