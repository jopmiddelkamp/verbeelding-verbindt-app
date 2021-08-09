// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'speciality_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SpecialityStateTearOff {
  const _$SpecialityStateTearOff();

  SpecialityInitializingState initializing() {
    return const SpecialityInitializingState();
  }

  SpecialityLoadedState loaded(
      {required List<SpecialityEntity> specialities,
      List<SpecialityEntity> selectedSpecialities = const []}) {
    return SpecialityLoadedState(
      specialities: specialities,
      selectedSpecialities: selectedSpecialities,
    );
  }

  SpecialityFailureState failed() {
    return const SpecialityFailureState();
  }
}

/// @nodoc
const $SpecialityState = _$SpecialityStateTearOff();

/// @nodoc
mixin _$SpecialityState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(List<SpecialityEntity> specialities,
            List<SpecialityEntity> selectedSpecialities)
        loaded,
    required TResult Function() failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(List<SpecialityEntity> specialities,
            List<SpecialityEntity> selectedSpecialities)?
        loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpecialityInitializingState value) initializing,
    required TResult Function(SpecialityLoadedState value) loaded,
    required TResult Function(SpecialityFailureState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpecialityInitializingState value)? initializing,
    TResult Function(SpecialityLoadedState value)? loaded,
    TResult Function(SpecialityFailureState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialityStateCopyWith<$Res> {
  factory $SpecialityStateCopyWith(
          SpecialityState value, $Res Function(SpecialityState) then) =
      _$SpecialityStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpecialityStateCopyWithImpl<$Res>
    implements $SpecialityStateCopyWith<$Res> {
  _$SpecialityStateCopyWithImpl(this._value, this._then);

  final SpecialityState _value;
  // ignore: unused_field
  final $Res Function(SpecialityState) _then;
}

/// @nodoc
abstract class $SpecialityInitializingStateCopyWith<$Res> {
  factory $SpecialityInitializingStateCopyWith(
          SpecialityInitializingState value,
          $Res Function(SpecialityInitializingState) then) =
      _$SpecialityInitializingStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpecialityInitializingStateCopyWithImpl<$Res>
    extends _$SpecialityStateCopyWithImpl<$Res>
    implements $SpecialityInitializingStateCopyWith<$Res> {
  _$SpecialityInitializingStateCopyWithImpl(SpecialityInitializingState _value,
      $Res Function(SpecialityInitializingState) _then)
      : super(_value, (v) => _then(v as SpecialityInitializingState));

  @override
  SpecialityInitializingState get _value =>
      super._value as SpecialityInitializingState;
}

/// @nodoc
class _$SpecialityInitializingState implements SpecialityInitializingState {
  const _$SpecialityInitializingState();

  @override
  String toString() {
    return 'SpecialityState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SpecialityInitializingState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(List<SpecialityEntity> specialities,
            List<SpecialityEntity> selectedSpecialities)
        loaded,
    required TResult Function() failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(List<SpecialityEntity> specialities,
            List<SpecialityEntity> selectedSpecialities)?
        loaded,
    TResult Function()? failed,
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
    required TResult Function(SpecialityInitializingState value) initializing,
    required TResult Function(SpecialityLoadedState value) loaded,
    required TResult Function(SpecialityFailureState value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpecialityInitializingState value)? initializing,
    TResult Function(SpecialityLoadedState value)? loaded,
    TResult Function(SpecialityFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class SpecialityInitializingState implements SpecialityState {
  const factory SpecialityInitializingState() = _$SpecialityInitializingState;
}

/// @nodoc
abstract class $SpecialityLoadedStateCopyWith<$Res> {
  factory $SpecialityLoadedStateCopyWith(SpecialityLoadedState value,
          $Res Function(SpecialityLoadedState) then) =
      _$SpecialityLoadedStateCopyWithImpl<$Res>;
  $Res call(
      {List<SpecialityEntity> specialities,
      List<SpecialityEntity> selectedSpecialities});
}

/// @nodoc
class _$SpecialityLoadedStateCopyWithImpl<$Res>
    extends _$SpecialityStateCopyWithImpl<$Res>
    implements $SpecialityLoadedStateCopyWith<$Res> {
  _$SpecialityLoadedStateCopyWithImpl(
      SpecialityLoadedState _value, $Res Function(SpecialityLoadedState) _then)
      : super(_value, (v) => _then(v as SpecialityLoadedState));

  @override
  SpecialityLoadedState get _value => super._value as SpecialityLoadedState;

  @override
  $Res call({
    Object? specialities = freezed,
    Object? selectedSpecialities = freezed,
  }) {
    return _then(SpecialityLoadedState(
      specialities: specialities == freezed
          ? _value.specialities
          : specialities // ignore: cast_nullable_to_non_nullable
              as List<SpecialityEntity>,
      selectedSpecialities: selectedSpecialities == freezed
          ? _value.selectedSpecialities
          : selectedSpecialities // ignore: cast_nullable_to_non_nullable
              as List<SpecialityEntity>,
    ));
  }
}

/// @nodoc
class _$SpecialityLoadedState implements SpecialityLoadedState {
  const _$SpecialityLoadedState(
      {required this.specialities, this.selectedSpecialities = const []});

  @override
  final List<SpecialityEntity> specialities;
  @JsonKey(defaultValue: const [])
  @override
  final List<SpecialityEntity> selectedSpecialities;

  @override
  String toString() {
    return 'SpecialityState.loaded(specialities: $specialities, selectedSpecialities: $selectedSpecialities)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is SpecialityLoadedState &&
            (identical(other.specialities, specialities) ||
                const DeepCollectionEquality()
                    .equals(other.specialities, specialities)) &&
            (identical(other.selectedSpecialities, selectedSpecialities) ||
                const DeepCollectionEquality()
                    .equals(other.selectedSpecialities, selectedSpecialities)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(specialities) ^
      const DeepCollectionEquality().hash(selectedSpecialities);

  @JsonKey(ignore: true)
  @override
  $SpecialityLoadedStateCopyWith<SpecialityLoadedState> get copyWith =>
      _$SpecialityLoadedStateCopyWithImpl<SpecialityLoadedState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(List<SpecialityEntity> specialities,
            List<SpecialityEntity> selectedSpecialities)
        loaded,
    required TResult Function() failed,
  }) {
    return loaded(specialities, selectedSpecialities);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(List<SpecialityEntity> specialities,
            List<SpecialityEntity> selectedSpecialities)?
        loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(specialities, selectedSpecialities);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpecialityInitializingState value) initializing,
    required TResult Function(SpecialityLoadedState value) loaded,
    required TResult Function(SpecialityFailureState value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpecialityInitializingState value)? initializing,
    TResult Function(SpecialityLoadedState value)? loaded,
    TResult Function(SpecialityFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class SpecialityLoadedState implements SpecialityState {
  const factory SpecialityLoadedState(
      {required List<SpecialityEntity> specialities,
      List<SpecialityEntity> selectedSpecialities}) = _$SpecialityLoadedState;

  List<SpecialityEntity> get specialities => throw _privateConstructorUsedError;
  List<SpecialityEntity> get selectedSpecialities =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SpecialityLoadedStateCopyWith<SpecialityLoadedState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SpecialityFailureStateCopyWith<$Res> {
  factory $SpecialityFailureStateCopyWith(SpecialityFailureState value,
          $Res Function(SpecialityFailureState) then) =
      _$SpecialityFailureStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$SpecialityFailureStateCopyWithImpl<$Res>
    extends _$SpecialityStateCopyWithImpl<$Res>
    implements $SpecialityFailureStateCopyWith<$Res> {
  _$SpecialityFailureStateCopyWithImpl(SpecialityFailureState _value,
      $Res Function(SpecialityFailureState) _then)
      : super(_value, (v) => _then(v as SpecialityFailureState));

  @override
  SpecialityFailureState get _value => super._value as SpecialityFailureState;
}

/// @nodoc
class _$SpecialityFailureState implements SpecialityFailureState {
  const _$SpecialityFailureState();

  @override
  String toString() {
    return 'SpecialityState.failed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is SpecialityFailureState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(List<SpecialityEntity> specialities,
            List<SpecialityEntity> selectedSpecialities)
        loaded,
    required TResult Function() failed,
  }) {
    return failed();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(List<SpecialityEntity> specialities,
            List<SpecialityEntity> selectedSpecialities)?
        loaded,
    TResult Function()? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SpecialityInitializingState value) initializing,
    required TResult Function(SpecialityLoadedState value) loaded,
    required TResult Function(SpecialityFailureState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SpecialityInitializingState value)? initializing,
    TResult Function(SpecialityLoadedState value)? loaded,
    TResult Function(SpecialityFailureState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class SpecialityFailureState implements SpecialityState {
  const factory SpecialityFailureState() = _$SpecialityFailureState;
}
