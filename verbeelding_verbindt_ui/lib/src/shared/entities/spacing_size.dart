import 'package:smart_enums/smart_enums.dart';

class SpacingSize extends SmartEnumWithValue<SpacingSize, double> {
  /// This padding has size 4.0.
  static const smaller = SpacingSize(
    name: 'Smaller',
    value: 4,
  );

  /// This padding has size 6.0.
  static const small = SpacingSize(
    name: 'Small',
    value: 6,
  );

  /// This padding has size 8.0.
  static const medium = SpacingSize(
    name: 'Regular',
    value: 8,
  );

  /// This padding has size 12.0.
  static const big = SpacingSize(
    name: 'Big',
    value: 12,
  );

  /// This padding has size 16.0.
  static const bigger = SpacingSize(
    name: 'Big',
    value: 16,
  );

  const SpacingSize({
    required String name,
    required double value,
  }) : super(name, value);
}
