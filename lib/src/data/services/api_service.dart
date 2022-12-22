import 'package:dio/dio.dart';
import 'package:estatio/globals.dart';
import 'package:estatio/src/data/models/generic_resonse_model.dart';
import 'package:estatio/src/data/services/applogger_service.dart';
import 'package:estatio/src/data/services/storage_service.dart';
import 'package:estatio/src/utils/navigation_service.dart';
import 'package:flutter/material.dart';

enum RequestMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class ApiService extends ChangeNotifier {
  ApiService();
  GenericResponse? response;
  static Future<GenericResponse?> apiCall(
      {String endpoint = "",
      BuildContext? context,
      Map<String, dynamic>? requestData,
      bool secured = false,
      required RequestMethod method}) async {
    GenericResponse? response;
    final Dio httpRequest = Dio();
    final AppLoggerService applogger = AppLoggerService();
    String? token = await StorageService().readBox("auth", "token");
    if (method == RequestMethod.get) {
      try {
        final res = await httpRequest.get(
            Global.environmentVariables.apiBaseUrl + endpoint,
            options: secured
                ? Options(headers: {
                    "Authorization": "Bearer $token",
                    "Accept": "Accept: application/json"
                  })
                : Options(headers: {
                    // "Authorization": "Bearer $token",
                  }));
        if (res.statusCode == 200) {
          applogger.showLog(
              title: "Dio Success",
              status: res.statusCode,
              data: res.data,
              message: res.statusMessage);
          response = GenericResponse.fromJson(res.data);
          return response;
        } else {
          return response;
        }
      } on DioError catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.

        applogger.showLog(
            title: "Dio error",
            status: e.response?.statusCode,
            data: e.response?.data,
            message: e.response?.statusMessage);
        if (e.response?.statusCode == 401) {
          response = GenericResponse.fromJson(e.response?.data);
          NavigationService.toLogin(
              context: NavigationService.navigatorKey.currentContext!);
        } else {
          applogger.showLog(
              title: "Dio Success",
              status: e.response?.statusCode,
              data: e.response?.data,
              message: e.response?.statusMessage);
          response = GenericResponse.fromJson(e.response?.data);
        }
      }
    } else if (method == RequestMethod.post) {
      try {
        final res = await httpRequest.post(
            Global.environmentVariables.apiBaseUrl + endpoint,
            options: Options(headers: {
              // "Authorization": "Bearer $token",
            }),
            data: requestData);
        if (res.statusCode == 200) {
          applogger.showLog(
              title: "Dio Success",
              status: res.statusCode,
              data: res.data,
              message: res.statusMessage);
          return GenericResponse.fromJson(res.data);
        } else {
          return GenericResponse.fromJson(res.data);
        }
      } on DioError catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        applogger.showLog(
            title: "Dio error",
            status: e.response?.statusCode,
            data: e.response?.data,
            message: e.response?.statusMessage);
        response = GenericResponse.fromJson(e.response?.data);
      }
    }
    return response;
  }
}
