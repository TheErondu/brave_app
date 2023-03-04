import 'dart:developer';
import 'package:brave/src/components/default_appbar.dart';
import 'package:brave/src/services/storage/user_storage_service.dart';
import 'package:brave/src/data/models/user.dart';
import 'package:brave/src/utils/bonjour.dart';
import 'package:brave/src/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomePageView extends ConsumerWidget {
 HomePageView({Key? key}) : super(key: key);
  static const routeName = '/home';

  final String greeting = Bonjour().greeting();
  final IconData timeOfDayIcon = Bonjour().timeOfDayIcon();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserData? user = UserStorageService().loadUserData();
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 1.sh,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "$greeting,\n${user?.name}👋",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              SizedBox(height: 20.h,),
              SizedBox(
                height: 1.sh * stats.length * 0.045,
                child: GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 4,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(stats.length, (index) {
                      return Card(
                        color: Theme.of(context).colorScheme.primary,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                stats.entries.elementAt(index).key[1],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge
                                    ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onPrimary,
                                        fontSize: 24),
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.fade,
                                maxLines: 1,
                              ),
                              Text(
                                stats.entries.elementAt(index).key[0],
                                style: Theme.of(context).textTheme.labelLarge,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              ),
              Text(
                'what would you like to do today?',
                style: Theme.of(context)
                    .textTheme
                    .titleSmall
                    ?.copyWith(color: Theme.of(context).colorScheme.secondary),
              ),
              SizedBox(height: 10.h),
              SizedBox(
                height: 1.sh * quicklinks.length * 0.045,
                child: GridView.count(
                    // Create a grid with 2 columns. If you change the scrollDirection to
                    // horizontal, this produces 2 rows.
                    crossAxisCount: 4,
                    // Generate 100 widgets that display their index in the List.
                    children: List.generate(quicklinks.length, (index) {
                      return Card(
                        color: Theme.of(context).colorScheme.primary,
                        child: Center(
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(
                                    quicklinks.entries.elementAt(index).value),
                                onPressed: () {
                                  Navigator.restorablePushNamed(
                                      context,
                                      quicklinks.entries
                                          .elementAt(index)
                                          .key[1]);
                                  log('navigate to ${quicklinks.entries.elementAt(index).key[0]} page');
                                },
                                tooltip:
                                    quicklinks.entries.elementAt(index).key[0],
                              ),
                              Text(
                                quicklinks.entries.elementAt(index).key[0],
                                style: Theme.of(context).textTheme.labelLarge,
                                textAlign: TextAlign.center,
                                overflow: TextOverflow.visible,
                                maxLines: 2,
                              )
                            ],
                          ),
                        ),
                      );
                    })),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
