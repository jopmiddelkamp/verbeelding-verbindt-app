import '../../../models/speciality_model.dart';

abstract class SpecialityPreferencesPageState {
  const SpecialityPreferencesPageState() : super();

  @override
  String toString() => '$runtimeType {}';
}

class SpecialityPreferencesInitializing extends SpecialityPreferencesPageState {
}

class SpecialityPreferencesUpdated extends SpecialityPreferencesPageState {
  const SpecialityPreferencesUpdated({
    this.specialities = const [],
    this.selectedSpecialityIds = const [],
  });

  final List<SpecialityModel> specialities;
  final List<String> selectedSpecialityIds;

  @override
  String toString() {
    return '''$runtimeType { 
                specialitiesCount: ${specialities.length}, 
                selectedSpecialityIdsCount: ${selectedSpecialityIds.length} 
              }''';
  }

  SpecialityPreferencesUpdated copyWith({
    List<SpecialityModel>? specialities,
    List<String>? selectedSpecialityIds,
  }) {
    return SpecialityPreferencesUpdated(
      specialities: specialities ?? this.specialities,
      selectedSpecialityIds:
          selectedSpecialityIds ?? this.selectedSpecialityIds,
    );
  }
}

class SpecialityPreferencesNoSpecialities
    extends SpecialityPreferencesPageState {}
