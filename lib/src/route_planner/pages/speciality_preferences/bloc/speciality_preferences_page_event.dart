import 'package:equatable/equatable.dart';

import '../../../models/speciality_model.dart';

abstract class SpecialityPreferencesPageEvent extends Equatable {
  const SpecialityPreferencesPageEvent();

  @override
  List<Object> get props => [];

  @override
  String toString() => '$runtimeType {}';
}

class SpecialityPreferencesInitialize extends SpecialityPreferencesPageEvent {}

class SpecialityPreferencesUpdateSpecialities
    extends SpecialityPreferencesPageEvent {
  const SpecialityPreferencesUpdateSpecialities(
    this.specialities,
  );

  final List<SpecialityModel> specialities;

  @override
  String toString() =>
      '$runtimeType { specialitiesCount: ${specialities.length} }';
}

class SpecialityPreferencesToggleSpeciality
    extends SpecialityPreferencesPageEvent {
  const SpecialityPreferencesToggleSpeciality(
    this.speciality,
  );

  final SpecialityModel speciality;

  @override
  String toString() => '$runtimeType { speciality: $speciality }';
}
