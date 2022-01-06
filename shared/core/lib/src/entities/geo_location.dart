import 'package:equatable/equatable.dart';

class Geolocation extends Equatable {
  const Geolocation({
    required this.longitude,
    required this.latitude,
  });

  /// The latitude of this position in degrees normalized to the interval -90.0
  /// to +90.0 (both inclusive).
  final double latitude;

  /// The longitude of the position in degrees normalized to the interval -180
  /// (exclusive) to +180 (inclusive).
  final double longitude;

  @override
  List<Object?> get props => [latitude, longitude];

  @override
  bool? get stringify => true;
}
