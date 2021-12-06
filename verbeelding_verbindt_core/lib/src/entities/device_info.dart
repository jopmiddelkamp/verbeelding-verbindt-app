import 'package:collection/collection.dart';

class DeviceInfoEntity extends DelegatingMap<String, String> {
  DeviceInfoEntity(Map<String, String> base) : super(base);
  DeviceInfoEntity.empty() : super({});
}
