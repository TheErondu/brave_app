import 'dart:developer';

import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> loadEnvFile({String path = ".env"}) async {
  try {
    await dotenv.load(fileName: path);
  } catch (e) {
    log(e.toString());
  }
}

class EnvironmentVariables {
  EnvironmentVariables(
      {this.apiBaseUrl = "",
      this.clientKey = "",
      this.apiTimeoutInSeconds = 0});
  String clientKey ="pub_104514a72bbaa8fabc591f4775b051e39938b";
  String apiBaseUrl = "https://newsdata.io/api?apikey=";
  int apiTimeoutInSeconds =60;
}
