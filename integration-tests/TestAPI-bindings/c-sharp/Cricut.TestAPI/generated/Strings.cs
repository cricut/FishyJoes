using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(Strings) -->
    /// </summary>
    public class Strings : SwiftReference {
        internal Strings(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(simple) -->
        /// </summary>
        public static string Simple {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Strings_Simple(out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Strings_Simple(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(accent) -->
        /// </summary>
        public static string Accent {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Strings_Accent(out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Strings_Accent(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(script) -->
        /// </summary>
        public static string Script {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Strings_Script(out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Strings_Script(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chinese) -->
        /// </summary>
        public static string Chinese {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Strings_Chinese(out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Strings_Chinese(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseBMP) -->
        /// </summary>
        public static string ChineseBMP {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Strings_ChineseBMP(out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Strings_ChineseBMP(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseSIP) -->
        /// </summary>
        public static string ChineseSIP {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Strings_ChineseSIP(out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Strings_ChineseSIP(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emoji) -->
        /// </summary>
        public static string Emoji {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Strings_Emoji(out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Strings_Emoji(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emojiMulti) -->
        /// </summary>
        public static string EmojiMulti {
            get {
                return Check((out CreatedRef exn) => 
                    __cs_get_Strings_EmojiMulti(out exn).Consume<string>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_Strings_EmojiMulti(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static string Echo(
            string _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __cs_Strings_echo(_stringHandle.ptr, out _exn)).Consume<string>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_Strings_echo(
            UnownedRef _string,
            out CreatedRef exn
        );

        static Strings() { _TypeSetup._ensureLoaded(); }
    }
}
