using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AssociatedDataEnum) -->
    /// </summary>
    public record AssociatedDataEnum {
        private AssociatedDataEnum() {}

        public sealed record Thing(
            nint Value
        ) : AssociatedDataEnum;

        static AssociatedDataEnum() { _TypeSetup._ensureLoaded(); }
    }
}
