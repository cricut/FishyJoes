using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(AttributeScope) -->
    /// </summary>
    public class AttributeScope : SwiftReference {
        internal AttributeScope(ConsumedRef reference): base(reference) {}

        static AttributeScope() { _TypeSetup._ensureLoaded(); }
    }
}
