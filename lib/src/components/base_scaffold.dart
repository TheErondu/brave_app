import 'package:flutter/material.dart';

class BaseScaffold extends Scaffold {
  const BaseScaffold(
      {required this.child,
      required this.title,
       this.actions,
      super.key});
  final Widget child;
  final Widget title;
  final List<Widget>? actions;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: title, actions: actions),
      body: child,
    );
  }
}
