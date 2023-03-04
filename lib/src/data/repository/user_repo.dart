import 'package:brave/src/services/storage/device_info_storage_service.dart';
import 'package:brave/src/services/storage/user_storage_service.dart';
import 'package:brave/src/data/models/generic_resonse_model.dart';
import 'package:brave/src/data/models/user.dart';
import 'package:brave/src/services/api_service.dart';
import 'package:brave/src/utils/api_endpoins.dart';
import 'package:brave/src/data/models/auth_response.dart';
import 'package:brave/src/services/storage_service.dart';

class UserRepository {
  Future<User?> getUserInfo() async {
    final res = await ApiService.apiCall(
        method: RequestMethod.get,
        secured: true,
        endpoint: ApiEndpoints.getUserinfo);

    if (res != null && res.success) {
      User data = User.fromJson(res.data);
      UserData userData = UserData(
          name: data.name, email: data.email, createdAt: data.createdAt);
      UserStorageService().saveUserData(data: userData);
      //  PushService.sendUserPushToken();
      return data;
    } else {
      return null;
    }
  }

  Future<GenericResponse> login(String email, String password) async {
   final device = DeviceInfoStorageService().loadDeviceInfoData();
    var requestData = {
      "email": email,
      "password": password,
      "device_name": device?.deviceModel
    };
    final res = await ApiService.apiCall(
        method: RequestMethod.post,
        endpoint: ApiEndpoints.login,
        requestData: requestData);
    if (res != null && res.success) {
      final data = AuthResponse.fromJson(res.data);
      //print(data.results!);
      StorageService().saveStringToBox("auth", "token", data.token);
      await UserRepository().getUserInfo();
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
