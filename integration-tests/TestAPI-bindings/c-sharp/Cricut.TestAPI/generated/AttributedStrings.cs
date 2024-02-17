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
        /// <!-- FishyJoes.export(accent) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Accent {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AttributedStrings_accent(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AttributedStrings_accent(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chinese) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Chinese {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AttributedStrings_chinese(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AttributedStrings_chinese(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseBMP) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString ChineseBMP {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AttributedStrings_chineseBMP(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AttributedStrings_chineseBMP(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseSIP) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString ChineseSIP {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AttributedStrings_chineseSIP(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AttributedStrings_chineseSIP(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emoji) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Emoji {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AttributedStrings_emoji(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AttributedStrings_emoji(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emojiMulti) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString EmojiMulti {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AttributedStrings_emojiMulti(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AttributedStrings_emojiMulti(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(polyglot) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Polyglot {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AttributedStrings_polyglot(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AttributedStrings_polyglot(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(script) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Script {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AttributedStrings_script(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AttributedStrings_script(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(simple) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Simple {
            get {
                return Check((out CreatedRef exn) =>
                    __iota_get_TestAPI_AttributedStrings_simple(Loader.env, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_TestAPI_AttributedStrings_simple(IntPtr envRef, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(attributedCharacters) -->
        /// </summary>
        public static System.Collections.Generic.IList<Cricut.FishyJoesRuntime.AttributedSubstring> AttributedCharacters(
            Cricut.FishyJoesRuntime.AttributedString /* of */ _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AttributedStrings_attributedCharacters(Loader.env, _stringHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<Cricut.FishyJoesRuntime.AttributedSubstring>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AttributedStrings_attributedCharacters(
            IntPtr envRef,
            UnownedRef _string,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(attributesPreferringDuplicatesNearerStart) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributeContainer AttributesPreferringDuplicatesNearerStart(
            Cricut.FishyJoesRuntime.AttributedString /* of */ _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart(Loader.env, _stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributeContainer>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AttributedStrings_attributesPreferringDuplicatesNearerStart(
            IntPtr envRef,
            UnownedRef _string,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Echo(
            Cricut.FishyJoesRuntime.AttributedString _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AttributedStrings_echo(Loader.env, _stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AttributedStrings_echo(
            IntPtr envRef,
            UnownedRef _string,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(emptyAttributeRuns) -->
        /// </summary>
        public static System.Collections.Generic.IList<Cricut.FishyJoesRuntime.AttributedString.RunsView.Run> EmptyAttributeRuns(
            Cricut.FishyJoesRuntime.AttributedString /* of */ _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AttributedStrings_emptyAttributeRuns(Loader.env, _stringHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<Cricut.FishyJoesRuntime.AttributedString.RunsView.Run>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AttributedStrings_emptyAttributeRuns(
            IntPtr envRef,
            UnownedRef _string,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(firstIndex) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString.Index FirstIndex(
            Cricut.FishyJoesRuntime.AttributedString /* of */ _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AttributedStrings_firstIndex(Loader.env, _stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AttributedStrings_firstIndex(
            IntPtr envRef,
            UnownedRef _string,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(fullRange) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> FullRange(
            Cricut.FishyJoesRuntime.AttributedString /* of */ _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AttributedStrings_fullRange(Loader.env, _stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index>>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AttributedStrings_fullRange(
            IntPtr envRef,
            UnownedRef _string,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(lastIndex) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString.Index LastIndex(
            Cricut.FishyJoesRuntime.AttributedString /* of */ _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __iota_TestAPI_AttributedStrings_lastIndex(Loader.env, _stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>();
        }

        [DllImport("TestAPI-iota", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_TestAPI_AttributedStrings_lastIndex(
            IntPtr envRef,
            UnownedRef _string,
            out CreatedRef exn
        );

        static AttributedStrings() { _TypeSetup._ensureLoaded(); }
    }
}
