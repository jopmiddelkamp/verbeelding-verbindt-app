import 'package:smart_enums/smart_enums.dart';

class PaddingSize extends SmartEnumWithValue<PaddingSize, double> {
  /// This padding has size 4.0.
  static const tiny = PaddingSize(
    name: 'Tiny',
    value: 4,
  );

  /// This padding has size 8.0.
  static const smaller = PaddingSize(
    name: 'Small',
    value: 8,
  );

  /// This padding has size 12.0.
  static const small = PaddingSize(
    name: 'Small',
    value: 12,
  );

  /// This padding has size 16.0.
  static const medium = PaddingSize(
    name: 'Regular',
    value: 16,
  );

  /// This padding has size 20.0.
  static const big = PaddingSize(
    name: 'Big',
    value: 20,
  );

  /// This padding has size 24.0.
  static const bigger = PaddingSize(
    name: 'Big',
    value: 24,
  );

  const PaddingSize({
    required String name,
    required double value,
  }) : super(name, value);
}
