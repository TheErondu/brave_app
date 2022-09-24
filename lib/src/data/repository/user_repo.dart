import 'dart:developer';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:estatio/globals.dart';
import 'package:estatio/src/data/models/auth_response.dart';
import 'package:estatio/src/data/models/user_model.dart';
import 'package:estatio/src/data/providers/storage_provider.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:hive_flutter/hive_flutter.dart';

class UserRepository {
  Future<UserModel> userInfo() async {
    String token = Storage().readBox("auth", "token");
    try {
      final res = await Dio().get(
          Global.environmentVariables.apiBaseUrl + ConstantStrings.getUserinfo,
          options: Options(headers: {
            "Authorization": "Bearer $token",
          }));
      if (res.statusCode == 200) {
        UserModel data = UserModel.fromJson(res.data);
        //print(data.results!);
        Storage().saveStringToBox("user", "name", data.name);
        return data;
      } else {}
    } catch (e) {
      log("$e");
    }
    throw Exception("Error getting User Info");
  }

  Future<void>login(String email, String password) async {
    await Hive.openBox('auth');
    try {
      var requestData = {
        "email": email,
        "password": password,
        "device_name": "Redmi note 10 Pro"
      };
      final res = await Dio().post(
          Global.environmentVariables.apiBaseUrl +
              ConstantStrings.authorizeUser,
          options: Options(headers: {
            'Accept': '*/*',
            'User-Agent': 'Thunder Client (https://www.thunderclient.com)'
          }),
          data: requestData);
      if (res.statusCode == 200) {
        List<AuthResponse> data = AuthResponse.fromJsonList(res.data);
        //print(data.results!);
        Storage().saveStringToBox("auth", "token", data.first.token);
      } else {
        throw "Error${res.data}";
      }
    } catch (e) {
      log("$e");
    }
  }
}

final userInfoProvider = FutureProvider<UserModel>((ref) async {
  return await UserRepository().userInfo();
});
