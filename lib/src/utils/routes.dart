import 'package:brave/src/screens/settings/settings_view.dart';

import 'package:brave/src/screens/auth/login_screen.dart';
import 'package:brave/src/screens/home_page/home_page_view.dart';
import 'package:brave/src/screens/profile/my_profile.dart';
import 'package:brave/src/index/index_view.dart';

var appRoutes = {
 LoginView.routeName: (context) => const LoginView(),
  HomePageView.routeName: (context) => HomePageView(),
  IndexView.routeName: (context) => const IndexView(),
  SettingsView.routeName: (context) => const SettingsView(),
  MyProfileScreen.routeName: (context) => const MyProfileScreen(),
};
