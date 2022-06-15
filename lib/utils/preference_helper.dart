import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class PreferenceHelper {
  static const String LOGIN_DATA = "LOGIN_DATA";
  static const String IS_SIGN_IN = "IS_SIGN_IN";
  static const String IS_SELLER_SIGN_IN = "IS_SELLER_SIGN_IN";
  static const String AUTH_TOKEN = "AUTH_TOKEN";
  static const String FCM_TOKEN = "FCM_TOKEN";
  static const String SELLER_ID = "SELLER_ID";
  static const String IS_REMEBER_ME = "IS_REMEBER_ME";
  static const String SELLER_EMAIL_ID = "SELLER_EMAIL_ID";
  static const String SELLER_PASSWORD = "SELLER_PASSWORD";
  static const String LOGIN_TYPE = "LOGIN_TYPE";
  static const String IS_FIRST_TIME = "IS_FIRST_TIME";
  static SharedPreferences? _prefs;
  static final Map<String, dynamic> _memoryPrefs = <String, dynamic>{};

  static Future<SharedPreferences?> load() async {
    _prefs ??= await SharedPreferences.getInstance();
    return _prefs;
  }

  static void setString(String key, String value) {
    _prefs!.setString(key, value);
    _memoryPrefs[key] = value;
  }

  static void setObject<T>(String key, dynamic value) {
    JsonEncoder encoder = const JsonEncoder();
    _prefs!.setString(key, encoder.convert(value));
    _memoryPrefs[key] = encoder.convert(value);
  }

  static void setInt(String key, int value) {
    _prefs!.setInt(key, value);
    _memoryPrefs[key] = value;
  }

  static void setDouble(String key, double value) {
    if (_prefs != null) {
      _prefs!.setDouble(key, value);
    }
    _memoryPrefs[key] = value;
  }

  static void setBool(String key, bool value) {
    _prefs!.setBool(key, value);
    _memoryPrefs[key] = value;
  }

  static String getString(String key, {String? def}) {
    String? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null && _prefs != null) {
      val = _prefs!.getString(key);
    }
    val ??= def;
    _memoryPrefs[key] = val;
    val ??= "";
    return val;
  }

  static int? getInt(String key, {int? def}) {
    int? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    val ??= _prefs!.getInt(key);
    val ??= def;
    _memoryPrefs[key] = val;
    return val;
  }

  static double? getDouble(String key, {double? def}) {
    double? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null && _prefs != null) {
      val = _prefs!.getDouble(key);
    }
    val ??= def;
    _memoryPrefs[key] = val;
    return val;
  }

  static bool getBool(String key, {bool def = false}) {
    bool? val;
    if (_memoryPrefs.containsKey(key)) {
      val = _memoryPrefs[key];
    }
    if (val == null && _prefs != null) {
      val = _prefs!.getBool(key);
    }
    val ??= def;
    _memoryPrefs[key] = val;
    return val;
  }

  static dynamic getObject(String key) {
    String val = getString(key, def: "");

    if (val.isNotEmpty) {
      JsonDecoder decoder = const JsonDecoder();
      return decoder.convert(val);
    }
    return "";
  }

  static void clear() {
    _memoryPrefs.remove(LOGIN_DATA);
    _prefs!.remove(LOGIN_DATA);

    _memoryPrefs.remove(SELLER_ID);
    _prefs!.remove(SELLER_ID);

    _memoryPrefs.remove(IS_SIGN_IN);
    _prefs!.remove(IS_SIGN_IN);

    _memoryPrefs.remove(AUTH_TOKEN);
    _prefs!.remove(AUTH_TOKEN);

    _memoryPrefs.remove(FCM_TOKEN);
    _prefs!.remove(FCM_TOKEN);

    _memoryPrefs.remove(IS_SELLER_SIGN_IN);
    _prefs!.remove(IS_SELLER_SIGN_IN);
  }
}
