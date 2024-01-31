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

        public TestPropertiesProtocol(
            string Corge
        ) {
            this.Corge = Corge;
        }

        static TestPropertiesProtocol() { _TypeSetup._ensureLoaded(); }
    }
}
