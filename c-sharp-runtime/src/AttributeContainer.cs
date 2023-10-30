using System.Collections.Generic;
using System.Runtime.InteropServices;
using System;
using static Cricut.FishyJoesRuntime.Utilities;

namespace Cricut.FishyJoesRuntime {
    /// <summary>A type that provides a way to store attributes and their values outside of an attributed string.</summary>
    /// <remarks>
    ///     Use this type to initialize an instance of AttributedString with preset attributes,
    ///     and to set, merge, or replace attributes in existing attributed strings.
    /// 
    ///     Libraries that depend on `AttributeContainer` are free to define their own attributes to be associated with attributed strings.
    ///     As a result of this flexibility, the actual values of attributes can only be obtained using types defined in those libraries.
    /// 
    ///     The runtime itself defines one such type, `AttributeContainer.FoundationAttributes`.
    ///     To obtain the values of attributes from that type, such as the `link` attribute or `languageIdentifier` attribute,
    ///     one must construct an instance passing the container:
    /// 
    ///     `link = AttributeContainer.FoundationAttributes(someContainer).link`
    /// </remarks>
    /// <!-- FishyJoes.exportReference(AttributeContainer) -->
    public partial class AttributeContainer : SwiftReference {
        static AttributeContainer() { Loader.ensureLoaded(); }
        internal AttributeContainer(ConsumedRef reference): base(reference) {}

