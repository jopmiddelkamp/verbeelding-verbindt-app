import '../../../../../../shared/domain/failures/failure.dart';
import '../../../../domain/models/speciality_model.dart';

class PageState {
  const PageState._({
    this.specialities,
    this.selectedSpecialityIds = const [],
    this.selectionConfirmed = false,
    this.failure,
  }) : super();

  factory PageState.initialize() {
    return PageState._(
      specialities: null,
      selectedSpecialityIds: const [],
      selectionConfirmed: false,
      failure: null,
    );
  }

  factory PageState.load(
    List<SpecialityModel> specialities,
  ) {
    return PageState._(
      specialities: specialities,
      selectedSpecialityIds: const [],
      selectionConfirmed: false,
      failure: null,
    );
  }

  final List<SpecialityModel>? specialities;
  final List<String> selectedSpecialityIds;
  final bool selectionConfirmed;
  final Failure? failure;

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

  PageState copyWith({
    List<SpecialityModel>? specialities,
    List<String>? selectedSpecialityIds,
    bool? selectionConfirmed,
    Failure? failure,
  }) {
    return PageState._(
      specialities: specialities ?? this.specialities,
      selectedSpecialityIds:
          selectedSpecialityIds ?? this.selectedSpecialityIds,
      selectionConfirmed: selectionConfirmed ?? this.selectionConfirmed,
      failure: failure ?? this.failure,
    );
  }
}
