import 'package:flutter/material.dart';

import '../settings/settings_view.dart';

/// Displays a list of SampleItems.
class MyProfileScreen extends StatelessWidget {
  const MyProfileScreen({
    Key? key,
  }) : super(key: key);

  static const routeName = '/profile';


  @override
  Widget build(BuildContext context) {
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
      body: SingleChildScrollView(child: SizedBox(
        child: Column(
          children: const [
            CircleAvatar(
              // Display the Flutter Logo image asset.
              foregroundImage: AssetImage('assets/images/user.png'),
            ),
          ],
        ),
      ),)
    );
  }
}
