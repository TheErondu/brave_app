import 'package:estatio/src/data/models/user.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:hive/hive.dart';

class UserStorageService {
  Future<void> saveUserData({required UserData data}) async {
    await Hive.openBox(ConstantStrings.userData);
    var box = Hive.box(ConstantStrings.userData);
    box.put(ConstantStrings.userData, data);
  }

  UserData loadUserData() {
    Hive.openBox(ConstantStrings.userData);
    var box = Hive.box(ConstantStrings.userData);
    UserData userData = box.get(ConstantStrings.userData);
    return userData;
  }
}
