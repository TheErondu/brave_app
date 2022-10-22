import 'package:estatio/src/features/auth/login_screen.dart';
import 'package:estatio/src/utils/navigation_service.dart';
import 'package:flutter/material.dart';

class CustomSnackBar {
  const CustomSnackBar({this.message, this.buttonText, this.onButtonPressed});
  final String? message;
  final String? buttonText;
  final Function()? onButtonPressed;
  void showSnackBar() {
    BuildContext context = NavigationService.navigatorKey.currentContext!;
    final snackBar = SnackBar(
        backgroundColor: const Color.fromARGB(255, 180, 142, 16),
        content: Row(
          children: [
            Text(
              "$message",
              style: Theme.of(context)
                  .textTheme
                  .displaySmall,
            ),
            TextButton(
              style: Theme.of(context).textButtonTheme.style,
              onPressed: () => Navigator.pushNamedAndRemoveUntil(
                  context, LoginView.routeName, (route) => false),
              child: const Text("Login")
            ),
          ],
        ));
    ScaffoldMessenger.of(context)
        .showSnackBar(snackBar);
  }
}
