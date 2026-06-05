using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.export(Strings) -->
    /// </summary>
    public record Strings {
        private Strings() {}

        /// <summary>
        /// <!-- FishyJoes.export(accent) -->
        /// </summary>
        public staticstring Accent {
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
        public staticstring Chinese {
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
        public staticstring ChineseBMP {
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
        public staticstring ChineseSIP {
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
        public staticstring Emoji {
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
        public staticstring EmojiMulti {
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
        public staticstring Script {
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
        public staticstring Simple {
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
        public staticstring Echo(
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

        /// <summary>
        /// <!-- FishyJoes.export(split) -->
        /// </summary>
        public staticSystem.Collections.Generic.IList<string> Split(
            string _string,
            string by
        ) {
            using var _stringHandle = new GCRef(_string);
            using var _byHandle = new GCRef(by);
            return Check((out CreatedRef _exn) => __iota_TestAPI_Strings_split(Loader.env, _stringHandle.ptr, _byHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<string>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_Strings_split(
            IntPtr envRef,
            UnownedRef _string,
            UnownedRef by,
            out CreatedRef exn
        );

        static Strings() { _TypeSetup._ensureLoaded(); }
    }
}
