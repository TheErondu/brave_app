import 'package:estasi/src/features/auth/login_screen.dart';
import 'package:estasi/src/utils/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthCheck {
  AuthCheck({
    this.ref,
    this.context,
    this.authCheckPassed = false,
  });
  BuildContext? context = NavigationService.navigatorKey.currentContext!;
  bool authCheckPassed;
  WidgetRef? ref;
  void handleRedirect() {
    !authCheckPassed
        ? Navigator.pushNamedAndRemoveUntil(
            context!, LoginView.routeName, (route) => false)
        : null;
  }
}
