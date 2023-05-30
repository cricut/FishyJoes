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
    required TResult Function(Thing value) thing,
    required TResult Function(Other value) other,
    required TResult Function(Bar value) bar,
    required TResult Function(NoValue value) noValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Thing value)? thing,
    TResult? Function(Other value)? other,
    TResult? Function(Bar value)? bar,
    TResult? Function(NoValue value)? noValue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Thing value)? thing,
    TResult Function(Other value)? other,
    TResult Function(Bar value)? bar,
    TResult Function(NoValue value)? noValue,
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
abstract class _$$ThingCopyWith<$Res> {
  factory _$$ThingCopyWith(_$Thing value, $Res Function(_$Thing) then) =
      __$$ThingCopyWithImpl<$Res>;
  @useResult
  $Res call({int value});
}

/// @nodoc
class __$$ThingCopyWithImpl<$Res>
    extends _$AssociatedDataEnumCopyWithImpl<$Res, _$Thing>
    implements _$$ThingCopyWith<$Res> {
  __$$ThingCopyWithImpl(_$Thing _value, $Res Function(_$Thing) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? value = null,
  }) {
    return _then(_$Thing(
      null == value
          ? _value.value
          : value // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$Thing extends Thing {
  _$Thing(this.value) : super._();

  @override
  int value;

  @override
  String toString() {
    return 'AssociatedDataEnum.thing(value: $value)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ThingCopyWith<_$Thing> get copyWith =>
      __$$ThingCopyWithImpl<_$Thing>(this, _$identity);

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
    required TResult Function(Thing value) thing,
    required TResult Function(Other value) other,
    required TResult Function(Bar value) bar,
    required TResult Function(NoValue value) noValue,
  }) {
    return thing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Thing value)? thing,
    TResult? Function(Other value)? other,
    TResult? Function(Bar value)? bar,
    TResult? Function(NoValue value)? noValue,
  }) {
    return thing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Thing value)? thing,
    TResult Function(Other value)? other,
    TResult Function(Bar value)? bar,
    TResult Function(NoValue value)? noValue,
    required TResult orElse(),
  }) {
    if (thing != null) {
      return thing(this);
    }
    return orElse();
  }
}

abstract class Thing extends AssociatedDataEnum {
  factory Thing(int value) = _$Thing;
  Thing._() : super._();

  int get value;
  set value(int value);
  @JsonKey(ignore: true)
  _$$ThingCopyWith<_$Thing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$OtherCopyWith<$Res> {
  factory _$$OtherCopyWith(_$Other value, $Res Function(_$Other) then) =
      __$$OtherCopyWithImpl<$Res>;
  @useResult
  $Res call({String unnamed, int m_1});
}

/// @nodoc
class __$$OtherCopyWithImpl<$Res>
    extends _$AssociatedDataEnumCopyWithImpl<$Res, _$Other>
    implements _$$OtherCopyWith<$Res> {
  __$$OtherCopyWithImpl(_$Other _value, $Res Function(_$Other) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? unnamed = null,
    Object? m_1 = null,
  }) {
    return _then(_$Other(
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

class _$Other extends Other {
  _$Other(this.unnamed, this.m_1) : super._();

  @override
  String unnamed;
  @override
  int m_1;

  @override
  String toString() {
    return 'AssociatedDataEnum.other(unnamed: $unnamed, m_1: $m_1)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OtherCopyWith<_$Other> get copyWith =>
      __$$OtherCopyWithImpl<_$Other>(this, _$identity);

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
    required TResult Function(Thing value) thing,
    required TResult Function(Other value) other,
    required TResult Function(Bar value) bar,
    required TResult Function(NoValue value) noValue,
  }) {
    return other(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Thing value)? thing,
    TResult? Function(Other value)? other,
    TResult? Function(Bar value)? bar,
    TResult? Function(NoValue value)? noValue,
  }) {
    return other?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Thing value)? thing,
    TResult Function(Other value)? other,
    TResult Function(Bar value)? bar,
    TResult Function(NoValue value)? noValue,
    required TResult orElse(),
  }) {
    if (other != null) {
      return other(this);
    }
    return orElse();
  }
}

