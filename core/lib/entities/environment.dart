import '../enums/build_mode_enum.dart';
import '../enums/environment_enum.dart';

class EnvironmentEntity {
  const EnvironmentEntity({
    required this.environment,
    required this.buildMode,
  });

  final Environment environment;
  final BuildMode buildMode;
}
