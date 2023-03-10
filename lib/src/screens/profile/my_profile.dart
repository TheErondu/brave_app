import 'package:brave/src/screens/auth/login_screen.dart';
import 'package:brave/src/screens/settings/settings_view.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:brave/src/components/default_appbar.dart';
import 'package:brave/src/components/profile_action_card_widget.dart';
import 'package:brave/src/services/storage/user_storage_service.dart';
import 'package:brave/src/data/models/user.dart';
import 'package:brave/src/services/storage_service.dart';
import 'package:brave/src/data/repository/user_repo.dart';
import 'package:brave/src/utils/constants.dart';
import 'package:brave/src/services/navigation_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Displays a list of SampleItems.
class MyProfileScreen extends ConsumerWidget {
  const MyProfileScreen({
    super.key,
  });

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: const DefaultAppBar(title: "My Profile"),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Builder(builder: (context) {
              UserData? userData = UserStorageService().loadUserData();
              return Container(
                constraints: BoxConstraints(
                    maxHeight: size(context, type: ScreenSize.height) * 0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Center(
                      child: CircleAvatar(
                          radius: 50,
                          // Display the Flutter Logo image asset.
                          foregroundImage: CachedNetworkImageProvider(
                              ConstantStrings.userAvatarUrl),
                          backgroundImage:
                              AssetImage("assets/images/user.jpg")),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            userData?.name ?? "",
                            style: Theme.of(context).textTheme.displayLarge,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            userData?.email ?? "",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                    ProfileActionCardWidget(
                      title: "Edit Profile",
                      bgColor: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.person),
                      onTap: () =>
                          Navigator.pushNamed(context, SettingsView.routeName),
                    ),
                    ProfileActionCardWidget(
                      title: "Change Settings",
                      bgColor: Theme.of(context).colorScheme.primary,
                      icon: const Icon(Icons.settings_rounded),
                      onTap: () =>
                          Navigator.pushNamed(context, SettingsView.routeName),
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 1,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        onPressed: () async {
                          navigateToLogin() {
                            NavigationService.toLogin(context: context);
                          }
                          await UserRepository().logout();
                          StorageService().deleteFromBox("auth", "token");
                          navigateToLogin();
                          UserStorageService().deleteUserData();
                        },
                        child: Text("Logout",
                            style: Theme.of(context).textTheme.bodySmall))
                  ],
                ),
              );
            }),
          ),
        ));
  }
}


