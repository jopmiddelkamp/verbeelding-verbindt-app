class IosDeviceInfoEntity {
  final String id;
  final String name;
  final String systemName;
  final String systemVersion;
  final String model;
  final bool isPhysicalDevice;

  const IosDeviceInfoEntity({
    required this.id,
    required this.name,
    required this.systemName,
    required this.systemVersion,
    required this.model,
    required this.isPhysicalDevice,
  });
}

class AndroidDeviceInfoEntity {
  final String id;
  final String manufacturer;
  final String model;
  final String androidVersion;
  final int androidSDK;
  final bool isPhysicalDevice;

  const AndroidDeviceInfoEntity({
    required this.id,
    required this.manufacturer,
    required this.model,
    required this.androidVersion,
    required this.androidSDK,
    required this.isPhysicalDevice,
  });
}
