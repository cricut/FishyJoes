using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    /// <summary>
    /// A type that provides a way to store attributes and their values outside of an attributed string.
    /// </summary>
    /// <remarks>
    /// Use this type to initialize an instance of AttributedString with preset attributes,
    /// and to set, merge, or replace attributes in existing attributed strings.
    /// 
    /// Libraries that depend on `AttributeContainer` are free to define their own attributes to be associated with attributed strings.
    /// As a result of this flexibility, the actual values of attributes can only be obtained using types defined in those libraries.
    /// 
    /// The runtime itself defines one such type, `AttributeContainer.FoundationAttributes`.
    /// To obtain the values of attributes from that type, such as the `link` attribute or `languageIdentifier` attribute,
    /// one must construct an instance passing the container:
    /// 
    /// `link = AttributeContainer.FoundationAttributes(someContainer).link`
    /// </remarks>
    /// <!-- FishyJoes.exportReference(AttributeContainer) -->
    public class AttributeContainer : SwiftReference {
        internal AttributeContainer(ConsumedRef reference): base(reference) {}

        /// <summary>
        /// Merges the attributes of another attribute container with those of this container.
        /// </summary>
        /// <param name="other">The other attribute container whose attributes should be merged into this container.</param>
        /// <param name="keepCurrent">
        ///     For attributes in `other` that already have a value in this container
        ///     passing `true` retains the current value of the attribute,
        ///     passing `false` replaces the value of the attribute with the one in `other`.
        /// </param>
        /// <!-- FishyJoes.export(merge) -->
        public void MergeAttributes(
            Cricut.FishyJoesRuntime.AttributeContainer other,
            bool keepCurrent = false
        ) {
            using var _thisHandle = new GCRef(this);
            using var _otherHandle = new GCRef(other);
            Check((out CreatedRef _exn) => __cs_AttributeContainer_merge(_thisHandle.ptr, _otherHandle.ptr, keepCurrent, out _exn));
        }

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __cs_AttributeContainer_merge(
            UnownedRef self,
            UnownedRef other,
            bool keepCurrent,
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            using var thisHandle = new GCRef(this);
            using var otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributeContainer);
            return Check((out CreatedRef exn) => __cs_AttributeContainer_equals(thisHandle.ptr, otherHandle.ptr, out exn));
        }

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __cs_AttributeContainer_equals(
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __cs_AttributeContainer_hash(_thisHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __cs_AttributeContainer_hash(
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>
        /// Creates an attribute container having no attribute values.
        /// </summary>
        /// <!-- FishyJoes.export(createEmpty) -->
        public static Cricut.FishyJoesRuntime.AttributeContainer CreateEmpty(
        ) {
            return Check((out CreatedRef _exn) => __cs_AttributeContainer_createEmpty(out _exn)).Consume<Cricut.FishyJoesRuntime.AttributeContainer>();
        }

        [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __cs_AttributeContainer_createEmpty(
            out CreatedRef exn
        );

        #region Conveniences

        /// <summary>
        /// Synonym for `AttributeContainer.CreateEmpty()`.
        /// </summary>
        public AttributeContainer(): base(new ConsumedRef(IntPtr.Zero)) { 
            var empty = AttributeContainer.CreateEmpty();
            reference = empty.reference;
            empty.reference = IntPtr.Zero;
        }

        #endregion

        /// <summary>
        /// Attributes defined by the Swift Foundation library in ``AttributeScopes``, packaged as a static type.
        /// </summary>
        /// <remarks>
        /// This type (and the ones like it defined in other libraries) allow features similar to those
        /// offered by Swift dynamic member lookup in ``AttributeScope`` to be exported to other languages.
        /// 
        /// An attribute container can be asked to fill in the fields defined by this structure using `AttributeContainerFoundationAttributes(AttributeContainer)`.
        /// This type can be asked to fill in an attribute container using `AttributeContainer(FoundationAttributes)`.
        /// 
        /// Combining these calls with `AttributedString.setAttributes(_:)` and `AttributedString.mergeAttributes(_:)` allows expansion
        /// of attributed strings with new attributes in other languages analogously to how it is done in ``AttributeScopes`` using Swift dynamic member lookup.
        /// </remarks>
        /// <!-- FishyJoes.exportReference(AttributeContainer.FoundationAttributes) -->
        public class FoundationAttributes : SwiftReference {
            internal FoundationAttributes(ConsumedRef reference): base(reference) {}

            /// <summary>
            /// A link attribute.
            /// </summary>
            /// <!-- FishyJoes.export(link) -->
            public System.Uri? Link {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __cs_get_AttributeContainer_FoundationAttributes_Link(thisHandle.ptr, out exn).Consume<System.Uri?>()
                    );
                }
                set {
                    using var thisHandle = new GCRef(this);
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __cs_set_AttributeContainer_FoundationAttributes_Link(thisHandle.ptr, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributeContainer_FoundationAttributes_Link(UnownedRef self, out CreatedRef exn);

            [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_set_AttributeContainer_FoundationAttributes_Link(UnownedRef self, UnownedRef value, out CreatedRef exn);

            /// <summary>
            /// A language identifier attribute.
            /// </summary>
            /// <!-- FishyJoes.export(languageIdentifier) -->
            public string? LanguageIdentifier {
                get {
                    using var thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __cs_get_AttributeContainer_FoundationAttributes_LanguageIdentifier(thisHandle.ptr, out exn).Consume<string?>()
                    );
                }
                set {
                    using var thisHandle = new GCRef(this);
                    using var valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __cs_set_AttributeContainer_FoundationAttributes_LanguageIdentifier(thisHandle.ptr, valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_get_AttributeContainer_FoundationAttributes_LanguageIdentifier(UnownedRef self, out CreatedRef exn);

            [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __cs_set_AttributeContainer_FoundationAttributes_LanguageIdentifier(UnownedRef self, UnownedRef value, out CreatedRef exn);

            public override bool Equals(
                object? other
            ) {
                using var thisHandle = new GCRef(this);
                using var otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes);
                return Check((out CreatedRef exn) => __cs_AttributeContainer_FoundationAttributes_equals(thisHandle.ptr, otherHandle.ptr, out exn));
            }

            [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __cs_AttributeContainer_FoundationAttributes_equals(
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __cs_AttributeContainer_FoundationAttributes_hash(_thisHandle.ptr, out _exn));
            }

            [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __cs_AttributeContainer_FoundationAttributes_hash(
                UnownedRef self,
                out CreatedRef exn
            );

            public Cricut.FishyJoesRuntime.AttributeContainer AsContainer(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __cs_AttributeContainer_FoundationAttributes_asContainer(_thisHandle.ptr, out _exn));
            }

            [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern Cricut.FishyJoesRuntime.AttributeContainer __cs_AttributeContainer_FoundationAttributes_asContainer(
                UnownedRef self,
                out CreatedRef exn
            );

            /// <summary>
            /// Creates a Foundation attribute container having no attribute values.
            /// </summary>
            /// <!-- FishyJoes.export(createEmpty) -->
            public static Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes CreateEmpty(
            ) {
                return Check((out CreatedRef _exn) => __cs_AttributeContainer_FoundationAttributes_createEmpty(out _exn)).Consume<Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes>();
            }

            [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributeContainer_FoundationAttributes_createEmpty(
                out CreatedRef exn
            );

            /// <summary>
            /// Extracts the Foundation attributes from an attribute container and makes them available as statically typed properties.
            /// </summary>
            /// <!-- FishyJoes.export(createFromContainer) -->
            public static Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes CreateFromContainer(
                Cricut.FishyJoesRuntime.AttributeContainer container
            ) {
                using var _containerHandle = new GCRef(container);
                return Check((out CreatedRef _exn) => __cs_AttributeContainer_FoundationAttributes_createFromContainer(_containerHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes>();
            }

            [DllImport("FishyJoesCSharpRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __cs_AttributeContainer_FoundationAttributes_createFromContainer(
                UnownedRef container,
                out CreatedRef exn
            );

            #region Conveniences

            /// <summary>
            /// Creates attributes with the provided attribute fields populated.
            /// </summary>
            public FoundationAttributes(Uri? link = null, string? languageIdentifier = null): base(new ConsumedRef(IntPtr.Zero)) { 
                var temp = FoundationAttributes.CreateEmpty();
                reference = temp.reference;
                temp.reference = IntPtr.Zero;

                this.Link = link;
                this.LanguageIdentifier = languageIdentifier;
            }

            /// <summary>
            /// Synonym for `FoundationAttributes.CreateFromContainer()`.
            /// </summary>
            public FoundationAttributes(AttributeContainer container): base(new ConsumedRef(IntPtr.Zero)) { 
                var temp = FoundationAttributes.CreateFromContainer(container);
                reference = temp.reference;
                temp.reference = IntPtr.Zero;
            }

            public static implicit operator AttributeContainer(FoundationAttributes attributes) => attributes.AsContainer();
            public static implicit operator FoundationAttributes(AttributeContainer container) => FoundationAttributes.CreateFromContainer(container);

            #endregion

            static FoundationAttributes() { Loader.ensureLoaded(); }
        }
        static AttributeContainer() { Loader.ensureLoaded(); }
    }
}
