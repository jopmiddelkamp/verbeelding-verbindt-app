// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'route_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RouteFailureTearOff {
  const _$RouteFailureTearOff();

  NoRouteFoundFailure noRouteFound() {
    return const NoRouteFoundFailure();
  }

  GeneralFailure general() {
    return const GeneralFailure();
  }
}

/// @nodoc
const $RouteFailure = _$RouteFailureTearOff();

/// @nodoc
mixin _$RouteFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noRouteFound,
    required TResult Function() general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noRouteFound,
    TResult Function()? general,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoRouteFoundFailure value) noRouteFound,
    required TResult Function(GeneralFailure value) general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoRouteFoundFailure value)? noRouteFound,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteFailureCopyWith<$Res> {
  factory $RouteFailureCopyWith(
          RouteFailure value, $Res Function(RouteFailure) then) =
      _$RouteFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteFailureCopyWithImpl<$Res> implements $RouteFailureCopyWith<$Res> {
  _$RouteFailureCopyWithImpl(this._value, this._then);

  final RouteFailure _value;
  // ignore: unused_field
  final $Res Function(RouteFailure) _then;
}

/// @nodoc
abstract class $NoRouteFoundFailureCopyWith<$Res> {
  factory $NoRouteFoundFailureCopyWith(
          NoRouteFoundFailure value, $Res Function(NoRouteFoundFailure) then) =
      _$NoRouteFoundFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$NoRouteFoundFailureCopyWithImpl<$Res>
    extends _$RouteFailureCopyWithImpl<$Res>
    implements $NoRouteFoundFailureCopyWith<$Res> {
  _$NoRouteFoundFailureCopyWithImpl(
      NoRouteFoundFailure _value, $Res Function(NoRouteFoundFailure) _then)
      : super(_value, (v) => _then(v as NoRouteFoundFailure));

  @override
  NoRouteFoundFailure get _value => super._value as NoRouteFoundFailure;
}

/// @nodoc
class _$NoRouteFoundFailure implements NoRouteFoundFailure {
  const _$NoRouteFoundFailure();

  @override
  String toString() {
    return 'RouteFailure.noRouteFound()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoRouteFoundFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noRouteFound,
    required TResult Function() general,
  }) {
    return noRouteFound();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noRouteFound,
    TResult Function()? general,
    required TResult orElse(),
  }) {
    if (noRouteFound != null) {
      return noRouteFound();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoRouteFoundFailure value) noRouteFound,
    required TResult Function(GeneralFailure value) general,
  }) {
    return noRouteFound(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoRouteFoundFailure value)? noRouteFound,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) {
    if (noRouteFound != null) {
      return noRouteFound(this);
    }
    return orElse();
  }
}

abstract class NoRouteFoundFailure implements RouteFailure {
  const factory NoRouteFoundFailure() = _$NoRouteFoundFailure;
}

/// @nodoc
abstract class $GeneralFailureCopyWith<$Res> {
  factory $GeneralFailureCopyWith(
          GeneralFailure value, $Res Function(GeneralFailure) then) =
      _$GeneralFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$GeneralFailureCopyWithImpl<$Res>
    extends _$RouteFailureCopyWithImpl<$Res>
    implements $GeneralFailureCopyWith<$Res> {
  _$GeneralFailureCopyWithImpl(
      GeneralFailure _value, $Res Function(GeneralFailure) _then)
      : super(_value, (v) => _then(v as GeneralFailure));

  @override
  GeneralFailure get _value => super._value as GeneralFailure;
}

/// @nodoc
class _$GeneralFailure implements GeneralFailure {
  const _$GeneralFailure();

  @override
  String toString() {
    return 'RouteFailure.general()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is GeneralFailure);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() noRouteFound,
    required TResult Function() general,
  }) {
    return general();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? noRouteFound,
    TResult Function()? general,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(NoRouteFoundFailure value) noRouteFound,
    required TResult Function(GeneralFailure value) general,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(NoRouteFoundFailure value)? noRouteFound,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class GeneralFailure implements RouteFailure {
  const factory GeneralFailure() = _$GeneralFailure;
}
