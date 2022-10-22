import 'package:estatio/src/data/models/generic_resonse_model.dart';
import 'package:estatio/src/data/repository/api_service.dart';
import 'package:estatio/src/utils/api_endpoins.dart';
import 'package:estatio/src/data/models/auth_response.dart';
import 'package:estatio/src/data/models/user_model.dart';
import 'package:estatio/src/data/providers/storage_provider.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRepository {
  Future<UserModel?> userInfo() async {
    final res = await ApiService(
            method: RequestMethod.get,
            secured: true,
            endpoint: ApiEndpoints.getUserinfo)
        .apiCall();

    if (res != null && res.success) {
      UserModel data = UserModel.fromJson(res.data);
      //print(data.results!);
      Storage().saveStringToBox("user", "name", data.name);
      return data;
    } else {
      return null;
    }
  }

  Future<GenericResponse> login(String email, String password) async {
    await Hive.openBox('auth');
    var requestData = {
      "email": email,
      "password": password,
      "device_name": "Redmi note 10 Pro"
    };
    final res = await ApiService(
            method: RequestMethod.post,
            endpoint: ApiEndpoints.login,
            requestData: requestData)
        .apiCall();
    if (res != null && res.success) {
      final data = AuthResponse.fromJson(res.data);
      //print(data.results!);
      Storage().saveStringToBox("auth", "token", data.token);
      return res;
    } else {
      return res!;
    }
  }
}
