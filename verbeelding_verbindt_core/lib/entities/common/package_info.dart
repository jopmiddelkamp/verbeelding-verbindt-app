import 'package:equatable/equatable.dart';

class PackageInfoEntity extends Equatable {
  const PackageInfoEntity({
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
