// import 'package:brave/firebase_options.dart';
// import 'package:brave/src/data/repository/push_repo.dart';
// import 'package:brave/src/services/applogger_service.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:firebase_messaging/firebase_messaging.dart';

// class PushService {
//   static void init() async {
//     await Firebase.initializeApp(
//       options: DefaultFirebaseOptions.currentPlatform,
//     );
//     FirebaseMessaging messaging = FirebaseMessaging.instance;
//     NotificationSettings settings = await messaging.requestPermission(
//       alert: true,
//       announcement: false,
//       badge: true,
//       carPlay: false,
//       criticalAlert: false,
//       provisional: false,
//       sound: true,
//     );

//     AppLoggerService.showLog(
//       title: "Push Notification Service",
//       message: 'User granted permission: ${settings.authorizationStatus}',
//     );
//   }

//   static void sendUserPushToken() async {
//     await FirebaseMessaging.instance.getToken().then((token) {
//       if (token != null) {
//         PushRepository().sendToken(token: token);
//       }
//     });
//   }
// }
