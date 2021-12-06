import 'package:smart_enums/smart_enums.dart';

class PaddingSize extends SmartEnumWithValue<PaddingSize, double> {
  /// This padding has size 4.0.
  static const tiny = PaddingSize._(4);

  /// This padding has size 8.0.
  static const smaller = PaddingSize._(8);

  /// This padding has size 12.0.
  static const small = PaddingSize._(12);

  /// This padding has size 16.0.
  static const medium = PaddingSize._(16);

  /// This padding has size 20.0.
  static const big = PaddingSize._(20);

  /// This padding has size 24.0.
  static const bigger = PaddingSize._(24);

  const PaddingSize._(
    double value,
  ) : super(value);
}
