// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'scan_qr_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScanQrStateTearOff {
  const _$ScanQrStateTearOff();

  InitializingScanQrState initializing() {
    return const InitializingScanQrState();
  }

  LoadedScanQrState loaded({required QRViewController qrController}) {
    return LoadedScanQrState(
      qrController: qrController,
    );
  }

  ValidScanScanQrState validScan(
      {required String barcode, required QRViewController qrController}) {
    return ValidScanScanQrState(
      barcode: barcode,
      qrController: qrController,
    );
  }

  FailureScanQrState failed({required ScanQrFailure failure}) {
    return FailureScanQrState(
      failure: failure,
    );
  }
}

/// @nodoc
const $ScanQrState = _$ScanQrStateTearOff();

/// @nodoc
mixin _$ScanQrState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(QRViewController qrController) loaded,
    required TResult Function(String barcode, QRViewController qrController)
        validScan,
    required TResult Function(ScanQrFailure failure) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(QRViewController qrController)? loaded,
    TResult Function(String barcode, QRViewController qrController)? validScan,
    TResult Function(ScanQrFailure failure)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializingScanQrState value) initializing,
    required TResult Function(LoadedScanQrState value) loaded,
    required TResult Function(ValidScanScanQrState value) validScan,
    required TResult Function(FailureScanQrState value) failed,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingScanQrState value)? initializing,
    TResult Function(LoadedScanQrState value)? loaded,
    TResult Function(ValidScanScanQrState value)? validScan,
    TResult Function(FailureScanQrState value)? failed,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanQrStateCopyWith<$Res> {
  factory $ScanQrStateCopyWith(
          ScanQrState value, $Res Function(ScanQrState) then) =
      _$ScanQrStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScanQrStateCopyWithImpl<$Res> implements $ScanQrStateCopyWith<$Res> {
  _$ScanQrStateCopyWithImpl(this._value, this._then);

  final ScanQrState _value;
  // ignore: unused_field
  final $Res Function(ScanQrState) _then;
}

/// @nodoc
abstract class $InitializingScanQrStateCopyWith<$Res> {
  factory $InitializingScanQrStateCopyWith(InitializingScanQrState value,
          $Res Function(InitializingScanQrState) then) =
      _$InitializingScanQrStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$InitializingScanQrStateCopyWithImpl<$Res>
    extends _$ScanQrStateCopyWithImpl<$Res>
    implements $InitializingScanQrStateCopyWith<$Res> {
  _$InitializingScanQrStateCopyWithImpl(InitializingScanQrState _value,
      $Res Function(InitializingScanQrState) _then)
      : super(_value, (v) => _then(v as InitializingScanQrState));

  @override
  InitializingScanQrState get _value => super._value as InitializingScanQrState;
}

/// @nodoc
class _$InitializingScanQrState implements InitializingScanQrState {
  const _$InitializingScanQrState();

  @override
  String toString() {
    return 'ScanQrState.initializing()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InitializingScanQrState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(QRViewController qrController) loaded,
    required TResult Function(String barcode, QRViewController qrController)
        validScan,
    required TResult Function(ScanQrFailure failure) failed,
  }) {
    return initializing();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(QRViewController qrController)? loaded,
    TResult Function(String barcode, QRViewController qrController)? validScan,
    TResult Function(ScanQrFailure failure)? failed,
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
    required TResult Function(InitializingScanQrState value) initializing,
    required TResult Function(LoadedScanQrState value) loaded,
    required TResult Function(ValidScanScanQrState value) validScan,
    required TResult Function(FailureScanQrState value) failed,
  }) {
    return initializing(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingScanQrState value)? initializing,
    TResult Function(LoadedScanQrState value)? loaded,
    TResult Function(ValidScanScanQrState value)? validScan,
    TResult Function(FailureScanQrState value)? failed,
    required TResult orElse(),
  }) {
    if (initializing != null) {
      return initializing(this);
    }
    return orElse();
  }
}

abstract class InitializingScanQrState implements ScanQrState {
  const factory InitializingScanQrState() = _$InitializingScanQrState;
}

/// @nodoc
abstract class $LoadedScanQrStateCopyWith<$Res> {
  factory $LoadedScanQrStateCopyWith(
          LoadedScanQrState value, $Res Function(LoadedScanQrState) then) =
      _$LoadedScanQrStateCopyWithImpl<$Res>;
  $Res call({QRViewController qrController});
}

