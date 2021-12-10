import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class SpecialityGeoLocation extends Equatable {
  const SpecialityGeoLocation({
    required this.id,
    required this.name,
  });

  final String? id;
  final TranslatableStringGeoLocation name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  SpecialityGeoLocation copyWith({
    String? name,
  }) {
    return SpecialityGeoLocation(
      id: id,
      name: name as TranslatableStringGeoLocation? ?? this.name,
    );
  }
}
