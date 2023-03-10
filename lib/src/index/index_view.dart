import 'package:brave/src/data/providers/home_page_provider.dart';
import 'package:brave/src/screens/home_page/home_page_view.dart';
import 'package:brave/src/screens/modules/analytics/analytics_page_view.dart';
import 'package:brave/src/screens/modules/modules_list_view.dart';
import 'package:brave/src/screens/settings/settings_view.dart';
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

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = <Widget>[
      HomePageView(),
      const ModulesListView(),
      const AnalyticsPageView(),
      const SettingsView(),
    ];
    List<BottomNavigationBarItem> navItems = <BottomNavigationBarItem>[
      const BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.widgets),
        label: 'Modules',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.insights),
        label: 'Analytics',
      ),
      const BottomNavigationBarItem(
        icon: Icon(Icons.settings_rounded),
        label: 'Settings',
      ),
    ];
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
