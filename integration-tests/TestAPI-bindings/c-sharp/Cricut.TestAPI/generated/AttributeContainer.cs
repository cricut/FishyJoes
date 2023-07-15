using Cricut.FishyJoesRuntime;
using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.TestAPI {
    /// <summary>
    /// <para>A type that provides a way to store attributes and their values outside of an attributed string.</para>
    /// <para></para>
    /// <para>Use this type to initialize an instance of AttributedString with preset attributes,</para>
    /// <para>and to set, merge, or replace attributes in existing attributed strings.</para>
    /// <para></para>
    /// <para>Libraries that depend on `AttributeContainer` are free to define their own attributes to be associated with attributed strings.</para>
    /// <para>As a result of this flexibility, the actual values of attributes can only be obtained using types defined in those libraries.</para>
    /// <para></para>
    /// <para>The runtime itself defines one such type, `AttributeContainer.FoundationAttributes`.</para>
    /// <para>To obtain the values of attributes from that type, such as the `link` attribute or `languageIdentifier` attribute,</para>
    /// <para>one must construct an instance passing the container:</para>
    /// <para></para>
    /// <para>`link = AttributeContainer.FoundationAttributes(someContainer).link`</para>
    /// <para></para>
    /// <!-- FishyJoes.exportReference(AttributeContainer) -->
    /// </summary>
    public class AttributeContainer : SwiftReference {
        internal AttributeContainer(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// <para>Merges the attributes of another attribute container with those of this container.</para>
        /// <para></para>
        /// <para>- Parameter other The other attribute container whose attributes should be merged into this container.</para>
        /// <para>- Parameter keepCurrent For attributes in `other` that already have a value in this container,</para>
        /// <para>    passing `true` retains the current value of the attribute,</para>
        /// <para>    passing `false` replaces the value of the attribute with the one in `other`.</para>
        /// <para></para>
        /// <!-- FishyJoes.export(merge) -->
        /// </summary>
        public void Merge(
            Cricut.TestAPI.AttributeContainer other,
            bool keepCurrent = false
        ) {
            using var _thisHandle = new GCRef(this);
            using var _otherHandle = new GCRef(other);
            Check((out CreatedRef _exn) => __cs_AttributeContainerASDF_merge(_thisHandle.ptr, _otherHandle.ptr, keepCurrent, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributeContainerASDF_merge(
            UnownedRef self,
            UnownedRef other,
            bool keepCurrent,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Creates an attribute container having no attribute values.</para>
        /// <!-- FishyJoes.export(createEmpty) -->
        /// </summary>
        public static Cricut.TestAPI.AttributeContainer CreateEmpty(
        ) {
            return Check((out CreatedRef _exn) => __cs_AttributeContainerASDF_createEmpty(out _exn)).Consume<Cricut.TestAPI.AttributeContainer>();
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributeContainerASDF_createEmpty(
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            using var thisHandle = new GCRef(this);
            using var otherHandle = new GCRef(other as Cricut.TestAPI.AttributeContainer);
            return Check((out CreatedRef exn) => __cs_AttributeContainerASDF_equals(thisHandle.ptr, otherHandle.ptr, out exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __cs_AttributeContainerASDF_equals(
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __cs_AttributeContainerASDF_hash(_thisHandle.ptr, out _exn));
        }

        [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __cs_AttributeContainerASDF_hash(
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// <para>Attributes defined by the Swift Foundation library in ``AttributeScopes``, packaged as a static type.</para>
        /// <para></para>
        /// <para>This type (and the ones like it defined in other libraries) allow features similar to those</para>
        /// <para>offered by Swift dynamic member lookup in ``AttributeScope`` to be exported to other languages.</para>
        /// <para></para>
        /// <para>An attribute container can be asked to fill in the fields defined by this structure using `AttributeContainerFoundationAttributes(AttributeContainer)`.</para>
        /// <para>This type can be asked to fill in an attribute container using `AttributeContainer(FoundationAttributes)`.</para>
        /// <para></para>
        /// <para>Combining these calls with `AttributedString.setAttributes(_:)` and `AttributedString.mergeAttributes(_:)` allows expansion</para>
        /// <para>of attributed strings with new attributes in other languages analogously to how it is done in ``AttributeScopes`` using Swift dynamic member lookup.</para>
        /// <para></para>
        /// <!-- FishyJoes.exportReference(AttributeContainer.FoundationAttributes) -->
        /// </summary>
        public class FoundationAttributes : SwiftReference {
            internal FoundationAttributes(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// <para>A link attribute.</para>
            /// <!-- FishyJoes.export(link) -->
            /// </summary>
            public System.Uri? Link {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __cs_get_AttributeContainerASDF_FoundationAttributes_Link(thisHandle.ptr, out exn).Consume<System.Uri?>()
                    );
                }
                set {
                    using var thisHandle = new GCRef(this);
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __cs_set_AttributeContainerASDF_FoundationAttributes_Link(thisHandle.ptr, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributeContainerASDF_FoundationAttributes_Link(UnownedRef self, out CreatedRef exn);

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_set_AttributeContainerASDF_FoundationAttributes_Link(UnownedRef self, UnownedRef value, out CreatedRef exn);

            /// <summary>
            /// <para>A language identifier attribute.</para>
            /// <!-- FishyJoes.export(languageIdentifier) -->
            /// </summary>
            public string? LanguageIdentifier {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __cs_get_AttributeContainerASDF_FoundationAttributes_LanguageIdentifier(thisHandle.ptr, out exn).Consume<string?>()
                    );
                }
                set {
                    using var thisHandle = new GCRef(this);
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __cs_set_AttributeContainerASDF_FoundationAttributes_LanguageIdentifier(thisHandle.ptr, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributeContainerASDF_FoundationAttributes_LanguageIdentifier(UnownedRef self, out CreatedRef exn);

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_set_AttributeContainerASDF_FoundationAttributes_LanguageIdentifier(UnownedRef self, UnownedRef value, out CreatedRef exn);

            /// <summary>
            /// <para>Creates a Foundation attribute container having no attribute values.</para>
            /// <!-- FishyJoes.export(createEmpty) -->
            /// </summary>
            public static Cricut.TestAPI.AttributeContainer.FoundationAttributes CreateEmpty(
            ) {
                return Check((out CreatedRef _exn) => __cs_AttributeContainerASDF_FoundationAttributes_createEmpty(out _exn)).Consume<Cricut.TestAPI.AttributeContainer.FoundationAttributes>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributeContainerASDF_FoundationAttributes_createEmpty(
                out CreatedRef exn
            );

            /// <summary>
            /// <para>Extracts the Foundation attributes from an attribute container and makes them available as statically typed properties.</para>
            /// <!-- FishyJoes.export(createFromContainer) -->
            /// </summary>
            public static Cricut.TestAPI.AttributeContainer.FoundationAttributes CreateFromContainer(
                Cricut.FishyJoesRuntime.AttributeContainer container
            ) {
                using var _containerHandle = new GCRef(container);
                return Check((out CreatedRef _exn) => __cs_AttributeContainerASDF_FoundationAttributes_createFromContainer(_containerHandle.ptr, out _exn)).Consume<Cricut.TestAPI.AttributeContainer.FoundationAttributes>();
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributeContainerASDF_FoundationAttributes_createFromContainer(
                UnownedRef container,
                out CreatedRef exn
            );

            public override bool Equals(
                object? other
            ) {
                using var thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.TestAPI.AttributeContainer.FoundationAttributes);
                return Check((out CreatedRef exn) => __cs_AttributeContainerASDF_FoundationAttributes_equals(thisHandle.ptr, otherHandle.ptr, out exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __cs_AttributeContainerASDF_FoundationAttributes_equals(
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __cs_AttributeContainerASDF_FoundationAttributes_hash(_thisHandle.ptr, out _exn));
            }

            [DllImport("TestAPI-c-sharp", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __cs_AttributeContainerASDF_FoundationAttributes_hash(
                UnownedRef self,
                out CreatedRef exn
            );

            static FoundationAttributes() { _TypeSetup._ensureLoaded(); }
        }
        static AttributeContainer() { _TypeSetup._ensureLoaded(); }
    }
}
