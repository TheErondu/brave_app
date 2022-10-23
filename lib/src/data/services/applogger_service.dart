import 'dart:developer';

class AppLoggerService {
  AppLoggerService();

  void showLog({String? title, int? status=0,  dynamic data, String? message}){
     log('$title');
        log('Status: $status');
        log('Data: $data');
        log('Message: $message');

  }
}
