// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'route_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$RouteStateTearOff {
  const _$RouteStateTearOff();

  InitializingRouteState initializing() {
    return const InitializingRouteState();
  }

  LoadedRouteState loaded({required RouteEntity route}) {
    return LoadedRouteState(
      route: route,
    );
  }

  FailureRouteState failed({required RouteFailure failure}) {
    return FailureRouteState(
      failure: failure,
    );
  }
}

/// @nodoc
const $RouteState = _$RouteStateTearOff();

/// @nodoc
mixin _$RouteState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(RouteEntity route) loaded,
    required TResult Function(RouteFailure failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(RouteEntity route)? loaded,
    TResult Function(RouteFailure failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializingRouteState value) initializing,
    required TResult Function(LoadedRouteState value) loaded,
    required TResult Function(FailureRouteState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingRouteState value)? initializing,
    TResult Function(LoadedRouteState value)? loaded,
    TResult Function(FailureRouteState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStateCopyWith<$Res> {
  factory $RouteStateCopyWith(
          RouteState value, $Res Function(RouteState) then) =
      _$RouteStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$RouteStateCopyWithImpl<$Res> implements $RouteStateCopyWith<$Res> {
  _$RouteStateCopyWithImpl(this._value, this._then);

  final RouteState _value;
  // ignore: unused_field
  final $Res Function(RouteState) _then;
}

/// @nodoc
abstract class $InitializingRouteStateCopyWith<$Res> {
  factory $InitializingRouteStateCopyWith(InitializingRouteState value,
          $Res Function(InitializingRouteState) then) =
      _$InitializingRouteStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializingRouteStateCopyWithImpl<$Res>
    extends _$RouteStateCopyWithImpl<$Res>
    implements $InitializingRouteStateCopyWith<$Res> {
  _$InitializingRouteStateCopyWithImpl(InitializingRouteState _value,
      $Res Function(InitializingRouteState) _then)
      : super(_value, (v) => _then(v as InitializingRouteState));

  @override
  InitializingRouteState get _value => super._value as InitializingRouteState;
}

/// @nodoc
class _$InitializingRouteState implements InitializingRouteState {
  const _$InitializingRouteState();

  @override
  String toString() {
    return 'RouteState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializingRouteState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(RouteEntity route) loaded,
    required TResult Function(RouteFailure failure) failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(RouteEntity route)? loaded,
    TResult Function(RouteFailure failure)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializingRouteState value) initializing,
    required TResult Function(LoadedRouteState value) loaded,
    required TResult Function(FailureRouteState value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingRouteState value)? initializing,
    TResult Function(LoadedRouteState value)? loaded,
    TResult Function(FailureRouteState value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class InitializingRouteState implements RouteState {
  const factory InitializingRouteState() = _$InitializingRouteState;
}

/// @nodoc
abstract class $LoadedRouteStateCopyWith<$Res> {
  factory $LoadedRouteStateCopyWith(
          LoadedRouteState value, $Res Function(LoadedRouteState) then) =
      _$LoadedRouteStateCopyWithImpl<$Res>;
  $Res call({RouteEntity route});
}

/// @nodoc
class _$LoadedRouteStateCopyWithImpl<$Res>
    extends _$RouteStateCopyWithImpl<$Res>
    implements $LoadedRouteStateCopyWith<$Res> {
  _$LoadedRouteStateCopyWithImpl(
      LoadedRouteState _value, $Res Function(LoadedRouteState) _then)
      : super(_value, (v) => _then(v as LoadedRouteState));

  @override
  LoadedRouteState get _value => super._value as LoadedRouteState;

  @override
  $Res call({
    Object? route = freezed,
  }) {
    return _then(LoadedRouteState(
      route: route == freezed
          ? _value.route
          : route // ignore: cast_nullable_to_non_nullable
              as RouteEntity,
    ));
  }
}

/// @nodoc
class _$LoadedRouteState implements LoadedRouteState {
  const _$LoadedRouteState({required this.route});

  @override
  final RouteEntity route;

  @override
  String toString() {
    return 'RouteState.loaded(route: $route)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedRouteState &&
            (identical(other.route, route) ||
                const DeepCollectionEquality().equals(other.route, route)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(route);

  @JsonKey(ignore: true)
  @override
  $LoadedRouteStateCopyWith<LoadedRouteState> get copyWith =>
      _$LoadedRouteStateCopyWithImpl<LoadedRouteState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(RouteEntity route) loaded,
    required TResult Function(RouteFailure failure) failed,
  }) {
    return loaded(route);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(RouteEntity route)? loaded,
    TResult Function(RouteFailure failure)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(route);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializingRouteState value) initializing,
    required TResult Function(LoadedRouteState value) loaded,
    required TResult Function(FailureRouteState value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingRouteState value)? initializing,
    TResult Function(LoadedRouteState value)? loaded,
    TResult Function(FailureRouteState value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedRouteState implements RouteState {
  const factory LoadedRouteState({required RouteEntity route}) =
      _$LoadedRouteState;

  RouteEntity get route => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedRouteStateCopyWith<LoadedRouteState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureRouteStateCopyWith<$Res> {
  factory $FailureRouteStateCopyWith(
          FailureRouteState value, $Res Function(FailureRouteState) then) =
      _$FailureRouteStateCopyWithImpl<$Res>;
  $Res call({RouteFailure failure});

  $RouteFailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$FailureRouteStateCopyWithImpl<$Res>
    extends _$RouteStateCopyWithImpl<$Res>
    implements $FailureRouteStateCopyWith<$Res> {
  _$FailureRouteStateCopyWithImpl(
      FailureRouteState _value, $Res Function(FailureRouteState) _then)
      : super(_value, (v) => _then(v as FailureRouteState));

  @override
  FailureRouteState get _value => super._value as FailureRouteState;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(FailureRouteState(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as RouteFailure,
    ));
  }

  @override
  $RouteFailureCopyWith<$Res> get failure {
    return $RouteFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$FailureRouteState implements FailureRouteState {
  const _$FailureRouteState({required this.failure});

  @override
  final RouteFailure failure;

  @override
  String toString() {
    return 'RouteState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FailureRouteState &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $FailureRouteStateCopyWith<FailureRouteState> get copyWith =>
      _$FailureRouteStateCopyWithImpl<FailureRouteState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(RouteEntity route) loaded,
    required TResult Function(RouteFailure failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(RouteEntity route)? loaded,
    TResult Function(RouteFailure failure)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializingRouteState value) initializing,
    required TResult Function(LoadedRouteState value) loaded,
    required TResult Function(FailureRouteState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingRouteState value)? initializing,
    TResult Function(LoadedRouteState value)? loaded,
    TResult Function(FailureRouteState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailureRouteState implements RouteState {
  const factory FailureRouteState({required RouteFailure failure}) =
      _$FailureRouteState;

  RouteFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureRouteStateCopyWith<FailureRouteState> get copyWith =>
      throw _privateConstructorUsedError;
}
