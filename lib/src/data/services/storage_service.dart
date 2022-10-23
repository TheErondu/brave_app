import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final storageprovider = FutureProvider.family<Box, String>((ref, name) async {
  return await Hive.openBox(name);
});

class StorageService {
  Future<String?> readBox(String name, String key) async {
    await Hive.openBox(name);
    var box = Hive.box(name);
    return box.get(key);
  }

  Future<void> saveStringToBox(String name, String key, String value) async {
    await Hive.openBox(name);
    var box = Hive.box(name);
    box.put(key, value);
  }

  Future<void> deleteFromBox(String name, String key) async {
    await Hive.openBox(name);
    var box = Hive.box(name);
    box.delete(key);
  }

  Future<void> saveThemeMode(String name, String key, int value) async {
    await Hive.openBox(name);
    var box = Hive.box(name);
    box.put(key, value);
  }

  Future<int> getThemeMode() async {
    await Hive.openBox("settings");
    var box = Hive.box("settings");
    int themeMode = box.get("themeMode") ?? ThemeMode.light.index;
    return themeMode;
  }

  Future<void> savelistToBox(String name, List list) async {
    var box = Hive.box(name);
    box.add(list);
  }
}
