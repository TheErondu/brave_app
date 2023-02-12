import 'package:estasi/src/components/default_appbar.dart';
import 'package:flutter/material.dart';

class ExtrasPageView extends StatelessWidget {
  const ExtrasPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(
        title: "Extras",
      ),
      body: Center(
        child: Text('Extras Page'),
      ),
    );
  }
}
