import 'package:estatio/src/data/services/storage/user_storage_controller.dart.dart';
import 'package:estatio/src/data/models/generic_resonse_model.dart';
import 'package:estatio/src/data/models/user.dart';
import 'package:estatio/src/data/services/api_service.dart';
import 'package:estatio/src/utils/api_endpoins.dart';
import 'package:estatio/src/data/models/auth_response.dart';
import 'package:estatio/src/data/services/storage_service.dart';

class UserRepository {
  Future<User?> userInfo() async {
    final res = await ApiService.apiCall(
        method: RequestMethod.get,
        secured: true,
        endpoint: ApiEndpoints.getUserinfo);

    if (res != null && res.success) {
      User data = User.fromJson(res.data);
      //print(data.results!);
      UserData userData = UserData(
          name: data.name, email: data.email, createdAt: data.createdAt);
      UserStorageService().saveUserData(data: userData);
      return data;
    } else {
      return null;
    }
  }

  Future<GenericResponse> login(String email, String password) async {
    var requestData = {
      "email": email,
      "password": password,
      "device_name": "Redmi note 10 Pro"
    };
    final res = await ApiService.apiCall(
        method: RequestMethod.post,
        endpoint: ApiEndpoints.login,
        requestData: requestData);
    if (res != null && res.success) {
      final data = AuthResponse.fromJson(res.data);
      //print(data.results!);
      StorageService().saveStringToBox("auth", "token", data.token);
      return res;
    } else {
      return res!;
    }
  }

  Future<void> logout() async {
    await ApiService.apiCall(
        method: RequestMethod.get,
        endpoint: ApiEndpoints.logout,
        secured: true);
  }
}
