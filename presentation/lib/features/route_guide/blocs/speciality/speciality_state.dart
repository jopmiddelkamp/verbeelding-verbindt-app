import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/entities/common/speciality.dart';

part 'speciality_state.freezed.dart';

@freezed
class SpecialityState with _$SpecialityState {
  const factory SpecialityState.initializing() = SpecialityInitializing;

  const factory SpecialityState.loaded({
    required List<SpecialityEntity> specialities,
    @Default([]) List<SpecialityEntity> selectedSpecialities,
  }) = SpecialityLoaded;

  const factory SpecialityState.failed() = SpecialityFailureFailed;
}

extension SpecialityLoadedX on SpecialityLoaded {
  bool get hasSelection {
    return selectedSpecialities.isNotEmpty;
  }

  bool get hasNoSelection => !hasSelection;

  List<String> get selectedSpecialityIds =>
      selectedSpecialities.map((specialty) => specialty.id!).toList();

  bool isSelected(
    SpecialityEntity speciality,
  ) {
    return selectedSpecialities.contains(speciality);
  }
}
