// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'AssociatedDataEnum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AssociatedDataEnum {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) thing,
    required TResult Function(String unnamed, int m_1) other,
    required TResult Function(String named, TestAPI.AssociatedDataEnum m_1) bar,
    required TResult Function() noValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? thing,
    TResult? Function(String unnamed, int m_1)? other,
    TResult? Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult? Function()? noValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? thing,
    TResult Function(String unnamed, int m_1)? other,
    TResult Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult Function()? noValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssociatedDataEnum_Thing value) thing,
    required TResult Function(AssociatedDataEnum_Other value) other,
    required TResult Function(AssociatedDataEnum_Bar value) bar,
    required TResult Function(AssociatedDataEnum_NoValue value) noValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssociatedDataEnum_Thing value)? thing,
    TResult? Function(AssociatedDataEnum_Other value)? other,
    TResult? Function(AssociatedDataEnum_Bar value)? bar,
    TResult? Function(AssociatedDataEnum_NoValue value)? noValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssociatedDataEnum_Thing value)? thing,
    TResult Function(AssociatedDataEnum_Other value)? other,
    TResult Function(AssociatedDataEnum_Bar value)? bar,
    TResult Function(AssociatedDataEnum_NoValue value)? noValue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AssociatedDataEnumCopyWith<$Res> {
  factory $AssociatedDataEnumCopyWith(
          AssociatedDataEnum value, $Res Function(AssociatedDataEnum) then) =
      _$AssociatedDataEnumCopyWithImpl<$Res, AssociatedDataEnum>;
}

/// @nodoc
class _$AssociatedDataEnumCopyWithImpl<$Res, $Val extends AssociatedDataEnum>
    implements $AssociatedDataEnumCopyWith<$Res> {
  _$AssociatedDataEnumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AssociatedDataEnum_ThingCopyWith<$Res> {
  factory _$$AssociatedDataEnum_ThingCopyWith(_$AssociatedDataEnum_Thing value,
          $Res Function(_$AssociatedDataEnum_Thing) then) =
      __$$AssociatedDataEnum_ThingCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$AssociatedDataEnum_ThingCopyWithImpl<$Res>
    extends _$AssociatedDataEnumCopyWithImpl<$Res, _$AssociatedDataEnum_Thing>
    implements _$$AssociatedDataEnum_ThingCopyWith<$Res> {
  __$$AssociatedDataEnum_ThingCopyWithImpl(_$AssociatedDataEnum_Thing _value,
      $Res Function(_$AssociatedDataEnum_Thing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$AssociatedDataEnum_Thing(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AssociatedDataEnum_Thing extends AssociatedDataEnum_Thing {
  _$AssociatedDataEnum_Thing(this.value) : super._();

  @override
  final int value;

  @override
  String toString() {
    return 'AssociatedDataEnum.thing(value: $value)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssociatedDataEnum_Thing &&
            (identical(other.value, value) || other.value == value));
  }

  @override
  int get hashCode => Object.hash(runtimeType, value);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssociatedDataEnum_ThingCopyWith<_$AssociatedDataEnum_Thing>
      get copyWith =>
          __$$AssociatedDataEnum_ThingCopyWithImpl<_$AssociatedDataEnum_Thing>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) thing,
    required TResult Function(String unnamed, int m_1) other,
    required TResult Function(String named, TestAPI.AssociatedDataEnum m_1) bar,
    required TResult Function() noValue,
  }) {
    return thing(value);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? thing,
    TResult? Function(String unnamed, int m_1)? other,
    TResult? Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult? Function()? noValue,
  }) {
    return thing?.call(value);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? thing,
    TResult Function(String unnamed, int m_1)? other,
    TResult Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult Function()? noValue,
    required TResult orElse(),
  }) {
    if (thing != null) {
      return thing(value);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssociatedDataEnum_Thing value) thing,
    required TResult Function(AssociatedDataEnum_Other value) other,
    required TResult Function(AssociatedDataEnum_Bar value) bar,
    required TResult Function(AssociatedDataEnum_NoValue value) noValue,
  }) {
    return thing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssociatedDataEnum_Thing value)? thing,
    TResult? Function(AssociatedDataEnum_Other value)? other,
    TResult? Function(AssociatedDataEnum_Bar value)? bar,
    TResult? Function(AssociatedDataEnum_NoValue value)? noValue,
  }) {
    return thing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssociatedDataEnum_Thing value)? thing,
    TResult Function(AssociatedDataEnum_Other value)? other,
    TResult Function(AssociatedDataEnum_Bar value)? bar,
    TResult Function(AssociatedDataEnum_NoValue value)? noValue,
    required TResult orElse(),
  }) {
    if (thing != null) {
      return thing(this);
    }
    return orElse();
  }
}

