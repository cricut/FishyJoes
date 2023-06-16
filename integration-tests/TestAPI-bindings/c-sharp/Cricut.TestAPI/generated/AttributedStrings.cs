using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(AttributedStrings) -->
    /// </summary>
    public record AttributedStrings {
        private AttributedStrings() {}

        /// <summary>
        /// <!-- FishyJoes.export(simple) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString Simple {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Simple(out exn).Consume<Cricut.TestAPI.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Simple(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(accent) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString Accent {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Accent(out exn).Consume<Cricut.TestAPI.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Accent(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(script) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString Script {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Script(out exn).Consume<Cricut.TestAPI.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Script(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chinese) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString Chinese {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Chinese(out exn).Consume<Cricut.TestAPI.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Chinese(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseBMP) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString ChineseBMP {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_ChineseBMP(out exn).Consume<Cricut.TestAPI.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_ChineseBMP(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseSIP) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString ChineseSIP {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_ChineseSIP(out exn).Consume<Cricut.TestAPI.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_ChineseSIP(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emoji) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString Emoji {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Emoji(out exn).Consume<Cricut.TestAPI.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Emoji(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emojiMulti) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString EmojiMulti {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_EmojiMulti(out exn).Consume<Cricut.TestAPI.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_EmojiMulti(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString Echo(
            Cricut.TestAPI.AttributedString _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __cs_AttributedStrings_echo(_stringHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStrings_echo(
            UnownedRef _string,
            out CreatedRef exn
        );

        static AttributedStrings() { _TypeSetup._ensureLoaded(); }
    }
}
