import 'package:estasi/src/services/api_service.dart';
import 'package:estasi/src/services/applogger_service.dart';
import 'package:estasi/src/utils/api_endpoins.dart';

class PushRepository {
  Future<void> sendToken({required String token}) async {
    var requestData = {
      "token": token,
    };
    final res = await ApiService.apiCall(
        method: RequestMethod.post,
        secured: true,
        endpoint: ApiEndpoints.storeToken,
        requestData: requestData);
    if (res != null && res.success) {
      AppLoggerService.showLog(title: "Push service", message: res.message);
    } else {
      AppLoggerService.showLog(title: "Push service", message: res?.errors);
    }
  }
}
