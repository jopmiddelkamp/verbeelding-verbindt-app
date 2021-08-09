// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'scan_qr_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScanQrFailureTearOff {
  const _$ScanQrFailureTearOff();

  InvalidScanFailure invalidScan({required QRViewController qrController}) {
    return InvalidScanFailure(
      qrController: qrController,
    );
  }

  GeneralFailure general() {
    return const GeneralFailure();
  }
}

/// @nodoc
const $ScanQrFailure = _$ScanQrFailureTearOff();

/// @nodoc
mixin _$ScanQrFailure {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QRViewController qrController) invalidScan,
    required TResult Function() general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController qrController)? invalidScan,
    TResult Function()? general,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidScanFailure value) invalidScan,
    required TResult Function(GeneralFailure value) general,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidScanFailure value)? invalidScan,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScanQrFailureCopyWith<$Res> {
  factory $ScanQrFailureCopyWith(
          ScanQrFailure value, $Res Function(ScanQrFailure) then) =
      _$ScanQrFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$ScanQrFailureCopyWithImpl<$Res>
    implements $ScanQrFailureCopyWith<$Res> {
  _$ScanQrFailureCopyWithImpl(this._value, this._then);

  final ScanQrFailure _value;
  // ignore: unused_field
  final $Res Function(ScanQrFailure) _then;
}

/// @nodoc
abstract class $InvalidScanFailureCopyWith<$Res> {
  factory $InvalidScanFailureCopyWith(
          InvalidScanFailure value, $Res Function(InvalidScanFailure) then) =
      _$InvalidScanFailureCopyWithImpl<$Res>;
  $Res call({QRViewController qrController});
}

/// @nodoc
class _$InvalidScanFailureCopyWithImpl<$Res>
    extends _$ScanQrFailureCopyWithImpl<$Res>
    implements $InvalidScanFailureCopyWith<$Res> {
  _$InvalidScanFailureCopyWithImpl(
      InvalidScanFailure _value, $Res Function(InvalidScanFailure) _then)
      : super(_value, (v) => _then(v as InvalidScanFailure));

  @override
  InvalidScanFailure get _value => super._value as InvalidScanFailure;

  @override
  $Res call({
    Object? qrController = freezed,
  }) {
    return _then(InvalidScanFailure(
      qrController: qrController == freezed
          ? _value.qrController
          : qrController // ignore: cast_nullable_to_non_nullable
              as QRViewController,
    ));
  }
}

/// @nodoc
class _$InvalidScanFailure implements InvalidScanFailure {
  const _$InvalidScanFailure({required this.qrController});

  @override
  final QRViewController qrController;

  @override
  String toString() {
    return 'ScanQrFailure.invalidScan(qrController: $qrController)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is InvalidScanFailure &&
            (identical(other.qrController, qrController) ||
                const DeepCollectionEquality()
                    .equals(other.qrController, qrController)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(qrController);

  @JsonKey(ignore: true)
  @override
  $InvalidScanFailureCopyWith<InvalidScanFailure> get copyWith =>
      _$InvalidScanFailureCopyWithImpl<InvalidScanFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(QRViewController qrController) invalidScan,
    required TResult Function() general,
  }) {
    return invalidScan(qrController);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController qrController)? invalidScan,
    TResult Function()? general,
    required TResult orElse(),
  }) {
    if (invalidScan != null) {
      return invalidScan(qrController);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(InvalidScanFailure value) invalidScan,
    required TResult Function(GeneralFailure value) general,
  }) {
    return invalidScan(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidScanFailure value)? invalidScan,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) {
    if (invalidScan != null) {
      return invalidScan(this);
    }
    return orElse();
  }
}

abstract class InvalidScanFailure implements ScanQrFailure {
  const factory InvalidScanFailure({required QRViewController qrController}) =
      _$InvalidScanFailure;

  QRViewController get qrController => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InvalidScanFailureCopyWith<InvalidScanFailure> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GeneralFailureCopyWith<$Res> {
  factory $GeneralFailureCopyWith(
          GeneralFailure value, $Res Function(GeneralFailure) then) =
      _$GeneralFailureCopyWithImpl<$Res>;
}

/// @nodoc
class _$GeneralFailureCopyWithImpl<$Res>
    extends _$ScanQrFailureCopyWithImpl<$Res>
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
    return 'ScanQrFailure.general()';
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
    required TResult Function(QRViewController qrController) invalidScan,
    required TResult Function() general,
  }) {
    return general();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(QRViewController qrController)? invalidScan,
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
    required TResult Function(InvalidScanFailure value) invalidScan,
    required TResult Function(GeneralFailure value) general,
  }) {
    return general(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(InvalidScanFailure value)? invalidScan,
    TResult Function(GeneralFailure value)? general,
    required TResult orElse(),
  }) {
    if (general != null) {
      return general(this);
    }
    return orElse();
  }
}

abstract class GeneralFailure implements ScanQrFailure {
  const factory GeneralFailure() = _$GeneralFailure;
}
