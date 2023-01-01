import 'package:estatio/src/data/repository/user_repo.dart';
import 'package:estatio/src/features/auth/login_screen.dart';
import 'package:estatio/src/index/index_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  static void toLogin({required BuildContext context}) {
    Navigator.pushNamedAndRemoveUntil(
        context, LoginView.routeName, (route) => false);
  }

  static handleLogin(
      {required BuildContext context,
      bool mounted = true,
      required WidgetRef ref,
      required String email,
      required String password}) async {
    final res = await UserRepository().login(email, password);

    if (res.success) {
       ref.read(isLoadingProvider.state).state = false;
         if (!mounted) return;
      Navigator.pushReplacementNamed(context, IndexView.routeName);
    } else {
       ref.read(isLoadingProvider.state).state = false;
         if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: const Color.fromARGB(255, 180, 142, 16),
          content: Text(
            res.message,
            style: Theme.of(context).textTheme.displaySmall,
          )));
    }
  }
}

final isLoadingProvider = StateProvider<bool>(((ref) => false));