abstract class AssociatedDataEnum_Thing extends AssociatedDataEnum {
  factory AssociatedDataEnum_Thing(final int value) =
      _$AssociatedDataEnum_Thing;
  AssociatedDataEnum_Thing._() : super._();

  int get value;
  @JsonKey(ignore: true)
  _$$AssociatedDataEnum_ThingCopyWith<_$AssociatedDataEnum_Thing>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssociatedDataEnum_OtherCopyWith<$Res> {
  factory _$$AssociatedDataEnum_OtherCopyWith(_$AssociatedDataEnum_Other value,
          $Res Function(_$AssociatedDataEnum_Other) then) =
      __$$AssociatedDataEnum_OtherCopyWithImpl<$Res>;
  @useResult
  $Res call({String unnamed, int m_1});
}

/// @nodoc
class __$$AssociatedDataEnum_OtherCopyWithImpl<$Res>
    extends _$AssociatedDataEnumCopyWithImpl<$Res, _$AssociatedDataEnum_Other>
    implements _$$AssociatedDataEnum_OtherCopyWith<$Res> {
  __$$AssociatedDataEnum_OtherCopyWithImpl(_$AssociatedDataEnum_Other _value,
      $Res Function(_$AssociatedDataEnum_Other) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unnamed = null,
    Object? m_1 = null,
  }) {
    return _then(_$AssociatedDataEnum_Other(
      null == unnamed
          ? _value.unnamed
          : unnamed // ignore: cast_nullable_to_non_nullable
              as String,
      null == m_1
          ? _value.m_1
          : m_1 // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$AssociatedDataEnum_Other extends AssociatedDataEnum_Other {
  _$AssociatedDataEnum_Other(this.unnamed, this.m_1) : super._();

  @override
  final String unnamed;
  @override
  final int m_1;

  @override
  String toString() {
    return 'AssociatedDataEnum.other(unnamed: $unnamed, m_1: $m_1)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssociatedDataEnum_Other &&
            (identical(other.unnamed, unnamed) || other.unnamed == unnamed) &&
            (identical(other.m_1, m_1) || other.m_1 == m_1));
  }

  @override
  int get hashCode => Object.hash(runtimeType, unnamed, m_1);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssociatedDataEnum_OtherCopyWith<_$AssociatedDataEnum_Other>
      get copyWith =>
          __$$AssociatedDataEnum_OtherCopyWithImpl<_$AssociatedDataEnum_Other>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) thing,
    required TResult Function(String unnamed, int m_1) other,
    required TResult Function(String named, TestAPI.AssociatedDataEnum m_1) bar,
    required TResult Function() noValue,
  }) {
    return other(unnamed, m_1);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? thing,
    TResult? Function(String unnamed, int m_1)? other,
    TResult? Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult? Function()? noValue,
  }) {
    return other?.call(unnamed, m_1);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? thing,
    TResult Function(String unnamed, int m_1)? other,
    TResult Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult Function()? noValue,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(unnamed, m_1);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssociatedDataEnum_Thing value) thing,
    required TResult Function(AssociatedDataEnum_Other value) other,
    required TResult Function(AssociatedDataEnum_Bar value) bar,
    required TResult Function(AssociatedDataEnum_NoValue value) noValue,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssociatedDataEnum_Thing value)? thing,
    TResult? Function(AssociatedDataEnum_Other value)? other,
    TResult? Function(AssociatedDataEnum_Bar value)? bar,
    TResult? Function(AssociatedDataEnum_NoValue value)? noValue,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssociatedDataEnum_Thing value)? thing,
    TResult Function(AssociatedDataEnum_Other value)? other,
    TResult Function(AssociatedDataEnum_Bar value)? bar,
    TResult Function(AssociatedDataEnum_NoValue value)? noValue,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }
}

