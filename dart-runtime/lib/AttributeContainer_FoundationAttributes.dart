import './AttributeContainer.dart';
import 'dart:ffi' as ffi;
import 'runtime.dart';

/// Attributes defined by the Swift Foundation library in ``AttributeScopes``, packaged as a static type.
/// 
/// This type (and the ones like it defined in other libraries) allow features similar to those
/// offered by Swift dynamic member lookup in ``AttributeScope`` to be exported to other languages.
/// 
/// An attribute container can be asked to fill in the fields defined by this structure using `AttributeContainerFoundationAttributes(AttributeContainer)`.
/// This type can be asked to fill in an attribute container using `AttributeContainer(FoundationAttributes)`.
/// 
/// Combining these calls with `AttributedString.setAttributes(_:)` and `AttributedString.mergeAttributes(_:)` allows expansion
/// of attributed strings with new attributes in other languages analogously to how it is done in ``AttributeScopes`` using Swift dynamic member lookup.
/// 
/// <!-- FishyJoes.exportReference(AttributeContainer.FoundationAttributes) -->
class AttributeContainer_FoundationAttributes extends SwiftReference {
    AttributeContainer_FoundationAttributes(ffi.Pointer reference): super(reference) {}
    static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) =>
        createRef(AttributeContainer_FoundationAttributes(ref))
    );

    /// A link attribute.
    /// <!-- FishyJoes.export(link) -->
    // System.Uri? get link =>
    //     GCRef.using(this, (_thisHandle) =>
    //         check((exn) =>
    //             consumeCreatedRef<System.Uri?>(f__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(Loader.shared.env, _thisHandle.ptr, exn))
    //         )
    //     )
    // ;
    // void set link(System.Uri? value) {
    //     GCRef.using(this, (_thisHandle) =>
    //         GCRef.using(value, (_valueHandle) =>
    //             check((exn) =>
    //                 f__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
    //             )
    //         )
    //     )
    //     ;
    // }
    /// A language identifier attribute.
    /// <!-- FishyJoes.export(languageIdentifier) -->
    String? get languageIdentifier =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                consumeCreatedRef<String?>(f__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(Loader.shared.env, _thisHandle.ptr, exn))
            )
        )
    ;
    void set languageIdentifier(String? value) {
        GCRef.using(this, (_thisHandle) =>
            GCRef.using(value, (_valueHandle) =>
                check((exn) =>
                    f__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier(Loader.shared.env, _thisHandle.ptr, _valueHandle.ptr, exn)
                )
            )
        )
        ;
    }
    int get hashCode =>
        GCRef.using(this, (_thisHandle) =>
            check((exn) =>
                f__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash(Loader.shared.env, _thisHandle.ptr, exn)
            )
        )
    ;
    /// Creates a Foundation attribute container having no attribute values.
    /// <!-- FishyJoes.export(createEmpty) -->
    static AttributeContainer_FoundationAttributes createEmpty(
    ) =>
        consumeCreatedRef<AttributeContainer_FoundationAttributes>(check((OutCreatedRef _exn) => f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty(Loader.shared.env, _exn)))
    ;

    /// Extracts the Foundation attributes from an attribute container and makes them available as statically typed properties.
    /// <!-- FishyJoes.export(createFromContainer) -->
    static AttributeContainer_FoundationAttributes createFromContainer(
        AttributeContainer container,
    ) =>
        GCRef.using(container, (_containerHandle) =>
            consumeCreatedRef<AttributeContainer_FoundationAttributes>(check((OutCreatedRef _exn) => f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer(Loader.shared.env, _containerHandle.ptr, _exn)))
        )
    ;

    bool operator ==(
        Object? other,
    ) =>
        GCRef.using(this, (thisHandle) =>
            GCRef.using(other as AttributeContainer_FoundationAttributes, (otherHandle) =>
                check((exn) => f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals(Loader.shared.env, thisHandle.ptr, otherHandle.ptr, exn))))
    ;

    static late CreatedRef Function(
        Env env,
        OutCreatedRef _exn
    ) f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createEmpty;
    static late CreatedRef Function(
        Env env,
        UnownedRef container,
        OutCreatedRef _exn
    ) f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_createFromContainer;
    static late bool Function(
        Env env,
        UnownedRef lhs,
        UnownedRef rhs,
        OutCreatedRef _exn
    ) f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_equals;
    static late int Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_hash;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier;
    static late CreatedRef Function(
        Env env,
        UnownedRef _this,
        OutCreatedRef _exn
    ) f__iota_get_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef languageIdentifier,
        OutCreatedRef _exn
    ) f__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_languageIdentifier;
    static late void Function(
        Env env,
        UnownedRef _this,
        UnownedRef link,
        OutCreatedRef _exn
    ) f__iota_set_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_link;
}
