import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:estatio/src/data/models/device_info_model.dart';
import 'package:estatio/src/services/storage/device_info_storage_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

class DeviceInfoService {
  static final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
  Future<void> initPlatformState() async {
    try {
      if (kIsWeb) {
        final deviceData = await deviceInfoPlugin.webBrowserInfo;
      } else {
        if (Platform.isAndroid) {
          final deviceData = await deviceInfoPlugin.androidInfo;
          DeviceInfoData deviceInfoData = DeviceInfoData(
              deviceName: deviceData.device,
              deviceModel: deviceData.model,
              os: deviceData.version.release,
              manufacturer: deviceData.manufacturer);
          DeviceInfoStorageService().saveDeviceInfoData(data: deviceInfoData);
        } else if (Platform.isIOS) {
          final deviceData = (await deviceInfoPlugin.iosInfo);
          DeviceInfoData deviceInfoData = DeviceInfoData(
              deviceName: deviceData.name.toString(),
              deviceModel: deviceData.model.toString(),
              os: deviceData.systemVersion.toString(),
              manufacturer: "Apple");
          DeviceInfoStorageService().saveDeviceInfoData(data: deviceInfoData);
        } else if (Platform.isLinux) {
          final deviceData = (await deviceInfoPlugin.linuxInfo);
          DeviceInfoData deviceInfoData = DeviceInfoData(
              deviceName: deviceData.name.toString(),
              deviceModel: deviceData.machineId.toString(),
              os: deviceData.prettyName,
              manufacturer: deviceData.id.toString());
          DeviceInfoStorageService().saveDeviceInfoData(data: deviceInfoData);
        } else if (Platform.isMacOS) {
          final deviceData = (await deviceInfoPlugin.macOsInfo);
          DeviceInfoData deviceInfoData = DeviceInfoData(
              deviceName: deviceData.computerName,
              deviceModel: deviceData.model,
              os: deviceData.osRelease,
              manufacturer: "Apple");
          DeviceInfoStorageService().saveDeviceInfoData(data: deviceInfoData);
        } else if (Platform.isWindows) {
          final deviceData = (await deviceInfoPlugin.windowsInfo);
          DeviceInfoData deviceInfoData = DeviceInfoData(
              deviceName: deviceData.computerName,
              deviceModel: deviceData.deviceId,
              os: deviceData.productName,
              manufacturer: deviceData.deviceId);
          DeviceInfoStorageService().saveDeviceInfoData(data: deviceInfoData);
        }
      }
    } on PlatformException {
      throw "Error getting Device Info";
    }
  }
}
