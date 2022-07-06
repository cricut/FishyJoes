using System;
using System.Runtime.InteropServices;
using System.Collections.Generic;
using Cricut.FishyJoesRuntime;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Strings) -->
     */
    public class Strings : SwiftReference {
        Strings(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(simple) -->
         */
        public String simple {
            get => Check((out Exception? exn) => __cs_get_Strings_simple(out exn));
        }

        [DllImport("TestAPI")]
        private static extern String __cs_get_Strings_simple(out Exception? exn);

        /**
         * <!-- FishyJoes.export(accent) -->
         */
        public String accent {
            get => Check((out Exception? exn) => __cs_get_Strings_accent(out exn));
        }

        [DllImport("TestAPI")]
        private static extern String __cs_get_Strings_accent(out Exception? exn);

        /**
         * <!-- FishyJoes.export(script) -->
         */
        public String script {
            get => Check((out Exception? exn) => __cs_get_Strings_script(out exn));
        }

        [DllImport("TestAPI")]
        private static extern String __cs_get_Strings_script(out Exception? exn);

        /**
         * <!-- FishyJoes.export(chinese) -->
         */
        public String chinese {
            get => Check((out Exception? exn) => __cs_get_Strings_chinese(out exn));
        }

        [DllImport("TestAPI")]
        private static extern String __cs_get_Strings_chinese(out Exception? exn);

        /**
         * <!-- FishyJoes.export(chineseBMP) -->
         */
        public String chineseBMP {
            get => Check((out Exception? exn) => __cs_get_Strings_chineseBMP(out exn));
        }

        [DllImport("TestAPI")]
        private static extern String __cs_get_Strings_chineseBMP(out Exception? exn);

        /**
         * <!-- FishyJoes.export(chineseSIP) -->
         */
        public String chineseSIP {
            get => Check((out Exception? exn) => __cs_get_Strings_chineseSIP(out exn));
        }

        [DllImport("TestAPI")]
        private static extern String __cs_get_Strings_chineseSIP(out Exception? exn);

        /**
         * <!-- FishyJoes.export(emoji) -->
         */
        public String emoji {
            get => Check((out Exception? exn) => __cs_get_Strings_emoji(out exn));
        }

        [DllImport("TestAPI")]
        private static extern String __cs_get_Strings_emoji(out Exception? exn);

        /**
         * <!-- FishyJoes.export(emojiMulti) -->
         */
        public String emojiMulti {
            get => Check((out Exception? exn) => __cs_get_Strings_emojiMulti(out exn));
        }

        [DllImport("TestAPI")]
        private static extern String __cs_get_Strings_emojiMulti(out Exception? exn);

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        public String echo(
            String _string
        ) => Check((out Exception? exn) => __cs_Strings_echo(_string, out exn));
        [DllImport("TestAPI")]
        static extern String __cs_Strings_echo(
            String _string,
            out Exception? exn
        );

        static Strings() { _TypeSetup._ensureLoaded(); }
    }
}
