abstract class DeviceInfoEntity {
  final String id;

  const DeviceInfoEntity({
    required this.id,
  });
}

class IosDeviceInfoEntity extends DeviceInfoEntity {
  final String name;
  final String systemName;
  final String systemVersion;
  final String model;
  final bool isPhysicalDevice;

  const IosDeviceInfoEntity({
    required String id,
    required this.name,
    required this.systemName,
    required this.systemVersion,
    required this.model,
    required this.isPhysicalDevice,
  }) : super(id: id);
}

class AndroidDeviceInfoEntity extends DeviceInfoEntity {
  final String manufacturer;
  final String model;
  final String androidVersion;
  final int androidSDK;
  final bool isPhysicalDevice;

  const AndroidDeviceInfoEntity({
    required String id,
    required this.manufacturer,
    required this.model,
    required this.androidVersion,
    required this.androidSDK,
    required this.isPhysicalDevice,
  }) : super(id: id);
}
