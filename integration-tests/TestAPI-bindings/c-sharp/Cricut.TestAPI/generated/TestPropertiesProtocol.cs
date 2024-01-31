using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestPropertiesProtocol) -->
    /// </summary>
    public record TestPropertiesProtocol {
        public string Corge { get; set; }
        public System.Collections.Generic.IList<double> Frob { get; private set; }

        public TestPropertiesProtocol(
            string Corge,
            System.Collections.Generic.IList<double> Frob
        ) {
            this.Corge = Corge;
            this.Frob = Frob;
        }

        static TestPropertiesProtocol() { _TypeSetup._ensureLoaded(); }
    }
}
