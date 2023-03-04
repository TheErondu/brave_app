import 'package:brave/src/components/default_appbar.dart';
import 'package:flutter/material.dart';

class ActivitiesPageView extends StatelessWidget {
  const ActivitiesPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(
        title: "Activites",
      ),
      body: Center(
        child: Text('Activites Page'),
      ),
    );
  }
}
