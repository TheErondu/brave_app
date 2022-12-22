import 'package:estatio/src/components/default_appbar.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends Scaffold {
  const BaseScaffold(
      {
      this.body,
      super.key});
  @override
  // ignore: overridden_fields
  final Widget? body;
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const DefaultAppBar(),
      body: body,
    );
  }
}
