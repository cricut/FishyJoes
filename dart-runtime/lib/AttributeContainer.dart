import 'dart:ffi' as ffi;
import 'runtime.dart';

/// A type that provides a way to store attributes and their values outside of an attributed string.
///
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
///
/// <!-- FishyJoes.exportReference(AttributeContainer) -->
class AttributeContainer extends SwiftReference {
  AttributeContainer(ffi.Pointer reference) : super(reference) {}
  static CreatedRef ffi_new(ffi.Pointer ref, OutCreatedRef exn) => check((exn) => createRef(AttributeContainer(ref)));

  @override
  int get hashCode => GCRef.using(
    this,
    (_thisHandle) => check(
      (exn) => f__iota_get_FishyJoesCommonRuntime_AttributeContainer_hash(Loader.shared.env, _thisHandle.ptr, exn),
    ),
  );

  /// Merges the attributes of another attribute container with those of this container.
  ///
  /// - Parameter other The other attribute container whose attributes should be merged into this container.
  /// - Parameter keepCurrent For attributes in `other` that already have a value in this container,
  ///     passing `true` retains the current value of the attribute,
  ///     passing `false` replaces the value of the attribute with the one in `other`.
  ///
  /// <!-- FishyJoes.export(merge) -->
  void merge(
    AttributeContainer other, {
    bool keepCurrent = false,
  }) => GCRef.using(
    this,
    (_thisHandle) => GCRef.using(
      other,
      (_otherHandle) => check(
        (OutCreatedRef _exn) => f__iota_FishyJoesCommonRuntime_AttributeContainer_merge(
          Loader.shared.env,
          _thisHandle.ptr,
          _otherHandle.ptr,
          keepCurrent,
          _exn,
        ),
      ),
    ),
  );

  /// Creates an attribute container having no attribute values.
  /// <!-- FishyJoes.export(createEmpty) -->
  static AttributeContainer createEmpty() => consumeCreatedRef<AttributeContainer>(
    check(
      (OutCreatedRef _exn) => f__iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty(Loader.shared.env, _exn),
    ),
  );

  @override
  bool operator ==(
    Object other,
  ) => GCRef.using(
    this,
    (thisHandle) => GCRef.using(
      other as AttributeContainer,
      (otherHandle) => check(
        (exn) => f__iota_FishyJoesCommonRuntime_AttributeContainer_equals(
          Loader.shared.env,
          thisHandle.ptr,
          otherHandle.ptr,
          exn,
        ),
      ),
    ),
  );

  static late CreatedRef Function(Env env, OutCreatedRef _exn)
  f__iota_FishyJoesCommonRuntime_AttributeContainer_createEmpty;
  static late bool Function(Env env, UnownedRef lhs, UnownedRef rhs, OutCreatedRef _exn)
  f__iota_FishyJoesCommonRuntime_AttributeContainer_equals;
  static late void Function(Env env, UnownedRef _this, UnownedRef other, bool keepCurrent, OutCreatedRef _exn)
  f__iota_FishyJoesCommonRuntime_AttributeContainer_merge;
  static late int Function(Env env, UnownedRef _this, OutCreatedRef _exn)
  f__iota_get_FishyJoesCommonRuntime_AttributeContainer_hash;
  static late int Function(Env env, UnownedRef _this, OutCreatedRef _exn)
  f__iota_FishyJoesCommonRuntime_AttributeContainer_FoundationAttributes_asContainer;
}
