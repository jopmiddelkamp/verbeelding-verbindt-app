import 'package:equatable/equatable.dart';

class SizeGeoLocation extends Equatable {
  const SizeGeoLocation(
    this.width,
    this.height,
  );

  final double width;
  final double height;

  @override
  List<Object?> get props => [
        width,
        height,
      ];
}
