import 'package:cached_network_image/cached_network_image.dart';
import 'package:estatio/src/features/profile/my_profile.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';

class DefaultAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppBar({
    this.title,
    this.bottom,
    Key? key,
  }) : super(key: key);
  final String? title;
  final PreferredSizeWidget? bottom;
  @override
  Size get preferredSize => const Size.fromHeight(60);
  @override
  Widget build(BuildContext context) {
    return AppBar(
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          title ?? "GreenField Estate",
          style: Theme.of(context).textTheme.headline2,
        ),
        bottom: bottom,
        actions: [
          Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Stack(children: [
              IconButton(
                onPressed: () => Navigator.pushNamedAndRemoveUntil(
                    context, MyProfileScreen.routeName, (route) => false),
                icon: const Icon(
                  Icons.notifications,
                  size: 30,
                ),
              ),
              Positioned(
                  top: 10,
                  right: 10,
                  child: Container(
                    padding: const EdgeInsets.all(0),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    constraints: const BoxConstraints(
                      minWidth: 12,
                      minHeight: 12,
                    ),
                    child: const Text(
                      '1',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 8,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )),
            ]),
          ),
          GestureDetector(
            onTap: (() =>
                Navigator.pushNamed(context, MyProfileScreen.routeName)),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Center(
                child: CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.onPrimary,
                  radius: 16,
                  // Display the Flutter Logo image asset.
                  foregroundImage: const CachedNetworkImageProvider(
                    ConstantStrings.userAvatarUrl,
                  ),
                  backgroundImage: const AssetImage("assets/images/user.jpg"),
                ),
              ),
            ),
          ),
        ]);
  }
}
