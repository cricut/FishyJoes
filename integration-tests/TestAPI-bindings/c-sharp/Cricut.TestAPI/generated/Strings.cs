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
        internal Strings(IntPtr reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(simple) -->
        /// </summary>
        public static string Simple {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<string>(__cs_get_Strings_Simple(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Strings_Simple(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(accent) -->
        /// </summary>
        public static string Accent {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<string>(__cs_get_Strings_Accent(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Strings_Accent(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(script) -->
        /// </summary>
        public static string Script {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<string>(__cs_get_Strings_Script(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Strings_Script(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(chinese) -->
        /// </summary>
        public static string Chinese {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<string>(__cs_get_Strings_Chinese(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Strings_Chinese(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseBMP) -->
        /// </summary>
        public static string ChineseBMP {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<string>(__cs_get_Strings_ChineseBMP(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Strings_ChineseBMP(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseSIP) -->
        /// </summary>
        public static string ChineseSIP {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<string>(__cs_get_Strings_ChineseSIP(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Strings_ChineseSIP(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(emoji) -->
        /// </summary>
        public static string Emoji {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<string>(__cs_get_Strings_Emoji(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Strings_Emoji(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(emojiMulti) -->
        /// </summary>
        public static string EmojiMulti {
            get {
                return Check((out IntPtr exn) => 
                    ConsumeHandle<string>(__cs_get_Strings_EmojiMulti(out exn))
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_get_Strings_EmojiMulti(out IntPtr exn);

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static string Echo(
            string _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Strings_echo(_stringHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern IntPtr __cs_Strings_echo(
            IntPtr _string,
            out IntPtr exn
        );

        static Strings() { _TypeSetup._ensureLoaded(); }
    }
}