        /// <summary>Merges the attributes of another attribute container with those of this container.</summary>
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
            Check((out CreatedRef _exn) => __iota_FishyJoesCommonRuntime_AttributeContainer_merge(Loader.env, _thisHandle.ptr, _otherHandle.ptr, keepCurrent, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern void __iota_FishyJoesCommonRuntime_AttributeContainer_merge(
            IntPtr envRef, 
            UnownedRef self,
            UnownedRef other,
            bool keepCurrent,
            out CreatedRef exn
        );

        public override bool Equals(
            object? other
        ) {
            using var _thisHandle = new GCRef(this);
            using var _otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributeContainer);
            return Check((out CreatedRef exn) => __iota_FishyJoesCommonRuntime_AttributeContainer_equals(Loader.env, _thisHandle.ptr, _otherHandle.ptr, out exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern bool __iota_FishyJoesCommonRuntime_AttributeContainer_equals(
            IntPtr envRef, 
            UnownedRef lhs,
            UnownedRef rhs,
            out CreatedRef exn
        );

        public override int GetHashCode(
        ) {
            using var _thisHandle = new GCRef(this);
            return Check((out CreatedRef _exn) => __iota_get_FishyJoesCommonRuntime_AttributeContainer_hash(Loader.env, _thisHandle.ptr, out _exn));
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern int __iota_get_FishyJoesCommonRuntime_AttributeContainer_hash(
            IntPtr envRef, 
            UnownedRef self,
            out CreatedRef exn
        );

        /// <summary>Creates an attribute container having no attribute values.</summary>
        /// <!-- FishyJoes.export(createEmpty) -->
        public static Cricut.FishyJoesRuntime.AttributeContainer CreateEmpty(
        ) {
            return Check((out CreatedRef _exn) => __iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty(Loader.env, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributeContainer>();
        }

        [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
        private static extern CreatedRef __iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty(
            IntPtr envRef, 
            out CreatedRef exn
        );
    }

    // Convenience Interface
    public partial class AttributeContainer {
        /// <summary>Synonym for `AttributeContainer.CreateEmpty()`.</summary>
        public AttributeContainer(): base(new ConsumedRef(IntPtr.Zero)) { 
            var empty = AttributeContainer.CreateEmpty();
            reference = empty.reference;
            empty.reference = IntPtr.Zero;
        }
    }

    public partial class AttributeContainer {
        /// <summary>Attributes defined by the Swift Foundation library in ``AttributeScopes``, packaged as a static type.</summary>
        /// <remarks>
        ///     This type (and the ones like it defined in other libraries) allow features similar to those
        ///     offered by Swift dynamic member lookup in ``AttributeScope`` to be exported to other languages.
        /// 
        ///     An attribute container can be asked to fill in the fields defined by this structure using `AttributeContainerFoundationAttributes(AttributeContainer)`.
        ///     This type can be asked to fill in an attribute container using `AttributeContainer(FoundationAttributes)`.
        /// 
        ///     Combining these calls with `AttributedString.setAttributes(_:)` and `AttributedString.mergeAttributes(_:)` allows expansion
        ///     of attributed strings with new attributes in other languages analogously to how it is done in ``AttributeScopes`` using Swift dynamic member lookup.
        /// </remarks>
        /// <!-- FishyJoes.exportReference(AttributeContainer.FoundationAttributes) -->
        public partial class FoundationAttributes : SwiftReference {
            static FoundationAttributes() { Loader.ensureLoaded(); }
            internal FoundationAttributes(ConsumedRef reference): base(reference) {}

            /// <summary>A link attribute.</summary>
            /// <!-- FishyJoes.export(link) -->
            public System.Uri? Link {
                get {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(Loader.env, _thisHandle.ptr, out exn).Consume<System.Uri?>()
                    );
                }
                set {
                    using var _thisHandle = new GCRef(this);
                    using var _valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(Loader.env, _thisHandle.ptr, _valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(
                IntPtr envRef, 
                UnownedRef self, 
                out CreatedRef exn
            );

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(
                IntPtr envRef, 
                UnownedRef self, 
                UnownedRef value, 
                out CreatedRef exn
            );

            /// <summary>A language identifier attribute.</summary>
            /// <!-- FishyJoes.export(languageIdentifier) -->
            public string? LanguageIdentifier {
                get {
                    using var _thisHandle = new GCRef(this);
                    return Check((out CreatedRef exn) =>
                        __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(Loader.env, _thisHandle.ptr, out exn).Consume<string?>()
                    );
                }
                set {
                    using var _thisHandle = new GCRef(this);
                    using var _valueHandle = new GCRef(value);
                    Check((out CreatedRef exn) =>
                        __iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(Loader.env, _thisHandle.ptr, _valueHandle.ptr, out exn)
                    );
                }
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(
                IntPtr envRef, 
                UnownedRef self, 
                out CreatedRef exn
            );

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern void __iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(
                IntPtr envRef, 
                UnownedRef self, 
                UnownedRef value, 
                out CreatedRef exn
            );

            public override bool Equals(
                object? other
            ) {
                using var _thisHandle = new GCRef(this);
                using var _otherHandle = new GCRef(other as Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes);
                return Check((out CreatedRef exn) => __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals(Loader.env, _thisHandle.ptr, _otherHandle.ptr, out exn));
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern bool __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals(
                IntPtr envRef, 
                UnownedRef lhs,
                UnownedRef rhs,
                out CreatedRef exn
            );

            public override int GetHashCode(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash(Loader.env, _thisHandle.ptr, out _exn));
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern int __iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash(
                IntPtr envRef, 
                UnownedRef self,
                out CreatedRef exn
            );

            public Cricut.FishyJoesRuntime.AttributeContainer AsContainer(
            ) {
                using var _thisHandle = new GCRef(this);
                return Check((out CreatedRef _exn) => __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer(Loader.env, _thisHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributeContainer>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer(
                IntPtr envRef, 
                UnownedRef self,
                out CreatedRef exn
            );

            /// <summary>Creates a Foundation attribute container having no attribute values.</summary>
            /// <!-- FishyJoes.export(createEmpty) -->
            public static Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes CreateEmpty(
            ) {
                return Check((out CreatedRef _exn) => __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty(Loader.env, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty(
                IntPtr envRef, 
                out CreatedRef exn
            );

            /// <summary>Extracts the Foundation attributes from an attribute container and makes them available as statically typed properties.</summary>
            /// <!-- FishyJoes.export(createFromContainer) -->
            public static Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes CreateFromContainer(
                Cricut.FishyJoesRuntime.AttributeContainer container
            ) {
                using var _containerHandle = new GCRef(container);
                return Check((out CreatedRef _exn) => __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer(Loader.env, _containerHandle.ptr, out _exn)).Consume<Cricut.FishyJoesRuntime.AttributeContainer.FoundationAttributes>();
            }

            [DllImport("FishyJoesIotaRuntime", ExactSpelling = true, CallingConvention = CallingConvention.Cdecl, CharSet = CharSet.Unicode)]
            private static extern CreatedRef __iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer(
                IntPtr envRef, 
                UnownedRef container,
                out CreatedRef exn
            );
        }
    }

    public partial class AttributeContainer {
        // Convenience Interface
        public partial class FoundationAttributes {
            /// <summary>Creates attributes with the provided attribute fields populated.</summary>
            public FoundationAttributes(Uri? link = null, string? languageIdentifier = null): base(new ConsumedRef(IntPtr.Zero)) { 
                var temp = FoundationAttributes.CreateEmpty();
                reference = temp.reference;
                temp.reference = IntPtr.Zero;

                this.Link = link;
                this.LanguageIdentifier = languageIdentifier;
            }

            /// <summary>Synonym for `FoundationAttributes.CreateFromContainer()`.</summary>
            public FoundationAttributes(AttributeContainer container): base(new ConsumedRef(IntPtr.Zero)) { 
                var temp = FoundationAttributes.CreateFromContainer(container);
                reference = temp.reference;
                temp.reference = IntPtr.Zero;
            }

            public static implicit operator AttributeContainer(FoundationAttributes attributes) => attributes.AsContainer();
            public static implicit operator FoundationAttributes(AttributeContainer container) => FoundationAttributes.CreateFromContainer(container);
        }
    }
}
