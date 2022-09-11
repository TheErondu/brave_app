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
  String clientKey = "";
  String apiBaseUrl = "https://api.qodestone.dev/api";
  String newsApiBaseurl =
      "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=e7880933f7714b7fad3e09f49353e44a";
  int apiTimeoutInSeconds = 60;
}
