import 'package:verbeelding_verbindt_core/entities/speciality.dart';
import 'package:verbeelding_verbindt_core/failures/failure.dart';

import '../../../../shared/bloc/state_base.dart';

class SelectInterestsState extends StateBase {
  SelectInterestsState._({
    this.specialities,
    this.selectedSpecialityIds = const [],
    this.selectionConfirmed = false,
    Failure? failure,
  }) : super(
          failure: failure,
        );

  factory SelectInterestsState.initialize() {
    return SelectInterestsState._(
      specialities: null,
      selectedSpecialityIds: const [],
      selectionConfirmed: false,
      failure: null,
    );
  }

  factory SelectInterestsState.load(
    List<SpecialityEntity> specialities,
  ) {
    return SelectInterestsState._(
      specialities: specialities,
      selectedSpecialityIds: const [],
      selectionConfirmed: false,
      failure: null,
    );
  }

  final List<SpecialityEntity>? specialities;
  final List<String> selectedSpecialityIds;
  final bool selectionConfirmed;

  bool get specialitiesLoaded => specialities != null;
  bool get hasSpecialities =>
      specialitiesLoaded && specialities?.isEmpty != true;
  bool get hasSelection => selectedSpecialityIds.isNotEmpty;
  bool get hasFailure => failure == null;

  @override
  String toString() {
    return '''$runtimeType { 
                specialitiesCount: ${specialities?.length}, 
                selectedSpecialityIdsCount: ${selectedSpecialityIds.length},
                selectionConfirmed: $selectionConfirmed,
                failure: $failure 
              }''';
  }

  SelectInterestsState copyWith({
    List<SpecialityEntity>? specialities,
    List<String>? selectedSpecialityIds,
    bool? selectionConfirmed,
    Failure? failure,
  }) {
    return SelectInterestsState._(
      specialities: specialities ?? this.specialities,
      selectedSpecialityIds:
          selectedSpecialityIds ?? this.selectedSpecialityIds,
      selectionConfirmed: selectionConfirmed ?? this.selectionConfirmed,
      failure: failure ?? this.failure,
    );
  }
}
