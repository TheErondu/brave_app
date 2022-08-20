import 'package:estatio/src/accounts/accounts_page_view.dart';
import 'package:estatio/src/activities/activities_page_view.dart';
import 'package:estatio/src/extras/extras_page_view.dart';
import 'package:estatio/src/home_page/home_page_view.dart';
import 'package:estatio/src/security/security_page_view.dart';
import 'package:estatio/src/settings/settings_view.dart';
import 'package:flutter/material.dart';

class IndexView extends StatefulWidget {
  const IndexView({Key? key}) : super(key: key);
  static const routeName = '/';
  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  int activeIndex = 0;
  void changeActivePage(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  List<Widget> pages = [];

  @override
  void initState() {
    pages = [
      const HomePageView(),
      const ActivitiesPageView(),
      const AccountsPageView(),
      const SecurityPageView(),
      const ExtrasPageView()
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
           title: const Text('Welcome Erondu'),
          actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              // Navigate to the settings page. If the user leaves and returns
              // to the app after it has been killed while running in the
              // background, the navigation stack is restored.
              Navigator.restorablePushNamed(context, SettingsView.routeName);
            },
          ),
        ]),
        bottomNavigationBar: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IconButton(
                  onPressed: () => changeActivePage(0),
                  icon: const Icon(Icons.home)),
              IconButton(
                  onPressed: () => changeActivePage(1),
                  icon: const Icon(Icons.volunteer_activism)),
              IconButton(
                  onPressed: () => changeActivePage(2),
                  icon: const Icon(Icons.account_balance)),
              IconButton(
                  onPressed: () => changeActivePage(3),
                  icon: const Icon(Icons.security)),
              IconButton(
                  onPressed: () => changeActivePage(4),
                  icon: const Icon(Icons.theater_comedy)),
            ],
          ),
        ),
        body: pages[activeIndex]);
  }
}
