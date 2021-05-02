import 'package:equatable/equatable.dart';

import '../entities/translatable_string.dart';

class SpecialityEntity extends Equatable {
  const SpecialityEntity({
    required this.id,
    required this.name,
  });

  final String? id;
  final TranslatableStringEntity name;

  @override
  List<Object?> get props => [id, name];

  SpecialityEntity copyWith({
    String? name,
  }) {
    return SpecialityEntity(
      id: id,
      name: name as TranslatableStringEntity? ?? this.name,
    );
  }
}
