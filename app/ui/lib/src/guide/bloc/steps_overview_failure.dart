import 'package:freezed_annotation/freezed_annotation.dart';

part 'steps_overview_failure.freezed.dart';

@freezed
class StepsOverviewFailure with _$StepsOverviewFailure {
  const factory StepsOverviewFailure.noRouteFound() =
      NoRouteFoundStepsOverviewFailure;
  const factory StepsOverviewFailure.general() = GeneralStepsOverviewFailure;
}
