import 'package:brave/src/components/default_appbar.dart';
import 'package:flutter/material.dart';

class AnalyticsPageView extends StatelessWidget {
  const AnalyticsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(
        title: "Analytics",
      ),
      body: Center(
        child: Text('Coming soon...'),
      ),
    );
  }
}
