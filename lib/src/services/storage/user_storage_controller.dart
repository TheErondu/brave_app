import 'package:estatio/src/data/models/user.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:hive/hive.dart';

class UserStorageService {
 saveUserData({required UserData data}) {
 //  await Hive.openBox(ConstantStrings.userData);
    var box = Hive.box(ConstantStrings.userData);
    box.put(ConstantStrings.userData, data);
  }

  UserData? loadUserData() {
 //   Hive.openBox(ConstantStrings.userData);
    var box = Hive.box(ConstantStrings.userData);
    UserData? userData = box.get(ConstantStrings.userData);
    return userData;
  }

  void deleteUserData() {
 //   Hive.openBox(ConstantStrings.userData);
    var box = Hive.box(ConstantStrings.userData);
    box.delete(ConstantStrings.userData);
  }
}
