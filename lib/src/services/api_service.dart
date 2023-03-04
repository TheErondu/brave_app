import 'package:dio/dio.dart';
import 'package:brave/globals.dart';
import 'package:brave/src/data/models/generic_resonse_model.dart';
import 'package:brave/src/services/applogger_service.dart';
import 'package:brave/src/services/storage_service.dart';
import 'package:brave/src/services/navigation_service.dart';
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

    /// Logging Inteceptors/////////////
    httpRequest.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) {
      AppLoggerService.showLog(
          title: '${options.method} Request}',
          message: "--> ${options.method} ${options.uri}",
          data: options.data);
      return handler.next(options);
    }, onResponse: (response, handler) {
      AppLoggerService.showLog(
         status: response.statusCode,
          message: "<-- ${response.requestOptions.uri}",
          data: response.data
          );
      return handler.next(response);
    }, onError: (DioError e, handler) {
      AppLoggerService.showLog(
          status: e.response?.statusCode,
          message: "<-- ${e.response?.requestOptions.uri}",
          data: e.response?.data
          );
      return handler.next(e);
    }));
    ///////////////Store Token
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
          response = GenericResponse.fromJson(res.data);
          return response;
        } else {
          return response;
        }
      } on DioError catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        if (e.response?.statusCode == 401) {
          response = GenericResponse.fromJson(e.response?.data);
          NavigationService.toLogin(
              context: NavigationService.navigatorKey.currentContext!);
        } else {
        }
      }
    } else if (method == RequestMethod.post) {
      try {
        final res = await httpRequest.post(
            Global.environmentVariables.apiBaseUrl + endpoint,
            options: secured
                ? Options(headers: {
                    "Authorization": "Bearer $token",
                    "Accept": "Accept: application/json"
                  })
                : Options(headers: {
                    // "Authorization": "Bearer $token",
                  }),
            data: requestData);
        if (res.statusCode == 200) {
       
          return GenericResponse.fromJson(res.data);
        } else {
          return GenericResponse.fromJson(res.data);
        }
      } on DioError catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.
        response = GenericResponse.fromJson(e.response?.data);
      }
    }
    return response;
  }
}