abstract class AssociatedDataEnum_Other extends AssociatedDataEnum {
  factory AssociatedDataEnum_Other(final String unnamed, final int m_1) =
      _$AssociatedDataEnum_Other;
  AssociatedDataEnum_Other._() : super._();

  String get unnamed;
  int get m_1;
  @JsonKey(ignore: true)
  _$$AssociatedDataEnum_OtherCopyWith<_$AssociatedDataEnum_Other>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssociatedDataEnum_BarCopyWith<$Res> {
  factory _$$AssociatedDataEnum_BarCopyWith(_$AssociatedDataEnum_Bar value,
          $Res Function(_$AssociatedDataEnum_Bar) then) =
      __$$AssociatedDataEnum_BarCopyWithImpl<$Res>;
  @useResult
  $Res call({String named, TestAPI.AssociatedDataEnum m_1});

  $AssociatedDataEnumCopyWith<$Res> get m_1;
}

/// @nodoc
class __$$AssociatedDataEnum_BarCopyWithImpl<$Res>
    extends _$AssociatedDataEnumCopyWithImpl<$Res, _$AssociatedDataEnum_Bar>
    implements _$$AssociatedDataEnum_BarCopyWith<$Res> {
  __$$AssociatedDataEnum_BarCopyWithImpl(_$AssociatedDataEnum_Bar _value,
      $Res Function(_$AssociatedDataEnum_Bar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? named = null,
    Object? m_1 = null,
  }) {
    return _then(_$AssociatedDataEnum_Bar(
      null == named
          ? _value.named
          : named // ignore: cast_nullable_to_non_nullable
              as String,
      null == m_1
          ? _value.m_1
          : m_1 // ignore: cast_nullable_to_non_nullable
              as TestAPI.AssociatedDataEnum,
    ));
  }

  @override
  @pragma('vm:prefer-inline')
  $AssociatedDataEnumCopyWith<$Res> get m_1 {
    return $AssociatedDataEnumCopyWith<$Res>(_value.m_1, (value) {
      return _then(_value.copyWith(m_1: value));
    });
  }
}

/// @nodoc

class _$AssociatedDataEnum_Bar extends AssociatedDataEnum_Bar {
  _$AssociatedDataEnum_Bar(this.named, this.m_1) : super._();

  @override
  final String named;
  @override
  final TestAPI.AssociatedDataEnum m_1;

  @override
  String toString() {
    return 'AssociatedDataEnum.bar(named: $named, m_1: $m_1)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssociatedDataEnum_Bar &&
            (identical(other.named, named) || other.named == named) &&
            (identical(other.m_1, m_1) || other.m_1 == m_1));
  }

  @override
  int get hashCode => Object.hash(runtimeType, named, m_1);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AssociatedDataEnum_BarCopyWith<_$AssociatedDataEnum_Bar> get copyWith =>
      __$$AssociatedDataEnum_BarCopyWithImpl<_$AssociatedDataEnum_Bar>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) thing,
    required TResult Function(String unnamed, int m_1) other,
    required TResult Function(String named, TestAPI.AssociatedDataEnum m_1) bar,
    required TResult Function() noValue,
  }) {
    return bar(named, m_1);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? thing,
    TResult? Function(String unnamed, int m_1)? other,
    TResult? Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult? Function()? noValue,
  }) {
    return bar?.call(named, m_1);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? thing,
    TResult Function(String unnamed, int m_1)? other,
    TResult Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult Function()? noValue,
    required TResult orElse(),
  }) {
    if (bar != null) {
      return bar(named, m_1);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssociatedDataEnum_Thing value) thing,
    required TResult Function(AssociatedDataEnum_Other value) other,
    required TResult Function(AssociatedDataEnum_Bar value) bar,
    required TResult Function(AssociatedDataEnum_NoValue value) noValue,
  }) {
    return bar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssociatedDataEnum_Thing value)? thing,
    TResult? Function(AssociatedDataEnum_Other value)? other,
    TResult? Function(AssociatedDataEnum_Bar value)? bar,
    TResult? Function(AssociatedDataEnum_NoValue value)? noValue,
  }) {
    return bar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssociatedDataEnum_Thing value)? thing,
    TResult Function(AssociatedDataEnum_Other value)? other,
    TResult Function(AssociatedDataEnum_Bar value)? bar,
    TResult Function(AssociatedDataEnum_NoValue value)? noValue,
    required TResult orElse(),
  }) {
    if (bar != null) {
      return bar(this);
    }
    return orElse();
  }
}

