import 'package:flutter/material.dart';

class ConstantStrings {
  static const userData = "UserData";
  static const userAvatarUrl = "https://api.qodestone.dev/images/faces/1.jpg";
  static const deviceInfo = "DeviceInfo";
}

final Map<List<String>, IconData> quicklinks = {
  ["Manage Store", "/stores"]: Icons.store_rounded,
  [" Scan item", "/stores/scan"]: Icons.barcode_reader,
  ["Administration", "/administration"]: Icons.admin_panel_settings,
  ["Request item(s)", "/adverts"]: Icons.shopping_cart_checkout_rounded,
  ["My Profile", "/profile"]: Icons.person_rounded,
};
final Map<List<String>, IconData> stats = {
  ["Users", "2"]: Icons.person_rounded,
  ["Store items", "789"]: Icons.store,
  ["Borrowed items", "12"]: Icons.shopping_cart_checkout_outlined,
  ["Available items", "120"]: Icons.toys_outlined,
};

enum ScreenSize { height, width }

double size(BuildContext context, {required ScreenSize type}) {
  switch (type) {
    case ScreenSize.width:
      return MediaQuery.of(context).size.width;
    case ScreenSize.height:
      return MediaQuery.of(context).size.height;
  }
}

class CustomColors {
  static const Color deepGoldColor = Color(0xFF977934);
}
