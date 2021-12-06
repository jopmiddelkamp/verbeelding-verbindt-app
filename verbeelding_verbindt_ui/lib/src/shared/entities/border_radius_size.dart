import 'package:smart_enums/smart_enums.dart';

class BorderRadiusSize extends SmartEnumWithValue<BorderRadiusSize, double> {
  /// This padding has size 4.0.
  static const small = BorderRadiusSize._(4);

  /// This padding has size 12.0.
  static const medium = BorderRadiusSize._(12);

  /// This padding has size 16.0.
  static const big = BorderRadiusSize._(16);

  const BorderRadiusSize._(
    double value,
  ) : super(value);
}
