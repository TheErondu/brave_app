import 'package:estasi/src/data/models/device_info_model.dart';
import 'package:estasi/src/data/models/user.dart';
import 'package:estasi/src/utils/constants.dart';
import 'package:hive/hive.dart';

class StorageInit {
  static void registerAdapters() async {
    Hive.registerAdapter(UserDataAdapter());
    Hive.registerAdapter(DeviceInfoDataAdapter());
  }

  static void openBoxes() {
    Hive.openBox('auth');
    Hive.openBox(ConstantStrings.userData);
  }
}
