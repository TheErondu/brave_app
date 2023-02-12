import 'package:estasi/globals.dart';
import 'package:estasi/src/data/repository/init.dart';
import 'package:estasi/src/services/applogger_service.dart';
import 'package:estasi/src/services/notifications/push_service.dart';
import 'package:estasi/src/utils/config.dart';
import 'package:estasi/src/utils/storage_init.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'src/app.dart';
import 'src/features/settings/settings_controller.dart';
import 'src/features/settings/settings_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  await Firebase.initializeApp();
  AppLoggerService.showLog(
      message: "Handling a background message: ${message.messageId}");
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await loadEnvFile();
//initlize Box Storage
  await Hive.initFlutter();
  StorageInit.registerAdapters();
  StorageInit.openBoxes();
  PushService.init();
  // Set up the SettingsController, which will glue user settings to multiple
  // Flutter Widgets.
  final settingsController = SettingsController(SettingsService());

  // Load the user's preferred theme while the splash screen is displayed.
  // This prevents a sudden theme change when the app is first displayed.
  await settingsController.loadSettings();

  // Run the app and pass in the SettingsController. The app listens to the
  // SettingsController for changes, then passes it further down to the
  // SettingsView.

//handle Foreground Push notifications
  FirebaseMessaging.onMessage.listen((RemoteMessage message) {
    AppLoggerService.showLog(
        title: 'Got a message whilst in the foreground!',
        message: message.notification.toString(),
        data: message.data);
  });

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
        ProviderScope(child: MyApp(settingsController: settingsController)));
  });
  await Init().pingServer();
}