abstract class AssociatedDataEnum_Bar extends AssociatedDataEnum {
  factory AssociatedDataEnum_Bar(
          final String named, final TestAPI.AssociatedDataEnum m_1) =
      _$AssociatedDataEnum_Bar;
  AssociatedDataEnum_Bar._() : super._();

  String get named;
  TestAPI.AssociatedDataEnum get m_1;
  @JsonKey(ignore: true)
  _$$AssociatedDataEnum_BarCopyWith<_$AssociatedDataEnum_Bar> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AssociatedDataEnum_NoValueCopyWith<$Res> {
  factory _$$AssociatedDataEnum_NoValueCopyWith(
          _$AssociatedDataEnum_NoValue value,
          $Res Function(_$AssociatedDataEnum_NoValue) then) =
      __$$AssociatedDataEnum_NoValueCopyWithImpl<$Res>;
}

/// @nodoc
class __$$AssociatedDataEnum_NoValueCopyWithImpl<$Res>
    extends _$AssociatedDataEnumCopyWithImpl<$Res, _$AssociatedDataEnum_NoValue>
    implements _$$AssociatedDataEnum_NoValueCopyWith<$Res> {
  __$$AssociatedDataEnum_NoValueCopyWithImpl(
      _$AssociatedDataEnum_NoValue _value,
      $Res Function(_$AssociatedDataEnum_NoValue) _then)
      : super(_value, _then);
}

/// @nodoc

class _$AssociatedDataEnum_NoValue extends AssociatedDataEnum_NoValue {
  _$AssociatedDataEnum_NoValue() : super._();

  @override
  String toString() {
    return 'AssociatedDataEnum.noValue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AssociatedDataEnum_NoValue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(int value) thing,
    required TResult Function(String unnamed, int m_1) other,
    required TResult Function(String named, TestAPI.AssociatedDataEnum m_1) bar,
    required TResult Function() noValue,
  }) {
    return noValue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(int value)? thing,
    TResult? Function(String unnamed, int m_1)? other,
    TResult? Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult? Function()? noValue,
  }) {
    return noValue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(int value)? thing,
    TResult Function(String unnamed, int m_1)? other,
    TResult Function(String named, TestAPI.AssociatedDataEnum m_1)? bar,
    TResult Function()? noValue,
    required TResult orElse(),
  }) {
    if (noValue != null) {
      return noValue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AssociatedDataEnum_Thing value) thing,
    required TResult Function(AssociatedDataEnum_Other value) other,
    required TResult Function(AssociatedDataEnum_Bar value) bar,
    required TResult Function(AssociatedDataEnum_NoValue value) noValue,
  }) {
    return noValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(AssociatedDataEnum_Thing value)? thing,
    TResult? Function(AssociatedDataEnum_Other value)? other,
    TResult? Function(AssociatedDataEnum_Bar value)? bar,
    TResult? Function(AssociatedDataEnum_NoValue value)? noValue,
  }) {
    return noValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AssociatedDataEnum_Thing value)? thing,
    TResult Function(AssociatedDataEnum_Other value)? other,
    TResult Function(AssociatedDataEnum_Bar value)? bar,
    TResult Function(AssociatedDataEnum_NoValue value)? noValue,
    required TResult orElse(),
  }) {
    if (noValue != null) {
      return noValue(this);
    }
    return orElse();
  }
}

abstract class AssociatedDataEnum_NoValue extends AssociatedDataEnum {
  factory AssociatedDataEnum_NoValue() = _$AssociatedDataEnum_NoValue;
  AssociatedDataEnum_NoValue._() : super._();
}
