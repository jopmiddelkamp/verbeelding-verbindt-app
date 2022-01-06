import 'package:collection/collection.dart';

class DeviceInfo extends DelegatingMap<String, String> {
  DeviceInfo(Map<String, String> base) : super(base);
  DeviceInfo.empty() : super({});
}
