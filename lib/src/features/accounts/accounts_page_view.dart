import 'package:estatio/src/components/default_appbar.dart';
import 'package:flutter/material.dart';

class AccountsPageView extends StatelessWidget {
  const AccountsPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  const Scaffold(
      appBar: DefaultAppBar(
        title: "Accounts",
      ),
      body: Center(child: Text('Accounts Page'),),
    );
  }
}
