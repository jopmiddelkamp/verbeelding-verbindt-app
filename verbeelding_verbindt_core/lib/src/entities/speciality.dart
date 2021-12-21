import 'package:equatable/equatable.dart';

import '../../verbeelding_verbindt_core.dart';

class Speciality extends Equatable {
  const Speciality({
    required this.id,
    required this.name,
  });

  final String? id;
  final TranslatableString name;

  @override
  List<Object?> get props => [
        id,
        name,
      ];

  Speciality copyWith({
    String? name,
  }) {
    return Speciality(
      id: id,
      name: name as TranslatableString? ?? this.name,
    );
  }
}
