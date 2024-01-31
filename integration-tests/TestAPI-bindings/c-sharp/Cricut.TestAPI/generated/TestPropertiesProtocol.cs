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

        public TestPropertiesProtocol(
        ) {
        }

        static TestPropertiesProtocol() { _TypeSetup._ensureLoaded(); }
    }
}
