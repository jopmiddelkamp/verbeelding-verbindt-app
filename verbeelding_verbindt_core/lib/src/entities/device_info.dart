import 'package:collection/collection.dart';

class DeviceInfoGeoLocation extends DelegatingMap<String, String> {
  DeviceInfoGeoLocation(Map<String, String> base) : super(base);
  DeviceInfoGeoLocation.empty() : super({});
}
