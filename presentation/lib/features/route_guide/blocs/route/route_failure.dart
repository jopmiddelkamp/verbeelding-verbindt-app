import 'package:freezed_annotation/freezed_annotation.dart';

part 'route_failure.freezed.dart';

@freezed
class RouteFailure with _$RouteFailure {
  const factory RouteFailure.noRouteFound() = NoRouteFoundFailure;
  const factory RouteFailure.general() = GeneralFailure;
}
