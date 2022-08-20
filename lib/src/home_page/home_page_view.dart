import 'package:flutter/material.dart';

class HomePageView extends StatelessWidget {


  const HomePageView({Key? key}) : super(key: key);
  static const routeName = '/home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          onPressed:(() {
            
          }),
          child: const Text('Home Page'),
        ),
      ),
    );
  }
}