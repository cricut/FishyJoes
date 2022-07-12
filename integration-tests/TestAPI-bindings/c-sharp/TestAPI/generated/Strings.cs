using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para><!-- FishyJoes.exportReference(Strings) --></para>
    /// </summary>
    public class Strings : SwiftReference {
        internal Strings(IntPtr reference): base(reference) {}

        /// <summary>
        /// <para><!-- FishyJoes.export(simple) --></para>
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
        /// <para><!-- FishyJoes.export(accent) --></para>
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
        /// <para><!-- FishyJoes.export(script) --></para>
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
        /// <para><!-- FishyJoes.export(chinese) --></para>
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
        /// <para><!-- FishyJoes.export(chineseBMP) --></para>
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
        /// <para><!-- FishyJoes.export(chineseSIP) --></para>
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
        /// <para><!-- FishyJoes.export(emoji) --></para>
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
        /// <para><!-- FishyJoes.export(emojiMulti) --></para>
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
        /// <para><!-- FishyJoes.export(echo) --></para>
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
