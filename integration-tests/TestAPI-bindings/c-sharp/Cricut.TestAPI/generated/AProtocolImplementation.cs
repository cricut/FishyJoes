using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AProtocolImplementation) -->
    /// </summary>
    public record AProtocolImplementation: TestAPI.AProtocol {
        public string Foo { get; set; }
        public bool Baz { get; set; }

        public AProtocolImplementation(
            string Foo,
            bool Baz
        ) {
            this.Foo = Foo;
            this.Baz = Baz;
        }

        /// <summary>
        /// <!-- FishyJoes.export(bar) -->
        /// </summary>
        public Cricut.TestAPI.AProtocol Bar(
            nint x,
            nint y
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AProtocolImplementation_bar(Loader.env, _thisHandle.ptr, x, y, out _exn)).Consume<Cricut.TestAPI.AProtocol>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AProtocolImplementation_bar(
            IntPtr envRef,
            UnownedRef self,
            nint x,
            nint y,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(hasADefaultImplementation) -->
        /// </summary>
        public string HasADefaultImplementation(
            nint x,
            double y
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AProtocolImplementation_hasADefaultImplementation(Loader.env, _thisHandle.ptr, x, y, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AProtocolImplementation_hasADefaultImplementation(
            IntPtr envRef,
            UnownedRef self,
            nint x,
            double y,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(hasADefaultImplementation2) -->
        /// </summary>
        public string HasADefaultImplementation2(
            string a,
            bool b,
            string c
        ) {
            using var _thisHandle = new GCRef(this);
            using var _aHandle = new GCRef(a);
            using var _cHandle = new GCRef(c);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AProtocolImplementation_hasADefaultImplementation2(Loader.env, _thisHandle.ptr, _aHandle.ptr, b, _cHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AProtocolImplementation_hasADefaultImplementation2(
            IntPtr envRef,
            UnownedRef self,
            UnownedRef a,
            bool b,
            UnownedRef c,
            out CreatedRef exn
        );

        public string GetFoo(
        ) {
            return Foo;
        }

        public bool GetBaz(
        ) {
            return Baz;
        }

        static AProtocolImplementation() { _TypeSetup._ensureLoaded(); }
    }
}
