namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Strings) -->
    /// </summary>
    public record Strings {
        private Strings() {}

        /// <summary>
        /// <!-- FishyJoes.export(accent) -->
        /// </summary>
        public static string Accent {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Strings_accent(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Strings_accent(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chinese) -->
        /// </summary>
        public static string Chinese {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Strings_chinese(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Strings_chinese(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseBMP) -->
        /// </summary>
        public static string ChineseBMP {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Strings_chineseBMP(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Strings_chineseBMP(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseSIP) -->
        /// </summary>
        public static string ChineseSIP {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Strings_chineseSIP(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Strings_chineseSIP(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emoji) -->
        /// </summary>
        public static string Emoji {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Strings_emoji(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Strings_emoji(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emojiMulti) -->
        /// </summary>
        public static string EmojiMulti {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Strings_emojiMulti(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Strings_emojiMulti(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(script) -->
        /// </summary>
        public static string Script {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Strings_script(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Strings_script(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(simple) -->
        /// </summary>
        public static string Simple {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_Strings_simple(Loader.env, out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_Strings_simple(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static string Echo(
            string _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Strings_echo(Loader.env, _stringHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Strings_echo(
            IntPtr envRef,
            UnownedRef _string,
            out CreatedRef exn
        );

        static Strings() { _TypeSetup._ensureLoaded(); }
    }
}

using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;
