import 'package:estatio/src/data/models/user.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:hive/hive.dart';

class StorageInit {
  static void registerAdapters() async{
    Hive.registerAdapter(UserDataAdapter());
  }

  static void openBoxes() {
    Hive.openBox('auth');
    Hive.openBox(ConstantStrings.userData);
  }
}
