// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'SimpleEnum.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$SimpleEnum {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() red,
    required TResult Function() green,
    required TResult Function() blue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? red,
    TResult? Function()? green,
    TResult? Function()? blue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? red,
    TResult Function()? green,
    TResult Function()? blue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Red value) red,
    required TResult Function(Green value) green,
    required TResult Function(Blue value) blue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Red value)? red,
    TResult? Function(Green value)? green,
    TResult? Function(Blue value)? blue,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Red value)? red,
    TResult Function(Green value)? green,
    TResult Function(Blue value)? blue,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SimpleEnumCopyWith<$Res> {
  factory $SimpleEnumCopyWith(
          SimpleEnum value, $Res Function(SimpleEnum) then) =
      _$SimpleEnumCopyWithImpl<$Res, SimpleEnum>;
}

/// @nodoc
class _$SimpleEnumCopyWithImpl<$Res, $Val extends SimpleEnum>
    implements $SimpleEnumCopyWith<$Res> {
  _$SimpleEnumCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$RedCopyWith<$Res> {
  factory _$$RedCopyWith(_$Red value, $Res Function(_$Red) then) =
      __$$RedCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RedCopyWithImpl<$Res> extends _$SimpleEnumCopyWithImpl<$Res, _$Red>
    implements _$$RedCopyWith<$Res> {
  __$$RedCopyWithImpl(_$Red _value, $Res Function(_$Red) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Red extends Red {
  _$Red() : super._();

  @override
  String toString() {
    return 'SimpleEnum.red()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Red);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() red,
    required TResult Function() green,
    required TResult Function() blue,
  }) {
    return red();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? red,
    TResult? Function()? green,
    TResult? Function()? blue,
  }) {
    return red?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? red,
    TResult Function()? green,
    TResult Function()? blue,
    required TResult orElse(),
  }) {
    if (red != null) {
      return red();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Red value) red,
    required TResult Function(Green value) green,
    required TResult Function(Blue value) blue,
  }) {
    return red(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Red value)? red,
    TResult? Function(Green value)? green,
    TResult? Function(Blue value)? blue,
  }) {
    return red?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Red value)? red,
    TResult Function(Green value)? green,
    TResult Function(Blue value)? blue,
    required TResult orElse(),
  }) {
    if (red != null) {
      return red(this);
    }
    return orElse();
  }
}

abstract class Red extends SimpleEnum {
  factory Red() = _$Red;
  Red._() : super._();
}

/// @nodoc
abstract class _$$GreenCopyWith<$Res> {
  factory _$$GreenCopyWith(_$Green value, $Res Function(_$Green) then) =
      __$$GreenCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GreenCopyWithImpl<$Res>
    extends _$SimpleEnumCopyWithImpl<$Res, _$Green>
    implements _$$GreenCopyWith<$Res> {
  __$$GreenCopyWithImpl(_$Green _value, $Res Function(_$Green) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Green extends Green {
  _$Green() : super._();

  @override
  String toString() {
    return 'SimpleEnum.green()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Green);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() red,
    required TResult Function() green,
    required TResult Function() blue,
  }) {
    return green();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? red,
    TResult? Function()? green,
    TResult? Function()? blue,
  }) {
    return green?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? red,
    TResult Function()? green,
    TResult Function()? blue,
    required TResult orElse(),
  }) {
    if (green != null) {
      return green();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Red value) red,
    required TResult Function(Green value) green,
    required TResult Function(Blue value) blue,
  }) {
    return green(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Red value)? red,
    TResult? Function(Green value)? green,
    TResult? Function(Blue value)? blue,
  }) {
    return green?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Red value)? red,
    TResult Function(Green value)? green,
    TResult Function(Blue value)? blue,
    required TResult orElse(),
  }) {
    if (green != null) {
      return green(this);
    }
    return orElse();
  }
}

abstract class Green extends SimpleEnum {
  factory Green() = _$Green;
  Green._() : super._();
}

/// @nodoc
abstract class _$$BlueCopyWith<$Res> {
  factory _$$BlueCopyWith(_$Blue value, $Res Function(_$Blue) then) =
      __$$BlueCopyWithImpl<$Res>;
}

/// @nodoc
class __$$BlueCopyWithImpl<$Res> extends _$SimpleEnumCopyWithImpl<$Res, _$Blue>
    implements _$$BlueCopyWith<$Res> {
  __$$BlueCopyWithImpl(_$Blue _value, $Res Function(_$Blue) _then)
      : super(_value, _then);
}

/// @nodoc

class _$Blue extends Blue {
  _$Blue() : super._();

  @override
  String toString() {
    return 'SimpleEnum.blue()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$Blue);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() red,
    required TResult Function() green,
    required TResult Function() blue,
  }) {
    return blue();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? red,
    TResult? Function()? green,
    TResult? Function()? blue,
  }) {
    return blue?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? red,
    TResult Function()? green,
    TResult Function()? blue,
    required TResult orElse(),
  }) {
    if (blue != null) {
      return blue();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Red value) red,
    required TResult Function(Green value) green,
    required TResult Function(Blue value) blue,
  }) {
    return blue(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Red value)? red,
    TResult? Function(Green value)? green,
    TResult? Function(Blue value)? blue,
  }) {
    return blue?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Red value)? red,
    TResult Function(Green value)? green,
    TResult Function(Blue value)? blue,
    required TResult orElse(),
  }) {
    if (blue != null) {
      return blue(this);
    }
    return orElse();
  }
}

abstract class Blue extends SimpleEnum {
  factory Blue() = _$Blue;
  Blue._() : super._();
}
