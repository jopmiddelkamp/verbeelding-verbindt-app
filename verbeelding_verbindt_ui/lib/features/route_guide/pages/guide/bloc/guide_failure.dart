import 'package:freezed_annotation/freezed_annotation.dart';

part 'guide_failure.freezed.dart';

@freezed
class GuideFailure with _$GuideFailure {
  const factory GuideFailure.noRouteFound() = NoRouteFoundFailure;
  const factory GuideFailure.general() = GeneralFailure;
}
