import 'package:smart_enums/smart_enums.dart';

class SpacingSize extends SmartEnumWithValue<SpacingSize, double> {
  /// This padding has size 4.0.
  static const smaller = SpacingSize._(4);

  /// This padding has size 6.0.
  static const small = SpacingSize._(6);

  /// This padding has size 8.0.
  static const medium = SpacingSize._(8);

  /// This padding has size 12.0.
  static const big = SpacingSize._(12);

  /// This padding has size 16.0.
  static const bigger = SpacingSize._(16);

  const SpacingSize._(
    double value,
  ) : super(value);
}
