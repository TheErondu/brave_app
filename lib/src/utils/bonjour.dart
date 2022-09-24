import 'package:flutter/material.dart';

class Bonjour {
  greeting() {
    var hour = DateTime.now().hour;

    if (hour <= 12) {
      return ('Good Morning');
    } else if ((hour > 12) && (hour <= 16)) {
      return ('Good Afternoon');
    } else if ((hour > 16) && (hour < 20)) {
      return ('Good Evening');
    } else {
      return ('Good Evening');
    }
  }
   IconData timeOfDayIcon() {
    var hour = DateTime.now().hour;

    if (hour <= 12) {
      return (Icons.light_mode);
    } else if ((hour > 12) && (hour <= 16)) {
      return (Icons.light_mode);
    } else if ((hour > 16) && (hour < 20)) {
      return (Icons.dark_mode);
    } else {
      return (Icons.dark_mode);
    }
  }
}
