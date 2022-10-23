import 'package:estatio/src/data/providers/home_page_provider.dart';
import 'package:estatio/src/data/services/storage_service.dart';
import 'package:estatio/src/data/repository/user_repo.dart';
import 'package:estatio/src/features/auth/login_screen.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../settings/settings_view.dart';

/// Displays a list of SampleItems.
class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({
    super.key,
  });

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () {
                Navigator.restorablePushNamed(context, SettingsView.routeName);
              },
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Builder(builder: (context) {
              final userInfo = ref.watch(userInfoProvider);
              return userInfo.when(
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (error, stackTrace) => Padding(
                  padding: const EdgeInsets.all(80),
                  child: Text("$error"),
                ),
                data: (userInfo) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 50),
                      const Center(
                        child: CircleAvatar(
                          radius: 50,
                          // Display the Flutter Logo image asset.
                          foregroundImage: AssetImage('assets/images/user.png'),
                        ),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                        height: size(context, type: Size.height) * 0.3,
                        width: size(context, type: Size.width),
                        child: ListView(
                          children: [
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'Name :',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              title: Text(userInfo!.name),
                            ),
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'Email :',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              title: Text(userInfo.email),
                            ),
                            ListTile(
                              leading: Padding(
                                padding: const EdgeInsets.only(top: 4),
                                child: Text(
                                  'Created at :',
                                  style:
                                      Theme.of(context).textTheme.titleMedium,
                                ),
                              ),
                              title: Text(userInfo.createdAt.substring(0, 10)),
                            ),
                          ],
                        ),
                      ),
                      ElevatedButton(
                          onPressed: () async {
                            await UserRepository().logout();
                            StorageService().deleteFromBox("auth", "token");
                            toLogin(context: context);
                          },
                          child: const Text("Logout"))
                    ],
                  );
                },
              );
            }),
          ),
        ));
  }
}

void toLogin({context}) {
  Navigator.pushNamedAndRemoveUntil(
      context, LoginView.routeName, (route) => false);
}
