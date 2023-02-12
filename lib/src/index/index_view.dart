import 'package:estasi/src/data/providers/home_page_provider.dart';
import 'package:estasi/src/features/payments/payments_page_view.dart';
import 'package:estasi/src/features/activities/activities_page_view.dart';
import 'package:estasi/src/features/extras/extras_page_view.dart';
import 'package:estasi/src/features/home_page/home_page_view.dart';
import 'package:estasi/src/features/security/security_page_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class IndexView extends ConsumerStatefulWidget {
  const IndexView({
    Key? key,
  }) : super(key: key);
  static const routeName = '/';
  @override
  ConsumerState<IndexView> createState() => _IndexViewState();
}

class _IndexViewState extends ConsumerState<IndexView> {
  bool isloggedIn = false;

  int activeIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      activeIndex = ref.read(indexProvider.notifier).state = index;
    });
  }

  List<Widget> pages = <Widget>[
    HomePageView(),
    const ActivitiesPageView(),
    const PaymentsPageView(),
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
      label: 'Payments',
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
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: pages.elementAt(activeIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
        unselectedItemColor: Theme.of(context).iconTheme.color,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        items: navItems,
        currentIndex: activeIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
