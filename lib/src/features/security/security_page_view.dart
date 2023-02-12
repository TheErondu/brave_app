import 'package:estasi/src/components/default_appbar.dart';
import 'package:flutter/material.dart';

class SecurityPageView extends StatelessWidget {
  const SecurityPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: DefaultAppBar(
        title: "Security",
      ),
      body: Center(
        child: Text('Security Page'),
      ),
    );
  }
}
