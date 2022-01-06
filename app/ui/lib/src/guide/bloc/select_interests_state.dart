import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:verbeelding_verbindt_core/verbeelding_verbindt_core.dart';

part 'select_interests_state.freezed.dart';

@freezed
class SelectedInterestsState with _$SelectedInterestsState {
  const factory SelectedInterestsState.initializing() =
      SelectedInterestsInitializing;

  const factory SelectedInterestsState.loaded({
    required List<Speciality> specialities,
    @Default([]) List<Speciality> selectedSpecialities,
  }) = SelectedInterestsLoaded;

  const factory SelectedInterestsState.failed() =
      SelectedInterestsFailureFailed;
}

extension SelectedInterestsLoadedX on SelectedInterestsLoaded {
  bool get hasSelection {
    return selectedSpecialities.isNotEmpty;
  }

  bool get hasNoSelection => !hasSelection;

  List<String> get selectedSelectedInterestsIds =>
      selectedSpecialities.map((specialty) => specialty.id!).toList();

  bool isSelected(
    Speciality speciality,
  ) {
    return selectedSpecialities.contains(speciality);
  }
}
