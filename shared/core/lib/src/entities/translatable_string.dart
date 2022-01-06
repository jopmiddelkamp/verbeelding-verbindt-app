import 'package:equatable/equatable.dart';

class TranslatableString extends Equatable {
  const TranslatableString(
    this.data,
  );

  final Map<String, String> data;

  String get value {
    const defaultCountryCode = 'nl';
    return data[defaultCountryCode] as String;
  }

  @override
  List<Object?> get props => [data];
}
