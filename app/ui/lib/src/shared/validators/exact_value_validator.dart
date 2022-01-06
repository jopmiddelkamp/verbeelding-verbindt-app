import '../../../verbeelding_verbindt_ui.dart';

class ExactValueValidator<T> extends Validator<T> {
  ExactValueValidator({
    required this.expectedValue,
  });

  final T expectedValue;

  @override
  bool validate(T param) {
    return param == expectedValue;
  }
}
