using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestPropertiesProtocol) -->
    /// </summary>
    public interface TestPropertiesProtocol {
        public string Corge { get; internal set; }
        public System.Collections.Generic.IList<double> Frob { get; internal set; }

        static TestPropertiesProtocol() { _TypeSetup._ensureLoaded(); }
    }
}
