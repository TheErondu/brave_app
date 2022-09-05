import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:estatio/globals.dart';
import 'package:estatio/src/data/models/user_model.dart';
import 'package:estatio/src/data/repository/news.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final url = Global.environmentVariables.apiBaseUrl;
String token = "112|b3ZasAOoUx9UCF3d2JU7oeG9nDxDeOAUsef1PuFm";

class UserRepository {
  Future<UserModel> userInfo() async {
    try {
      final res = await Dio().get(url,
          options: Options(headers: {
            "Authorization": "Bearer $token",
          }));
      if (res.statusCode == 200) {
        UserModel data = UserModel.fromJson(res.data);
        //print(data.results!);
        return data;
      } else {}
    } catch (e) {
      log("$e");
    }
    throw Exception("Error getting User Info");
  }
}

final userInfoProvider = FutureProvider.autoDispose<UserModel>((ref) async {
  return await UserRepository().userInfo();
});
