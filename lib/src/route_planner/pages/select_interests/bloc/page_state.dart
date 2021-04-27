import '../../../../common/failures/failure.dart';
import '../../../models/speciality_model.dart';

class PageState {
  const PageState._({
    this.specialities,
    this.selectedSpecialityIds = const [],
    this.failure,
  }) : super();

  factory PageState.initialize() {
    return PageState._(
      specialities: null,
      selectedSpecialityIds: const [],
      failure: null,
    );
  }

  factory PageState.load(
    List<SpecialityModel> specialities,
  ) {
    return PageState._(
      specialities: specialities,
      selectedSpecialityIds: const [],
      failure: null,
    );
  }

  final List<SpecialityModel>? specialities;
  final List<String> selectedSpecialityIds;
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
                selectedSpecialityIdsCount: ${selectedSpecialityIds.length} 
                failure: $failure 
              }''';
  }

  PageState copyWith({
    List<SpecialityModel>? specialities,
    List<String>? selectedSpecialityIds,
    Failure? failure,
  }) {
    return PageState._(
      specialities: specialities ?? this.specialities,
      selectedSpecialityIds:
          selectedSpecialityIds ?? this.selectedSpecialityIds,
      failure: failure ?? this.failure,
    );
  }
}
