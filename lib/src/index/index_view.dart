
import 'package:estatio/src/features/accounts/accounts_page_view.dart';
import 'package:estatio/src/features/activities/activities_page_view.dart';
import 'package:estatio/src/features/extras/extras_page_view.dart';
import 'package:estatio/src/features/home_page/home_page_view.dart';
import 'package:estatio/src/features/security/security_page_view.dart';

import 'package:estatio/src/utils/constants.dart';
import 'package:flutter/material.dart';

class IndexView extends StatefulWidget {
  const IndexView({
    Key? key,
  }) : super(key: key);
  static const routeName = '/';
  @override
  State<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends State<IndexView> {
  int activeIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      activeIndex = index;
    });
  }

  final scr = "";
  List<Widget> pages = <Widget>[
    HomePageView(),
    const ActivitiesPageView(),
    const AccountsPageView(),
    const SecurityPageView(),
    const ExtrasPageView()
  ];
  List<BottomNavigationBarItem> navItems = <BottomNavigationBarItem>[
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: 'Home',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.event),
      label: 'Activities',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.account_balance),
      label: 'Accounts',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.local_police_rounded),
      label: 'Security',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.theater_comedy_rounded),
      label: 'Extras',
    ),
  ];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    deviceHeight = MediaQuery.of(context).size.height;
    deviceWidth = MediaQuery.of(context).size.width;
    devicetextScaleFactor = MediaQuery.of(context).textScaleFactor;
    devicePixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      // appBar: AppBar(
      //     elevation: 1,
      //     leading: Padding(
      //       padding: EdgeInsets.only(left: 25 * devicetextScaleFactor),
      //       child: Image.asset(
      //         "assets/images/3.0x/flutter_logo.png",
      //         height: 20,
      //         width: 25,
      //       ),
      //     ),
      //     leadingWidth: 50,
      //     automaticallyImplyLeading: true,
      //     toolbarHeight: devicetextScaleFactor * 70,
      //     centerTitle: true,
      //     title: Row(
      //       children: [
      //         SizedBox(
      //             width: deviceWidth * 0.6,
      //             child: Text(
      //               activeIndex == 0 ? "$greeting, $user." : pageTitle!,
      //               softWrap: false,
      //               overflow: TextOverflow.clip,
      //               style: TextStyle(fontSize: devicetextScaleFactor * 25),
      //             )),
      //       ],
      //     ),
      //     actions: [
      //       IconButton(
      //         icon: const Icon(Icons.settings),
      //         onPressed: () {
      //           // Navigate to the settings page. If the user leaves and returns
      //           // to the app after it has been killed while running in the
      //           // background, the navigation stack is restored.
      //           Navigator.restorablePushNamed(context, SettingsView.routeName);
      //         },
      //       ),
      //     ]),
      body: Center(
        child: pages.elementAt(activeIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        items: navItems,
        currentIndex: activeIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
