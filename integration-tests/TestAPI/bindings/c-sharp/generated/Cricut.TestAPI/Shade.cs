using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para>A type whose name matches a case of ``ShadowBox``. Inside ShadowBox's</para>
    /// <para>generated Python class body, the case-type attribute (`Shade: ClassVar[...]`)</para>
    /// <para>shadows this type's import, so annotations meaning this type must resolve</para>
    /// <para>through a module-level alias in the generated stub.</para>
    /// <!-- FishyJoes.export(Shade) -->
    /// </summary>
    public record Shade {
        public double Darkness { get; set; }

        public Shade(
            double Darkness
        ) {
            this.Darkness = Darkness;
        }

        static Shade() { _TypeSetup._ensureLoaded(); }
    }
}
