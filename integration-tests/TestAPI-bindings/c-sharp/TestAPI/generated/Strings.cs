using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /**
     * <!-- FishyJoes.exportReference(Strings) -->
     */
    public class Strings : SwiftReference {
        internal Strings(IntPtr reference): base(reference) {}

        /**
         * <!-- FishyJoes.export(simple) -->
         */
        public static string simple {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<string>(__cs_get_Strings_simple(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Strings_simple(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(accent) -->
         */
        public static string accent {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<string>(__cs_get_Strings_accent(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Strings_accent(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(script) -->
         */
        public static string script {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<string>(__cs_get_Strings_script(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Strings_script(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(chinese) -->
         */
        public static string chinese {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<string>(__cs_get_Strings_chinese(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Strings_chinese(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(chineseBMP) -->
         */
        public static string chineseBMP {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<string>(__cs_get_Strings_chineseBMP(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Strings_chineseBMP(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(chineseSIP) -->
         */
        public static string chineseSIP {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<string>(__cs_get_Strings_chineseSIP(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Strings_chineseSIP(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(emoji) -->
         */
        public static string emoji {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<string>(__cs_get_Strings_emoji(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Strings_emoji(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(emojiMulti) -->
         */
        public static string emojiMulti {
            get => Check((out IntPtr exn) => {
                return ConsumeHandle<string>(__cs_get_Strings_emojiMulti(out exn));
            });
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_get_Strings_emojiMulti(out IntPtr exn);

        /**
         * <!-- FishyJoes.export(echo) -->
         */
        public static string echo(
            string _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return ConsumeHandle<string>(
                Check((out IntPtr _exn) => __cs_Strings_echo(_stringHandle.ptr, out _exn))
            );
        }

        [DllImport("TestAPI-c-sharp.dylib", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl)]
        private static extern IntPtr __cs_Strings_echo(
            IntPtr _string,
            out IntPtr exn
        );

        static Strings() { _TypeSetup._ensureLoaded(); }
    }
}
