import 'package:equatable/equatable.dart';

class TranslatableStringEntity extends Equatable {
  const TranslatableStringEntity(
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
