import 'package:estasi/src/data/models/device_info_model.dart';
import 'package:estasi/src/utils/constants.dart';
import 'package:hive/hive.dart';

class DeviceInfoStorageService {
  saveDeviceInfoData({required DeviceInfoData data}) {
    var box = Hive.box(ConstantStrings.deviceInfo);
    box.put(ConstantStrings.deviceInfo, data);
  }

  DeviceInfoData? loadDeviceInfoData() {
    var box = Hive.box(ConstantStrings.deviceInfo);
    DeviceInfoData? deviceInfo = box.get(ConstantStrings.deviceInfo);
    return deviceInfo;
  }

  void deleteDeviceInfoData() {
    var box = Hive.box(ConstantStrings.deviceInfo);
    box.delete(ConstantStrings.deviceInfo);
  }
}
