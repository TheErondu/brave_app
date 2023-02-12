import 'package:estasi/globals.dart';
import 'package:estasi/src/services/applogger_service.dart';
import 'package:estasi/src/services/api_service.dart';

class Init {
  Future<void> pingServer() async {
    final res = await ApiService.apiCall(
      method: RequestMethod.get,
      secured: true,
    );

    if (res != null && res.success) {
      AppLoggerService.showLog(
        title: "Initialization log - ${Global.environmentVariables.apiBaseUrl}",
        message: res.message,
      );
    } else {
      AppLoggerService.showLog(
        title: "Initialization log - ${Global.environmentVariables.apiBaseUrl}",
        message: res?.message ?? "null",
      );
    }
  }
}
