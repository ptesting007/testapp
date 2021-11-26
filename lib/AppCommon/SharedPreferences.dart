import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late final SharedPreferences _prefsInstance;

  static Future<SharedPreferences> init() async =>
      _prefsInstance = await SharedPreferences.getInstance();

  //Getter setter for String Values
  static String getString(String key, {String defValue = ""}) {
    return _prefsInstance.getString(key) ?? defValue;
  }

  static void setString(String key, String value) async {
    _prefsInstance.setString(key, value);
  }

  //Getter setter for BoolValues
  static bool getBool(String key, {bool defValue = false}) {
    return _prefsInstance.getBool(key) ?? defValue;
  }

  static void setBool(String key, bool value) async {
    _prefsInstance.setBool(key, value);
  }

  //Getter setter for Int Values
  static int getInt(String key, {int defValue = 0}) {
    return _prefsInstance.getInt(key) ?? defValue;
  }

  static void setInt(String key, int value) async {
    _prefsInstance.setInt(key, value);
  }

  //Getter setter for Int Values
  static double getDouble(String key, {double defValue = 0.0}) {
    return _prefsInstance.getDouble(key) ?? defValue;
  }

  static void setDouble(String key, double value) async {
    _prefsInstance.setDouble(key, value);
  }

  //Getter setter for StringList Values
  static List<String> getStringList(String key) {
    return _prefsInstance.getStringList(key) ?? <String>[];
  }

  static void setStringList(String key, List<String> value) async {
    _prefsInstance.setStringList(key, value);
  }

  //Getter setter for Custom Object Values
  static dynamic getCustomObject(String key) {
    return jsonDecode(_prefsInstance.getString(key) ?? "");
  }

  static void setCustomObject(String key, dynamic value) async {
    _prefsInstance.setString(key, jsonEncode(value));
  }


  static void clearAllData() async {
    _prefsInstance.clear();
  }

  static bool isContains(String key) {
    return _prefsInstance.containsKey(key);
  }


}
