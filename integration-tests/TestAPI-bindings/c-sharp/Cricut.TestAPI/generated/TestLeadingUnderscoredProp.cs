using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestLeadingUnderscoredProp) -->
    /// </summary>
    public interface TestLeadingUnderscoredProp {
        public string _leadingUnderscoreProp { get; internal set; }

        static TestLeadingUnderscoredProp() { _TypeSetup._ensureLoaded(); }
    }
}
