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
        public static Cricut.FishyJoesRuntime.AttributedString Simple {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Simple(out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Simple(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(accent) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Accent {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Accent(out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Accent(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(script) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Script {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Script(out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Script(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chinese) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Chinese {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Chinese(out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Chinese(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseBMP) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString ChineseBMP {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_ChineseBMP(out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_ChineseBMP(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(chineseSIP) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString ChineseSIP {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_ChineseSIP(out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_ChineseSIP(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emoji) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Emoji {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Emoji(out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Emoji(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(emojiMulti) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString EmojiMulti {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_EmojiMulti(out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_EmojiMulti(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(polyglot) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Polyglot {
            get {
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStrings_Polyglot(out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStrings_Polyglot(out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(echo) -->
        /// </summary>
        public static Cricut.FishyJoesRuntime.AttributedString Echo(
            Cricut.FishyJoesRuntime.AttributedString _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __cs_AttributedStrings_echo(_stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStrings_echo(
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
            return Check((out CreatedRef _exn) => __cs_AttributedStrings_firstIndex(_stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStrings_firstIndex(
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
            return Check((out CreatedRef _exn) => __cs_AttributedStrings_lastIndex(_stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStrings_lastIndex(
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
            return Check((out CreatedRef _exn) => __cs_AttributedStrings_fullRange(_stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStrings_fullRange(
            UnownedRef _string,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(attributedCharacters) -->
        /// </summary>
        public static System.Collections.Generic.IList<Cricut.FishyJoesRuntime.AttributedString> AttributedCharacters(
            Cricut.FishyJoesRuntime.AttributedString /* of */ _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __cs_AttributedStrings_attributedCharacters(_stringHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<Cricut.FishyJoesRuntime.AttributedString>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStrings_attributedCharacters(
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
            return Check((out CreatedRef _exn) => __cs_AttributedStrings_attributesPreferringDuplicatesNearerStart(_stringHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributeContainer>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStrings_attributesPreferringDuplicatesNearerStart(
            UnownedRef _string,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(emptyAttributeRuns) -->
        /// </summary>
        public static System.Collections.Generic.IList<Cricut.FishyJoesRuntime.AttributedString.Runs.Run> EmptyAttributeRuns(
            Cricut.FishyJoesRuntime.AttributedString /* of */ _string
        ) {
            using var _stringHandle = new GCRef(_string);
            return Check((out CreatedRef _exn) => __cs_AttributedStrings_emptyAttributeRuns(_stringHandle.ptr, out _exn)).Consume<System.Collections.Generic.IList<Cricut.FishyJoesRuntime.AttributedString.Runs.Run>>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStrings_emptyAttributeRuns(
            UnownedRef _string,
            out CreatedRef exn
        );

        static AttributedStrings() { _TypeSetup._ensureLoaded(); }
    }
}