/// @nodoc
class _$LoadedScanQrStateCopyWithImpl<$Res>
    extends _$ScanQrStateCopyWithImpl<$Res>
    implements $LoadedScanQrStateCopyWith<$Res> {
  _$LoadedScanQrStateCopyWithImpl(
      LoadedScanQrState _value, $Res Function(LoadedScanQrState) _then)
      : super(_value, (v) => _then(v as LoadedScanQrState));

  @override
  LoadedScanQrState get _value => super._value as LoadedScanQrState;

  @override
  $Res call({
    Object? qrController = freezed,
  }) {
    return _then(LoadedScanQrState(
      qrController: qrController == freezed
          ? _value.qrController
          : qrController // ignore: cast_nullable_to_non_nullable
              as QRViewController,
    ));
  }
}

/// @nodoc
class _$LoadedScanQrState implements LoadedScanQrState {
  const _$LoadedScanQrState({required this.qrController});

  @override
  final QRViewController qrController;

  @override
  String toString() {
    return 'ScanQrState.loaded(qrController: $qrController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoadedScanQrState &&
            (identical(other.qrController, qrController) ||
                const DeepCollectionEquality()
                    .equals(other.qrController, qrController)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(qrController);

  @JsonKey(ignore: true)
  @override
  $LoadedScanQrStateCopyWith<LoadedScanQrState> get copyWith =>
      _$LoadedScanQrStateCopyWithImpl<LoadedScanQrState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(QRViewController qrController) loaded,
    required TResult Function(String barcode, QRViewController qrController)
        validScan,
    required TResult Function(ScanQrFailure failure) failed,
  }) {
    return loaded(qrController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(QRViewController qrController)? loaded,
    TResult Function(String barcode, QRViewController qrController)? validScan,
    TResult Function(ScanQrFailure failure)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(qrController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializingScanQrState value) initializing,
    required TResult Function(LoadedScanQrState value) loaded,
    required TResult Function(ValidScanScanQrState value) validScan,
    required TResult Function(FailureScanQrState value) failed,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingScanQrState value)? initializing,
    TResult Function(LoadedScanQrState value)? loaded,
    TResult Function(ValidScanScanQrState value)? validScan,
    TResult Function(FailureScanQrState value)? failed,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class LoadedScanQrState implements ScanQrState {
  const factory LoadedScanQrState({required QRViewController qrController}) =
      _$LoadedScanQrState;

  QRViewController get qrController => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoadedScanQrStateCopyWith<LoadedScanQrState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ValidScanScanQrStateCopyWith<$Res> {
  factory $ValidScanScanQrStateCopyWith(ValidScanScanQrState value,
          $Res Function(ValidScanScanQrState) then) =
      _$ValidScanScanQrStateCopyWithImpl<$Res>;
  $Res call({String barcode, QRViewController qrController});
}

/// @nodoc
class _$ValidScanScanQrStateCopyWithImpl<$Res>
    extends _$ScanQrStateCopyWithImpl<$Res>
    implements $ValidScanScanQrStateCopyWith<$Res> {
  _$ValidScanScanQrStateCopyWithImpl(
      ValidScanScanQrState _value, $Res Function(ValidScanScanQrState) _then)
      : super(_value, (v) => _then(v as ValidScanScanQrState));

  @override
  ValidScanScanQrState get _value => super._value as ValidScanScanQrState;

  @override
  $Res call({
    Object? barcode = freezed,
    Object? qrController = freezed,
  }) {
    return _then(ValidScanScanQrState(
      barcode: barcode == freezed
          ? _value.barcode
          : barcode // ignore: cast_nullable_to_non_nullable
              as String,
      qrController: qrController == freezed
          ? _value.qrController
          : qrController // ignore: cast_nullable_to_non_nullable
              as QRViewController,
    ));
  }
}

/// @nodoc
class _$ValidScanScanQrState implements ValidScanScanQrState {
  const _$ValidScanScanQrState(
      {required this.barcode, required this.qrController});

  @override
  final String barcode;
  @override
  final QRViewController qrController;

  @override
  String toString() {
    return 'ScanQrState.validScan(barcode: $barcode, qrController: $qrController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ValidScanScanQrState &&
            (identical(other.barcode, barcode) ||
                const DeepCollectionEquality()
                    .equals(other.barcode, barcode)) &&
            (identical(other.qrController, qrController) ||
                const DeepCollectionEquality()
                    .equals(other.qrController, qrController)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(barcode) ^
      const DeepCollectionEquality().hash(qrController);

  @JsonKey(ignore: true)
  @override
  $ValidScanScanQrStateCopyWith<ValidScanScanQrState> get copyWith =>
      _$ValidScanScanQrStateCopyWithImpl<ValidScanScanQrState>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(QRViewController qrController) loaded,
    required TResult Function(String barcode, QRViewController qrController)
        validScan,
    required TResult Function(ScanQrFailure failure) failed,
  }) {
    return validScan(barcode, qrController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(QRViewController qrController)? loaded,
    TResult Function(String barcode, QRViewController qrController)? validScan,
    TResult Function(ScanQrFailure failure)? failed,
    required TResult orElse(),
  }) {
    if (validScan != null) {
      return validScan(barcode, qrController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InitializingScanQrState value) initializing,
    required TResult Function(LoadedScanQrState value) loaded,
    required TResult Function(ValidScanScanQrState value) validScan,
    required TResult Function(FailureScanQrState value) failed,
  }) {
    return validScan(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingScanQrState value)? initializing,
    TResult Function(LoadedScanQrState value)? loaded,
    TResult Function(ValidScanScanQrState value)? validScan,
    TResult Function(FailureScanQrState value)? failed,
    required TResult orElse(),
  }) {
    if (validScan != null) {
      return validScan(this);
    }
    return orElse();
  }
}

abstract class ValidScanScanQrState implements ScanQrState {
  const factory ValidScanScanQrState(
      {required String barcode,
      required QRViewController qrController}) = _$ValidScanScanQrState;

  String get barcode => throw _privateConstructorUsedError;
  QRViewController get qrController => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ValidScanScanQrStateCopyWith<ValidScanScanQrState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FailureScanQrStateCopyWith<$Res> {
  factory $FailureScanQrStateCopyWith(
          FailureScanQrState value, $Res Function(FailureScanQrState) then) =
      _$FailureScanQrStateCopyWithImpl<$Res>;
  $Res call({ScanQrFailure failure});

  $ScanQrFailureCopyWith<$Res> get failure;
}

/// @nodoc
class _$FailureScanQrStateCopyWithImpl<$Res>
    extends _$ScanQrStateCopyWithImpl<$Res>
    implements $FailureScanQrStateCopyWith<$Res> {
  _$FailureScanQrStateCopyWithImpl(
      FailureScanQrState _value, $Res Function(FailureScanQrState) _then)
      : super(_value, (v) => _then(v as FailureScanQrState));

  @override
  FailureScanQrState get _value => super._value as FailureScanQrState;

  @override
  $Res call({
    Object? failure = freezed,
  }) {
    return _then(FailureScanQrState(
      failure: failure == freezed
          ? _value.failure
          : failure // ignore: cast_nullable_to_non_nullable
              as ScanQrFailure,
    ));
  }

  @override
  $ScanQrFailureCopyWith<$Res> get failure {
    return $ScanQrFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

/// @nodoc
class _$FailureScanQrState implements FailureScanQrState {
  const _$FailureScanQrState({required this.failure});

  @override
  final ScanQrFailure failure;

  @override
  String toString() {
    return 'ScanQrState.failed(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FailureScanQrState &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @JsonKey(ignore: true)
  @override
  $FailureScanQrStateCopyWith<FailureScanQrState> get copyWith =>
      _$FailureScanQrStateCopyWithImpl<FailureScanQrState>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializing,
    required TResult Function(QRViewController qrController) loaded,
    required TResult Function(String barcode, QRViewController qrController)
        validScan,
    required TResult Function(ScanQrFailure failure) failed,
  }) {
    return failed(failure);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializing,
    TResult Function(QRViewController qrController)? loaded,
    TResult Function(String barcode, QRViewController qrController)? validScan,
    TResult Function(ScanQrFailure failure)? failed,
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
    required TResult Function(InitializingScanQrState value) initializing,
    required TResult Function(LoadedScanQrState value) loaded,
    required TResult Function(ValidScanScanQrState value) validScan,
    required TResult Function(FailureScanQrState value) failed,
  }) {
    return failed(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InitializingScanQrState value)? initializing,
    TResult Function(LoadedScanQrState value)? loaded,
    TResult Function(ValidScanScanQrState value)? validScan,
    TResult Function(FailureScanQrState value)? failed,
    required TResult orElse(),
  }) {
    if (failed != null) {
      return failed(this);
    }
    return orElse();
  }
}

abstract class FailureScanQrState implements ScanQrState {
  const factory FailureScanQrState({required ScanQrFailure failure}) =
      _$FailureScanQrState;

  ScanQrFailure get failure => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FailureScanQrStateCopyWith<FailureScanQrState> get copyWith =>
      throw _privateConstructorUsedError;
}
