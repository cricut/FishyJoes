using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(TestLeadingUnderscoredPropStruct, conformances: [TestLeadingUnderscoredProp]) -->
    /// </summary>
    public record TestLeadingUnderscoredPropStruct: Cricut.TestAPI.TestLeadingUnderscoredProp {
        public string _leadingUnderscoreProp { get; set; }

        public TestLeadingUnderscoredPropStruct(
            string _leadingUnderscoreProp
        ) {
            this._leadingUnderscoreProp = _leadingUnderscoreProp;
        }

        public string Get_leadingUnderscoreProp(
        ) {
            return _leadingUnderscoreProp;
        }

        static TestLeadingUnderscoredPropStruct() { _TypeSetup._ensureLoaded(); }
    }
}
