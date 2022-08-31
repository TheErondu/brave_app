
import 'package:estatio/globals.dart';
import 'package:estatio/src/utils/config.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'src/app.dart';
import 'src/features/settings/settings_controller.dart';
import 'src/features/settings/settings_service.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvFile();

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
      apiTimeoutInSeconds:
          int.parse(dotenv.env['API_TIMEOUT_IN_SECONDS'] ?? 60.toString()));

  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((val) {
    runApp(

        ///This allows you to run the app in different views and Screen sizes,
        /// when the [kReleaseMode] is true it means that the app preview view
        /// is enabled for release mode and vice-versa.
         ProviderScope(child: MyApp(settingsController: settingsController)));
  });
}