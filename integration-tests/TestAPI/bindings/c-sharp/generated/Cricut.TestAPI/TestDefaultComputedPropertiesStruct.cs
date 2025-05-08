using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestDefaultComputedPropertiesStruct) -->
    /// </summary>
    public record TestDefaultComputedPropertiesStruct: Cricut.TestAPI.TestDefaultComputedProperties {
        public bool Spam { get; set; }
        public nint Noot { get; set; }

        public TestDefaultComputedPropertiesStruct(
            bool Spam,
            nint Noot
        ) {
            this.Spam = Spam;
            this.Noot = Noot;
        }

        public nint GetNoot(
        ) {
            return Noot;
        }

        static TestDefaultComputedPropertiesStruct() { _TypeSetup._ensureLoaded(); }
    }
}
