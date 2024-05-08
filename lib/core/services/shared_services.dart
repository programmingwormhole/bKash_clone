import 'package:shared_preferences/shared_preferences.dart';

enum SetType { string, bool, int, double, stringList }

class SharedServices {

  static Future setData(SetType type, String key, dynamic value) async {
    final prefs = await SharedPreferences.getInstance();

    type == SetType.string
        ? prefs.setString(key, value)
        : type == SetType.int
        ? prefs.setInt(key, value)
        : type == SetType.bool
        ? prefs.setBool(key, value)
        : type == SetType.double
        ? prefs.setDouble(key, value)
        : type == SetType.stringList
        ? prefs.setStringList(key, value)
        : null;
  }

  static Future getData(SetType type, String key) async {
    final prefs = await SharedPreferences.getInstance();

    dynamic data = type == SetType.string
        ? prefs.getString(key)
        : type == SetType.int
        ? prefs.getInt(key)
        : type == SetType.bool
        ? prefs.getBool(key)
        : type == SetType.double
        ? prefs.getDouble(key)
        : type == SetType.stringList
        ? prefs.getStringList(key)
        : null;

    print('Key: ${key} Value: ${data}');

    return data;
  }

  static Future removeData (String key) async {
    final prefs = await SharedPreferences.getInstance();

    prefs.remove(key);
  }
}