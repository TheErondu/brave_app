

import 'package:brave/src/components/default_appbar.dart';
import 'package:flutter/material.dart';

class ModulesListView extends StatefulWidget {
  const ModulesListView({super.key});

  @override
  State<ModulesListView> createState() => _ModulesListViewState();
}

class _ModulesListViewState extends State<ModulesListView> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(
        title: "Modules",
      ),
      body: Center(
        child: Text('Coming soon...'),
      ),
    );
  }
}