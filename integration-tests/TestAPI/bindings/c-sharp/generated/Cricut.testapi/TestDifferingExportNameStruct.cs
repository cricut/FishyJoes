using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestDifferingExportNameStruct) -->
    /// </summary>
    public record TestDifferingExportNameStruct: Cricut.TestAPI.TestDifferingExportNameProtocolDiffy {
        public nint Tata { get; set; }

        public TestDifferingExportNameStruct(
            nint Tata
        ) {
            this.Tata = Tata;
        }

        public nint GetTata(
        ) {
            return Tata;
        }

        static TestDifferingExportNameStruct() { _TypeSetup._ensureLoaded(); }
    }
}
