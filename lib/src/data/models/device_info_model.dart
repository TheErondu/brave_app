import 'package:hive/hive.dart';
part 'device_info_model.g.dart';
class DeviceInfo {
  DeviceInfo({
    required this.deviceName,
    required this.deviceModel,
    required this.os,
    required this.manufacturer,
  });
  late String deviceName;
  late String deviceModel;
  late String os;
  late String manufacturer;
}

@HiveType(typeId: 1)
class DeviceInfoData {
  @HiveField(0)
  final String deviceName;
  @HiveField(1)
  final String deviceModel;
  @HiveField(2)
  final String os;
   @HiveField(3)
  final String manufacturer;

  DeviceInfoData({required this.deviceName, required this.deviceModel, required this.os, required this.manufacturer});
}
