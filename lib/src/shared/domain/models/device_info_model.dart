class IosDeviceInfoModel {
  final String name;
  final String systemName;
  final String systemVersion;
  final String model;
  final bool isPhysicalDevice;

  const IosDeviceInfoModel({
    required this.name,
    required this.systemName,
    required this.systemVersion,
    required this.model,
    required this.isPhysicalDevice,
  });
}

class AndroidDeviceInfoModel {
  final String manufacturer;
  final String model;
  final String androidVersion;
  final int androidSDK;
  final bool isPhysicalDevice;

  const AndroidDeviceInfoModel({
    required this.manufacturer,
    required this.model,
    required this.androidVersion,
    required this.androidSDK,
    required this.isPhysicalDevice,
  });
}
