import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:estatio/globals.dart';
import 'package:estatio/src/components/custom_snack_bar.dart';
import 'package:estatio/src/data/models/generic_resonse_model.dart';
import 'package:estatio/src/data/providers/storage_provider.dart';
import 'package:flutter/material.dart';

enum RequestMethod {
  get,
  post,
  put,
  patch,
  delete,
}

class ApiService extends ChangeNotifier {
  ApiService(
      {this.endpoint = "",
      this.context,
      this.requestData,
      this.secured = false,
      required this.method});
  final String endpoint;
  BuildContext? context;
  RequestMethod method;
  Map<String, dynamic>? requestData;
  bool secured;
  GenericResponse? response;
  Future<GenericResponse?> apiCall() async {
    final Dio httpRequest = Dio();
    String? token = await Storage().readBox("auth", "token");
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
        response = GenericResponse.fromJson(res.data);
      } on DioError catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.

        log('Dio error!');
        log('Status: ${e.response?.statusCode}');
        log('Data: ${e.response?.data}');
        log('Message: ${e.message}');
        if (e.response?.statusCode == 401) {
          response = GenericResponse.fromJson(e.response?.data);
          CustomSnackBar(
            message: response?.message,
            buttonText: "Login",
          ).showSnackBar();
        } else {
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
           log('Dio error!');
        log('Status: ${res.statusCode}');
        log('Data: ${res.data}');
        log('Message: ${res.statusMessage}');
          return GenericResponse.fromJson(res.data);
        } else {
          return GenericResponse.fromJson(res.data);
        }
      } on DioError catch (e) {
        // The request was made and the server responded with a status code
        // that falls out of the range of 2xx and is also not 304.

        log('Dio error!');
        log('Status: ${e.response?.statusCode}');
        log('Data: ${e.response?.data}');
        log('Message: ${e.message}');

        response = GenericResponse.fromJson(e.response?.data);
      }
    }
    return response;
  }
}
