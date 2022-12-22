import 'package:estatio/src/components/default_appbar.dart';
import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'settings_controller.dart';

/// Displays the various settings that can be customized by the user.
///
/// When a user changes a setting, the SettingsController is updated and
/// Widgets that listen to the SettingsController are rebuilt.
class SettingsView extends ConsumerWidget {
  const SettingsView({
    Key? key,
    required this.controller,
  }) : super(key: key);

  static const routeName = '/settings';

  final SettingsController controller;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: const DefaultAppBar(title: "Settings"),
        body: SingleChildScrollView(
          child: SizedBox(
            child: Builder(builder: (context) {
              return Container(
                constraints: BoxConstraints(
                    maxHeight: size(context, type: ScreenSize.height) * 0.8),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Center(
                      child: Icon(
                        Icons.settings_rounded,
                        size: 60,
                      ),
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Settings",
                            style: Theme.of(context).textTheme.headline1,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8),
                          child: Text(
                            "Personalize your experience",
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text("Theme mode",
                          style: Theme.of(context).textTheme.subtitle1),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10),
                      child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(35),
                            color:
                                Theme.of(context).colorScheme.primaryContainer,
                          ),
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                title: Text(
                                  'Use System settings',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                leading: Radio<ThemeMode>(
                                   activeColor: CustomColors.deepGoldColor,
                                  groupValue: controller.themeMode,
                                  onChanged: ((value) {
                                    controller.updateThemeMode(value);
                                  }),
                                  value: ThemeMode.system,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Light Mode',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                leading: Radio<ThemeMode>(
                                  activeColor: CustomColors.deepGoldColor,
                                  groupValue: controller.themeMode,
                                  onChanged: ((value) {
                                    controller.updateThemeMode(value);
                                  }),
                                  value: ThemeMode.light,
                                ),
                              ),
                              ListTile(
                                title: Text(
                                  'Dark Mode',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                leading: Radio<ThemeMode>(
                                   activeColor: CustomColors.deepGoldColor,
                                  groupValue: controller.themeMode,
                                  onChanged: ((value) {
                                    controller.updateThemeMode(value);
                                  }),
                                  value: ThemeMode.dark,
                                ),
                              ),
                            ],
                          )),
                    ),
                  ],
                ),
              );
            }),
          ),
        ));
  }
}

final themeMode =
    StateProvider.autoDispose<ThemeMode?>((ref) => ThemeMode.system);