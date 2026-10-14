using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(TheMethodError) -->
    /// </summary>
    public class TheMethodError : SwiftReference {
        internal TheMethodError(ConsumedRef reference): base(reference) {}

        static TheMethodError() { _TypeSetup._ensureLoaded(); }
    }
}
