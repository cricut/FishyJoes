using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AProtocolImplementation) -->
    /// </summary>
    public record AProtocolImplementation: Cricut.TestAPI.AProtocol {
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
