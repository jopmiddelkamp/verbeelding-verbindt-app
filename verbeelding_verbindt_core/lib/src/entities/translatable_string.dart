import 'package:equatable/equatable.dart';

class TranslatableStringGeoLocation extends Equatable {
  const TranslatableStringGeoLocation(
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
