import 'dart:developer';

class AppLoggerService {
  static showLog(
      {String? title,
      int? status,
      dynamic data,
      String? message,
      String? end = ""}) {
    Map<String, dynamic> m = {
      "\ntitle": title,
      "\nstatus": status,
      "\ndata": data,
      "\nmessage": message,
    };
    m.removeWhere((key, value) => value == null);
    int end = m.toString().length - 1;
    log(m.toString().replaceRange(end, null, "\n}"));
  }
}
