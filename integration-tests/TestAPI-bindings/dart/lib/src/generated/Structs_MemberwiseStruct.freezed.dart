// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'Structs_MemberwiseStruct.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$Structs_MemberwiseStruct {
  String get immutable => throw _privateConstructorUsedError;
  set immutable(String value) => throw _privateConstructorUsedError;
  String get mutable => throw _privateConstructorUsedError;
  set mutable(String value) => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $Structs_MemberwiseStructCopyWith<Structs_MemberwiseStruct> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $Structs_MemberwiseStructCopyWith<$Res> {
  factory $Structs_MemberwiseStructCopyWith(Structs_MemberwiseStruct value,
          $Res Function(Structs_MemberwiseStruct) then) =
      _$Structs_MemberwiseStructCopyWithImpl<$Res, Structs_MemberwiseStruct>;
  @useResult
  $Res call({String immutable, String mutable});
}

/// @nodoc
class _$Structs_MemberwiseStructCopyWithImpl<$Res,
        $Val extends Structs_MemberwiseStruct>
    implements $Structs_MemberwiseStructCopyWith<$Res> {
  _$Structs_MemberwiseStructCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? immutable = null,
    Object? mutable = null,
  }) {
    return _then(_value.copyWith(
      immutable: null == immutable
          ? _value.immutable
          : immutable // ignore: cast_nullable_to_non_nullable
              as String,
      mutable: null == mutable
          ? _value.mutable
          : mutable // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_Structs_MemberwiseStructCopyWith<$Res>
    implements $Structs_MemberwiseStructCopyWith<$Res> {
  factory _$$_Structs_MemberwiseStructCopyWith(
          _$_Structs_MemberwiseStruct value,
          $Res Function(_$_Structs_MemberwiseStruct) then) =
      __$$_Structs_MemberwiseStructCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String immutable, String mutable});
}

/// @nodoc
class __$$_Structs_MemberwiseStructCopyWithImpl<$Res>
    extends _$Structs_MemberwiseStructCopyWithImpl<$Res,
        _$_Structs_MemberwiseStruct>
    implements _$$_Structs_MemberwiseStructCopyWith<$Res> {
  __$$_Structs_MemberwiseStructCopyWithImpl(_$_Structs_MemberwiseStruct _value,
      $Res Function(_$_Structs_MemberwiseStruct) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? immutable = null,
    Object? mutable = null,
  }) {
    return _then(_$_Structs_MemberwiseStruct(
      immutable: null == immutable
          ? _value.immutable
          : immutable // ignore: cast_nullable_to_non_nullable
              as String,
      mutable: null == mutable
          ? _value.mutable
          : mutable // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_Structs_MemberwiseStruct implements _Structs_MemberwiseStruct {
  _$_Structs_MemberwiseStruct({required this.immutable, required this.mutable});

  @override
  String immutable;
  @override
  String mutable;

  @override
  String toString() {
    return 'Structs_MemberwiseStruct(immutable: $immutable, mutable: $mutable)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_Structs_MemberwiseStructCopyWith<_$_Structs_MemberwiseStruct>
      get copyWith => __$$_Structs_MemberwiseStructCopyWithImpl<
          _$_Structs_MemberwiseStruct>(this, _$identity);
}

abstract class _Structs_MemberwiseStruct implements Structs_MemberwiseStruct {
  factory _Structs_MemberwiseStruct(
      {required String immutable,
      required String mutable}) = _$_Structs_MemberwiseStruct;

  @override
  String get immutable;
  set immutable(String value);
  @override
  String get mutable;
  set mutable(String value);
  @override
  @JsonKey(ignore: true)
  _$$_Structs_MemberwiseStructCopyWith<_$_Structs_MemberwiseStruct>
      get copyWith => throw _privateConstructorUsedError;
}
