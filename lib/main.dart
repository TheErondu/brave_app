import 'package:brave/globals.dart';
import 'package:brave/src/data/repository/init.dart';
import 'package:brave/src/services/device_info_service.dart';
import 'package:brave/src/utils/config.dart';
import 'package:brave/src/utils/storage_init.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/app.dart';
import 'src/screens/settings/settings_controller.dart';
import 'src/screens/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvFile();
//initlize Box Storage
  await Hive.initFlutter();
  await StorageInit.registerAdapters();
  await StorageInit.openBoxes();
  await DeviceInfoService().initPlatformState();
  //PushService.init();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.

  Global.environmentVariables = EnvironmentVariables(
      apiBaseUrl: dotenv.env['BASE_URL']!,
      clientKey: dotenv.env['CLIENT_KEY']!,
      newsApiBaseurl: dotenv.env['NEWSAPI_URL']!,
      apiTimeoutInSeconds:
          int.parse(dotenv.env['API_TIMEOUT_IN_SECONDS'] ?? 60.toString()));

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((val) {
    runApp(

        ///This allows you to run the app in different views and Screen sizes,
        /// when the [kReleaseMode] is true it means that the app preview view
        /// is enabled for release mode and vice-versa.
        ProviderScope(child: App(settingsController: settingsController)));
  });

  await Init().pingServer();
}
