import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final storageprovider = FutureProvider.family<Box, String>((ref, name) async {
  return await Hive.openBox(name);
});

class Storage {


  String readBox(String name, String key) {
    Hive.openBox(name);
    var box = Hive.box(name);
    return box.get(key);
  }

  Future<void> saveStringToBox(String name, String key, String value) async {
   await Hive.openBox(name);
    var box = Hive.box(name);
    box.put(key, value);
  }

  Future<void> savelistToBox(String name, List list) async {
    var box = Hive.box(name);
     box.add(list);
  }
}
