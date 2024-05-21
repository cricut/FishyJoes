using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AProtocol) -->
    /// </summary>
    public class ExternalWitness_AProtocol : SwiftReference, AProtocol {
        internal ExternalWitness_AProtocol(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(baz) -->
        /// </summary>
        public bool Baz {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AProtocol_baz(Loader.env, thisHandle.ptr, out exn)
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_get_TestAPI_AProtocol_baz(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(foo) -->
        /// </summary>
        public string Foo {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AProtocol_foo(Loader.env, thisHandle.ptr, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AProtocol_foo(IntPtr envRef, UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(bar) -->
        /// </summary>
        public Cricut.TestAPI.AProtocol Bar(
            nint x,
            nint y
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AProtocol_bar(Loader.env, _thisHandle.ptr, x, y, out _exn)).Consume<Cricut.TestAPI.AProtocol>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AProtocol_bar(
            IntPtr envRef,
            UnownedRef self,
            nint x,
            nint y,
            out CreatedRef exn
        );

        static ExternalWitness_AProtocol() { _TypeSetup._ensureLoaded(); }
    }
}
