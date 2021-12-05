import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide_failure.freezed.dart';

@freezed
class GuideFailure with _$GuideFailure {
  const factory GuideFailure.noRouteFound() = NoRouteFoundGuideFailure;
  const factory GuideFailure.general() = GeneralGuideFailure;
}
