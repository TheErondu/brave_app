import 'package:cached_network_image/cached_network_image.dart';
import 'package:estatio/src/components/default_appbar.dart';
import 'package:estatio/src/data/services/storage/user_storage_controller.dart.dart';
import 'package:estatio/src/data/models/user.dart';
import 'package:estatio/src/data/services/storage_service.dart';
import 'package:estatio/src/data/repository/user_repo.dart';
import 'package:estatio/src/features/auth/login_screen.dart';
import 'package:estatio/src/index/index_view.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

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
              UserData userData = UserStorageService().loadUserData();
              return Container(
                constraints: BoxConstraints(maxHeight: size(context, type: ScreenSize.height)*0.8),
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
                            'https://api.qodestone.dev/images/faces/1.jpg'),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment:MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(userData.name,
                          style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                          Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(userData.email,
                          style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                          padding: const EdgeInsets.all(20),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              color: Theme.of(context).colorScheme.primary,
                            ),
                            child: const ListTile(
                              leading: Icon(Icons.person),
                              title: Text("Edit Profile"),
                              trailing: Icon(Icons.chevron_right_rounded),
                            ),
                          ),
                        ),
                    OutlinedButton(
                      style:  OutlinedButton.styleFrom(
                          side: const BorderSide(
                            width: 1,
                            color: Colors.white,
                            style: BorderStyle.solid,
                          ),
                        ),
                        onPressed: () async {
                          await UserRepository().logout();
                          StorageService().deleteFromBox("auth", "token");
                          toLogin(context: context);
                        },
                        child:  Text("Logout",
                        style: Theme.of(context).textTheme.caption))
                  ],
                ),
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
