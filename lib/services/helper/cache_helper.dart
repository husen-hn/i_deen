import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String _cachedCode = "cachedCode";

  static String getCachedLanguage() {
    final code = prefs.getString(_cachedCode);
    if (code != null) {
      return code;
    } else {
      return 'fa';
    }
  }

  static Future<void> cacheLanguage(String code) async {
    await prefs.setString(_cachedCode, code);
  }
}
