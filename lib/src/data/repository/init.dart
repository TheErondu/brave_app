import 'package:brave/src/services/api_service.dart';

class Init {
  Future<void> pingServer() async {
 await ApiService.apiCall(
      method: RequestMethod.get,
      secured: true,
    );
  }

}
