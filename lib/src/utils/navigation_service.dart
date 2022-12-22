
import 'package:estatio/src/features/auth/login_screen.dart';
import 'package:flutter/material.dart';

class NavigationService { 
  static GlobalKey<NavigatorState> navigatorKey = 
  GlobalKey<NavigatorState>();
  static void toLogin({required BuildContext context}) {
  Navigator.pushNamedAndRemoveUntil(
      context, LoginView.routeName, (route) => false);
}
}