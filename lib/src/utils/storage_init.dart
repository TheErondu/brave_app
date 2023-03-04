import 'package:brave/src/data/models/device_info_model.dart';
import 'package:brave/src/data/models/user.dart';
import 'package:brave/src/utils/constants.dart';
import 'package:hive/hive.dart';

class StorageInit {
  static Future<void> registerAdapters() async {
    Hive.registerAdapter(UserDataAdapter());
    Hive.registerAdapter(DeviceInfoDataAdapter());
  }

  static Future <void> openBoxes() async {
  await  Hive.openBox(ConstantStrings.deviceInfo);
    Hive.openBox('auth');
    Hive.openBox(ConstantStrings.userData);
  }
}
