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
      this.apiTimeoutInSeconds = 0,
      this.newsApiBaseurl = ""});
  String clientKey;
  String apiBaseUrl;
  String newsApiBaseurl;
  int apiTimeoutInSeconds = 60;
}
