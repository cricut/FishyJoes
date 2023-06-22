using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <!-- FishyJoes.exportReference(AttributedString) -->
    /// </summary>
    public class AttributedString : SwiftReference {
        internal AttributedString(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <!-- FishyJoes.export(startIndex) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.Index GetStartIndex() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_StartIndex(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(endIndex) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.Index GetEndIndex() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_EndIndex(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(unicodeScalars) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.UnicodeScalarView GetUnicodeScalars() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_UnicodeScalars(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.UnicodeScalarView>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_UnicodeScalars(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(characters) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.CharacterView GetCharacters() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_Characters(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.CharacterView>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_Characters(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(runs) -->
        /// </summary>
        public Cricut.TestAPI.AttributedString.Runs GetRuns() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_Runs(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Runs>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_Runs(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(substring) -->
        /// </summary>
        public Cricut.TestAPI.AttributedSubstring GetSubstring() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_Substring(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedSubstring>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_Substring(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(attributes) -->
        /// </summary>
        public System.Collections.Generic.IDictionary<string, string> GetAttributes() {
            using var thisHandle = new GCRef(this);
            return Check((out CreatedRef exn) =>
                __cs_get_AttributedStringASDF_Attributes(thisHandle.ptr, out exn).Consume<System.Collections.Generic.IDictionary<string, string>>()
            );
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_get_AttributedStringASDF_Attributes(UnownedRef self, out CreatedRef exn);

        /// <summary>
        /// <!-- FishyJoes.export(createEmpty) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString CreateEmpty(
        ) {
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_createEmpty(out _exn)).Consume<Cricut.TestAPI.AttributedString>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStringASDF_createEmpty(
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(create) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString Create(
            string _string,
            Cricut.TestAPI.AttributeContainer? attributes = null
        ) {
            using var _stringHandle = new GCRef(_string);
            using var _attributesHandle = new GCRef(attributes);
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_create(_stringHandle.ptr, _attributesHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStringASDF_create(
            UnownedRef _string,
            UnownedRef attributes,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(createFromSubstring) -->
        /// </summary>
        public static Cricut.TestAPI.AttributedString CreateFromSubstring(
            Cricut.TestAPI.AttributedSubstring substring
        ) {
            using var _substringHandle = new GCRef(substring);
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_createFromSubstring(_substringHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStringASDF_createFromSubstring(
            UnownedRef substring,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(substringForRange) -->
        /// </summary>
        public Cricut.TestAPI.AttributedSubstring SubstringForRange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> /* for */ range
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_substringForRange(_thisHandle.ptr, _rangeHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedSubstring>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributedStringASDF_substringForRange(
            UnownedRef self,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(setAttributes) -->
        /// </summary>
        public void SetAttributes(
            Cricut.TestAPI.AttributeContainer attributes
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_setAttributes(_thisHandle.ptr, _attributesHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_setAttributes(
            UnownedRef self,
            UnownedRef attributes,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(mergeAttributes) -->
        /// </summary>
        public void MergeAttributes(
            Cricut.TestAPI.AttributeContainer attributes,
            Cricut.TestAPI.AttributedString.AttributeMergePolicy? mergePolicy = null
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            using var _mergePolicyHandle = new GCRef(mergePolicy);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_mergeAttributes(_thisHandle.ptr, _attributesHandle.ptr, _mergePolicyHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_mergeAttributes(
            UnownedRef self,
            UnownedRef attributes,
            UnownedRef mergePolicy,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(replaceAttributes) -->
        /// </summary>
        public void ReplaceAttributes(
            Cricut.TestAPI.AttributeContainer attributes,
            Cricut.TestAPI.AttributeContainer /* with */ others
        ) {
            using var _thisHandle = new GCRef(this);
            using var _attributesHandle = new GCRef(attributes);
            using var _othersHandle = new GCRef(others);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_replaceAttributes(_thisHandle.ptr, _attributesHandle.ptr, _othersHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_replaceAttributes(
            UnownedRef self,
            UnownedRef attributes,
            UnownedRef others,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(append) -->
        /// </summary>
        public void Append(
            Cricut.TestAPI.AttributedString s
        ) {
            using var _thisHandle = new GCRef(this);
            using var _sHandle = new GCRef(s);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_append(_thisHandle.ptr, _sHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_append(
            UnownedRef self,
            UnownedRef s,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(insert) -->
        /// </summary>
        public void Insert(
            Cricut.TestAPI.AttributedString s,
            Cricut.TestAPI.AttributedString.Index /* at */ index
        ) {
            using var _thisHandle = new GCRef(this);
            using var _sHandle = new GCRef(s);
            using var _indexHandle = new GCRef(index);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_insert(_thisHandle.ptr, _sHandle.ptr, _indexHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_insert(
            UnownedRef self,
            UnownedRef s,
            UnownedRef index,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(removeSubrange) -->
        /// </summary>
        public void RemoveSubrange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> range
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_removeSubrange(_thisHandle.ptr, _rangeHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_removeSubrange(
            UnownedRef self,
            UnownedRef range,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.export(replaceSubrange) -->
        /// </summary>
        public void ReplaceSubrange(
            Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> range,
            Cricut.TestAPI.AttributedString /* with */ s
        ) {
            using var _thisHandle = new GCRef(this);
            using var _rangeHandle = new GCRef(range);
            using var _sHandle = new GCRef(s);
            Check((out CreatedRef _exn) => __cs_AttributedStringASDF_replaceSubrange(_thisHandle.ptr, _rangeHandle.ptr, _sHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributedStringASDF_replaceSubrange(
            UnownedRef self,
            UnownedRef range,
            UnownedRef s,
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            using var thisHandle = new GCRef(this);
            using var otherHandle = new GCRef(other as Cricut.TestAPI.AttributedString);
            return Check((out CreatedRef exn) => __cs_AttributedStringASDF_equals(thisHandle.ptr, otherHandle.ptr, out exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __cs_AttributedStringASDF_equals(
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_hash(_thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __cs_AttributedStringASDF_hash(
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <!-- FishyJoes.exportReference(AttributedString.Runs) -->
        /// </summary>
        public class Runs : SwiftReference {
            internal Runs(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// <!-- FishyJoes.export(startIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Index GetStartIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_Runs_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Runs.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_Runs_StartIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(endIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Index GetEndIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_Runs_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Runs.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_Runs_EndIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(indexBefore) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Index IndexBefore(
                Cricut.TestAPI.AttributedString.Runs.Index /* before */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_indexBefore(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Runs.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_Runs_indexBefore(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(indexAfter) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Index IndexAfter(
                Cricut.TestAPI.AttributedString.Runs.Index /* after */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_indexAfter(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Runs.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_Runs_indexAfter(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(elementAt) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Run ElementAt(
                Cricut.TestAPI.AttributedString.Runs.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_elementAt(_thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Runs.Run>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_Runs_elementAt(
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(elementAtPosition) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Runs.Run ElementAtPosition(
                Cricut.TestAPI.AttributedString.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_Runs_elementAtPosition(_thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Runs.Run>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_Runs_elementAtPosition(
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.exportReference(AttributedString.Runs.Run) -->
            /// </summary>
            public class Run : SwiftReference {
                internal Run(ConsumedRef reference): base(reference) {}

                /// <summary>
                /// <!-- FishyJoes.export(range) -->
                /// </summary>
                public Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> GetRange() {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __cs_get_AttributedStringASDF_Runs_Run_Range(thisHandle.ptr, out exn).Consume<Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index>>()
                    );
                }

                [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern CreatedRef __cs_get_AttributedStringASDF_Runs_Run_Range(UnownedRef self, out CreatedRef exn);

                /// <summary>
                /// <!-- FishyJoes.export(attributes) -->
                /// </summary>
                public Cricut.TestAPI.AttributeContainer GetAttributes() {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __cs_get_AttributedStringASDF_Runs_Run_Attributes(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributeContainer>()
                    );
                }

                [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
                private static extern CreatedRef __cs_get_AttributedStringASDF_Runs_Run_Attributes(UnownedRef self, out CreatedRef exn);

                static Run() { _TypeSetup._ensureLoaded(); }
            }

            /// <summary>
            /// <!-- FishyJoes.exportReference(AttributedString.Runs.Index) -->
            /// </summary>
            public class Index : SwiftReference {
                internal Index(ConsumedRef reference): base(reference) {}

                static Index() { _TypeSetup._ensureLoaded(); }
            }
            static Runs() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <!-- FishyJoes.exportReference(AttributedString.Index) -->
        /// </summary>
        public class Index : SwiftReference {
            internal Index(ConsumedRef reference): base(reference) {}

            static Index() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <!-- FishyJoes.exportReference(AttributedString.CharacterView) -->
        /// </summary>
        public class CharacterView : SwiftReference {
            internal CharacterView(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// <!-- FishyJoes.export(startIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index GetStartIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_CharacterView_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_CharacterView_StartIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(endIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index GetEndIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_CharacterView_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_CharacterView_EndIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(indexBefore) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index IndexBefore(
                Cricut.TestAPI.AttributedString.Index /* before */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_CharacterView_indexBefore(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_CharacterView_indexBefore(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(indexAfter) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index IndexAfter(
                Cricut.TestAPI.AttributedString.Index /* after */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_CharacterView_indexAfter(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_CharacterView_indexAfter(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(elementAt) -->
            /// </summary>
            public string ElementAt(
                Cricut.TestAPI.AttributedString.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_CharacterView_elementAt(_thisHandle.ptr, _indexHandle.ptr, out _exn)).Consume<string>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_CharacterView_elementAt(
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(replaceSubrange, generic: [C: [String]]) -->
            /// </summary>
            public void ReplaceSubrange(
                Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> subrange,
                System.Collections.Generic.IList<string> /* with */ newElements
            ) {
                using var _thisHandle = new GCRef(this);
                using var _subrangeHandle = new GCRef(subrange);
                using var _newElementsHandle = new GCRef(newElements);
                Check((out CreatedRef _exn) => __cs_AttributedStringASDF_CharacterView_replaceSubrange(_thisHandle.ptr, _subrangeHandle.ptr, _newElementsHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_AttributedStringASDF_CharacterView_replaceSubrange(
                UnownedRef self,
                UnownedRef subrange,
                UnownedRef newElements,
                out CreatedRef exn
            );

            static CharacterView() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <!-- FishyJoes.exportReference(AttributedString.UnicodeScalarView) -->
        /// </summary>
        public class UnicodeScalarView : SwiftReference {
            internal UnicodeScalarView(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// <!-- FishyJoes.export(startIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index GetStartIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_UnicodeScalarView_StartIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_UnicodeScalarView_StartIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(endIndex) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index GetEndIndex() {
                using var thisHandle = new GCRef(this);
                return Check((out CreatedRef exn) =>
                    __cs_get_AttributedStringASDF_UnicodeScalarView_EndIndex(thisHandle.ptr, out exn).Consume<Cricut.TestAPI.AttributedString.Index>()
                );
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributedStringASDF_UnicodeScalarView_EndIndex(UnownedRef self, out CreatedRef exn);

            /// <summary>
            /// <!-- FishyJoes.export(indexBefore) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index IndexBefore(
                Cricut.TestAPI.AttributedString.Index /* before */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_UnicodeScalarView_indexBefore(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_UnicodeScalarView_indexBefore(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(indexAfter) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index IndexAfter(
                Cricut.TestAPI.AttributedString.Index /* after */ i
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_UnicodeScalarView_indexAfter(_thisHandle.ptr, _iHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributedString.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_UnicodeScalarView_indexAfter(
                UnownedRef self,
                UnownedRef i,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(indexOffsetByDistance) -->
            /// </summary>
            public Cricut.TestAPI.AttributedString.Index IndexOffsetByDistance(
                Cricut.TestAPI.AttributedString.Index i,
                nint /* offsetBy */ distance
            ) {
                using var _thisHandle = new GCRef(this);
                using var _iHandle = new GCRef(i);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_UnicodeScalarView_indexOffsetByDistance(_thisHandle.ptr, _iHandle.ptr, distance, out _exn)).Consume<Cricut.TestAPI.AttributedString.Index>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributedStringASDF_UnicodeScalarView_indexOffsetByDistance(
                UnownedRef self,
                UnownedRef i,
                nint distance,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(elementAt) -->
            /// </summary>
            public uint ElementAt(
                Cricut.TestAPI.AttributedString.Index /* at */ index
            ) {
                using var _thisHandle = new GCRef(this);
                using var _indexHandle = new GCRef(index);
                return Check((out CreatedRef _exn) => __cs_AttributedStringASDF_UnicodeScalarView_elementAt(_thisHandle.ptr, _indexHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern uint __cs_AttributedStringASDF_UnicodeScalarView_elementAt(
                UnownedRef self,
                UnownedRef index,
                out CreatedRef exn
            );

            /// <summary>
            /// <!-- FishyJoes.export(replaceSubrange, generic: [C: [UInt32]]) -->
            /// </summary>
            public void ReplaceSubrange(
                Cricut.FishyJoesRuntime.SwiftRange<Cricut.TestAPI.AttributedString.Index> subrange,
                System.Collections.Generic.IList<uint> /* with */ newElements
            ) {
                using var _thisHandle = new GCRef(this);
                using var _subrangeHandle = new GCRef(subrange);
                using var _newElementsHandle = new GCRef(newElements);
                Check((out CreatedRef _exn) => __cs_AttributedStringASDF_UnicodeScalarView_replaceSubrange(_thisHandle.ptr, _subrangeHandle.ptr, _newElementsHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_AttributedStringASDF_UnicodeScalarView_replaceSubrange(
                UnownedRef self,
                UnownedRef subrange,
                UnownedRef newElements,
                out CreatedRef exn
            );

            static UnicodeScalarView() { _TypeSetup._ensureLoaded(); }
        }

        /// <summary>
        /// <!-- FishyJoes.export(AttributedString.AttributeMergePolicy) -->
        /// </summary>
        public record AttributeMergePolicy {
            private AttributeMergePolicy() {}

            public sealed record KeepNew : AttributeMergePolicy;

            public sealed record KeepCurrent : AttributeMergePolicy;

            static AttributeMergePolicy() { _TypeSetup._ensureLoaded(); }
        }
        static AttributedString() { _TypeSetup._ensureLoaded(); }
    }
}
