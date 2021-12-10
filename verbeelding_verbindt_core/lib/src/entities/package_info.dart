import 'package:equatable/equatable.dart';

class PackageInfoGeoLocation extends Equatable {
  const PackageInfoGeoLocation({
    required this.packageName,
    required this.buildNumber,
    required this.version,
  });

  final String packageName;
  final String buildNumber;
  final String version;

  @override
  List<Object> get props => [
        packageName,
        buildNumber,
        version,
      ];
}
