using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Tree) -->
    /// </summary>
    public record Tree {
        public nint Value { get; internal set; }
        public System.Collections.Generic.IList<Cricut.TestAPI.Tree> Children { get; internal set; }

        public Tree(
            nint Value,
            System.Collections.Generic.IList<Cricut.TestAPI.Tree> Children
        ) {
            this.Value = Value;
            this.Children = Children;
        }

        static Tree() { _TypeSetup._ensureLoaded(); }
    }
}