abstract class Other extends AssociatedDataEnum {
  factory Other(String unnamed, int m_1) = _$Other;
  Other._() : super._();

  String get unnamed;
  set unnamed(String value);
  int get m_1;
  set m_1(int value);
  @JsonKey(ignore: true)
  _$$OtherCopyWith<_$Other> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$BarCopyWith<$Res> {
  factory _$$BarCopyWith(_$Bar value, $Res Function(_$Bar) then) =
      __$$BarCopyWithImpl<$Res>;
  @useResult
  $Res call({String named, TestAPI.AssociatedDataEnum m_1});

  $AssociatedDataEnumCopyWith<$Res> get m_1;
}

/// @nodoc
class __$$BarCopyWithImpl<$Res>
    extends _$AssociatedDataEnumCopyWithImpl<$Res, _$Bar>
    implements _$$BarCopyWith<$Res> {
  __$$BarCopyWithImpl(_$Bar _value, $Res Function(_$Bar) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? named = null,
    Object? m_1 = null,
  }) {
    return _then(_$Bar(
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

class _$Bar extends Bar {
  _$Bar(this.named, this.m_1) : super._();

  @override
  String named;
  @override
  TestAPI.AssociatedDataEnum m_1;

  @override
  String toString() {
    return 'AssociatedDataEnum.bar(named: $named, m_1: $m_1)';
  }

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BarCopyWith<_$Bar> get copyWith =>
      __$$BarCopyWithImpl<_$Bar>(this, _$identity);

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
    required TResult Function(Thing value) thing,
    required TResult Function(Other value) other,
    required TResult Function(Bar value) bar,
    required TResult Function(NoValue value) noValue,
  }) {
    return bar(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Thing value)? thing,
    TResult? Function(Other value)? other,
    TResult? Function(Bar value)? bar,
    TResult? Function(NoValue value)? noValue,
  }) {
    return bar?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Thing value)? thing,
    TResult Function(Other value)? other,
    TResult Function(Bar value)? bar,
    TResult Function(NoValue value)? noValue,
    required TResult orElse(),
  }) {
    if (bar != null) {
      return bar(this);
    }
    return orElse();
  }
}

abstract class Bar extends AssociatedDataEnum {
  factory Bar(String named, TestAPI.AssociatedDataEnum m_1) = _$Bar;
  Bar._() : super._();

  String get named;
  set named(String value);
  TestAPI.AssociatedDataEnum get m_1;
  set m_1(TestAPI.AssociatedDataEnum value);
  @JsonKey(ignore: true)
  _$$BarCopyWith<_$Bar> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$NoValueCopyWith<$Res> {
  factory _$$NoValueCopyWith(_$NoValue value, $Res Function(_$NoValue) then) =
      __$$NoValueCopyWithImpl<$Res>;
}

/// @nodoc
class __$$NoValueCopyWithImpl<$Res>
    extends _$AssociatedDataEnumCopyWithImpl<$Res, _$NoValue>
    implements _$$NoValueCopyWith<$Res> {
  __$$NoValueCopyWithImpl(_$NoValue _value, $Res Function(_$NoValue) _then)
      : super(_value, _then);
}

/// @nodoc

class _$NoValue extends NoValue {
  _$NoValue() : super._();

  @override
  String toString() {
    return 'AssociatedDataEnum.noValue()';
  }

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
    required TResult Function(Thing value) thing,
    required TResult Function(Other value) other,
    required TResult Function(Bar value) bar,
    required TResult Function(NoValue value) noValue,
  }) {
    return noValue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Thing value)? thing,
    TResult? Function(Other value)? other,
    TResult? Function(Bar value)? bar,
    TResult? Function(NoValue value)? noValue,
  }) {
    return noValue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Thing value)? thing,
    TResult Function(Other value)? other,
    TResult Function(Bar value)? bar,
    TResult Function(NoValue value)? noValue,
    required TResult orElse(),
  }) {
    if (noValue != null) {
      return noValue(this);
    }
    return orElse();
  }
}

abstract class NoValue extends AssociatedDataEnum {
  factory NoValue() = _$NoValue;
  NoValue._() : super._();
}
