using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    /// <summary>A type that represents a portion of an attributed string.</summary>
    /// <remarks>
    ///     The attributed string for which the type represents a sub-portion can be accessed in the `base` property.
    ///     The indices offered in `startIndex` and `endIndex` are in the same index space as those in `base`,
    ///     so they can be used to find what part of `base` the substring represents.
    /// </remarks>
    /// <!-- FishyJoes.exportReference(AttributedSubstring) -->
    public partial class AttributedSubstring : SwiftReference {
        static AttributedSubstring() { Loader.ensureLoaded(); }
        internal AttributedSubstring(ConsumedRef reference): base(reference) {}

        /// <summary>The attributed string that this substring references.</summary>
        /// <remarks>
        ///     The `startIndex` and `endIndex` of this substring are comparable to `base.startIndex` and `base.endIndex` and are guaranteed to be bounded by them.
        ///     As such, the portion of the base string represented by the substring is the range from `startIndex` inclusive to `endIndex` exclusive.
        /// </remarks>
        /// <!-- FishyJoes.export(base) -->
        public Cricut.FishyJoesRuntime.AttributedString Base { 
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedSubstring_Base(thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedSubstring_Base(UnownedRef self, out CreatedRef exn);

        /// <summary>Text represented by the attributed substring.</summary>
        /// <remarks>
        ///     See `runs` for the attribute information associated with the attributed substring's text.
        /// </remarks>
        /// <!-- FishyJoes.export(string) -->
        public string String {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedSubstring_String(thisHandle.ptr, out exn).Consume<string>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedSubstring_String(UnownedRef self, out CreatedRef exn);

        /// <summary>The attributed runs of the attributed substring, as a view into the underlying string.</summary>
        /// <remarks>
        ///     This view provides access to the attribute information associated with the attributed substring.
        /// 
        ///     See `runs.elementAtPosition()` or its `get()` operator for a way to access the attributes that
        ///     are associated with a particular position in the attributed substring.
        /// 
        ///     For example, `s.runs.first().attributes` yields the attributes in the first run of `s`
        ///     and `s.runs[index].attributes` yields the attributes associated with the position `index` in `s`.
        /// </remarks>
        /// <!-- FishyJoes.export(runs) -->
        public Cricut.FishyJoesRuntime.AttributedString.RunsView Runs {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedSubstring_Runs(thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.RunsView>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedSubstring_Runs(UnownedRef self, out CreatedRef exn);

        /// <summary>The characters of the attributed substring, as a view into the underlying string.</summary>
        /// <!-- FishyJoes.export(characters) -->
        public Cricut.FishyJoesRuntime.AttributedString.CharacterView Characters {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedSubstring_Characters(thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.CharacterView>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedSubstring_Characters(UnownedRef self, out CreatedRef exn);

        /// <summary>The Unicode scalars of the attributed substring, as a view into the underlying string.</summary>
        /// <!-- FishyJoes.export(unicodeScalars) -->
        public Cricut.FishyJoesRuntime.AttributedString.UnicodeScalarView UnicodeScalars {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedSubstring_UnicodeScalars(thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.UnicodeScalarView>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedSubstring_UnicodeScalars(UnownedRef self, out CreatedRef exn);

        /// <summary>The position of the first character in a nonempty attributed substring.</summary>
        /// <remarks>
        ///     See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
        /// </remarks>
        /// <!-- FishyJoes.export(startIndex) -->
        public Cricut.FishyJoesRuntime.AttributedString.Index StartIndex {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedSubstring_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedSubstring_StartIndex(UnownedRef self, out CreatedRef exn);

        /// <summary>An attributed substring’s past-the-end position — the position one greater than the last valid subscript argument.</summary>
        /// <remarks>
        ///     See `runs`, `characters`, and `unicodeScalars` for ways to obtain other indices within the attributed substring.
        /// </remarks>
        /// <!-- FishyJoes.export(endIndex) -->
        public Cricut.FishyJoesRuntime.AttributedString.Index EndIndex {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedSubstring_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedString.Index>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedSubstring_EndIndex(UnownedRef self, out CreatedRef exn);

        /// <summary>An attributed substring representing the full content of the attributed substring.</summary>
        /// <!-- FishyJoes.export(substring) -->
        public Cricut.FishyJoesRuntime.AttributedSubstring Substring {
            get {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __iota_get_Foundation_AttributedSubstring_Substring(thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.AttributedSubstring>()
                );
            }
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_get_Foundation_AttributedSubstring_Substring(UnownedRef self, out CreatedRef exn);

        /// <summary>Obtains an attributed substring representing part of the attributed substring.</summary>
        /// <param name="range">The portion of the attributed substring to be represented by the substring, bounded by `startIndex` and `endIndex`.</param>
        /// <returns>A substring of `base` over `range`.</returns>
        /// <!-- FishyJoes.export(substringForRange) -->
        public Cricut.FishyJoesRuntime.AttributedSubstring SubstringForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.FishyJoesRuntime.AttributedString.Index> /* for */ range
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __iota_Foundation_AttributedSubstring_substringForRange(_thisHandle.ptr, _rangeHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedSubstring>();
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_Foundation_AttributedSubstring_substringForRange(
            UnownedRef self,
            UnownedRef range,
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            using var thisHandle = new GCRef(this);
            using var otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributedSubstring);
            return Check((out CreatedRef exn) => __iota_Foundation_AttributedSubstring_equals(thisHandle.ptr, otherHandle.ptr, out exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_Foundation_AttributedSubstring_equals(
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_Foundation_AttributedSubstring_hash(_thisHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_Foundation_AttributedSubstring_hash(
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>Creates an attributed substring with an empty base attributed string.</summary>
        /// <!-- FishyJoes.export(createEmpty) -->
        public static Cricut.FishyJoesRuntime.AttributedSubstring CreateEmpty(
        ) {
            return Check((out CreatedRef _exn) => __iota_Foundation_AttributedSubstring_createEmpty(out _exn)).Consume<Cricut.FishyJoesRuntime.AttributedSubstring>();
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_Foundation_AttributedSubstring_createEmpty(
            out CreatedRef exn
        );
    }

    // Convenience Interface
    public partial class AttributedSubstring {
        /// <summary>Synonym for `AttributedSubstring.CreateEmpty()`.</summary>
        public AttributedSubstring(): base(new ConsumedRef(IntPtr.Zero)) { 
            var temp = AttributedSubstring.CreateEmpty();
            reference = temp.reference;
            temp.reference = IntPtr.Zero;
        }

        public static explicit operator string(AttributedSubstring substring) => substring.String;
        public static explicit operator AttributedSubstring(string _string) => AttributedString.Create(_string).Substring;

        public AttributedSubstring this[SwiftRange<AttributedString.Index> range] { get => SubstringForRange(range); }

        public static AttributedString operator +(AttributedSubstring a, AttributedSubstring b) {
            var s = new AttributedString();
            s.AppendSubstring(a);
            s.AppendSubstring(b);
            return s;
        }

        public static AttributedString operator +(string a, AttributedSubstring b) {
            var s = new AttributedString();
            s.Append(new AttributedString(a));
            s.AppendSubstring(b);
            return s;
        }

        public static AttributedString operator +(AttributedSubstring a, string b) {
            var s = new AttributedString();
            s.AppendSubstring(a);
            s.Append(new AttributedString(b));
            return s;
        }
    }
}
