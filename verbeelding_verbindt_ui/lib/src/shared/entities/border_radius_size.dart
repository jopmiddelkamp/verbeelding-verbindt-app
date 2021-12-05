import 'package:smart_enums/smart_enums.dart';

class BorderRadiusSize extends SmartEnumWithValue<BorderRadiusSize, double> {
  /// This padding has size 4.0.
  static const small = BorderRadiusSize(
    name: 'Small',
    value: 4,
  );

  /// This padding has size 12.0.
  static const medium = BorderRadiusSize(
    name: 'Big',
    value: 12,
  );

  /// This padding has size 16.0.
  static const big = BorderRadiusSize(
    name: 'Big',
    value: 16,
  );

  const BorderRadiusSize({
    required String name,
    required double value,
  }) : super(name, value);
}
