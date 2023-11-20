//
//  cache_helper.dart
//  Created on 2023 02 November.
//  Copyright © IDeen Flutter application,
//  Developed by 2023 Hossein HassanNejad.
//

import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static Future<void> init() async {
    prefs = await SharedPreferences.getInstance();
  }

  static const String _langCachedCode = "langCode";
  static const String _verseCachedCode = "verseCode";
  static const String _lastSeenCachedCode = "lastSeenCode";

  static String getCachedLanguage() {
    final code = prefs.getString(_langCachedCode);
    if (code != null) {
      return code;
    } else {
      return 'fa';
    }
  }

  static Future<void> cacheLanguage(String code) async {
    await prefs.setString(_langCachedCode, code);
  }

  static List<String> getSavedVerses() {
    final String versesData = prefs.getString(_verseCachedCode) ?? '[]';

    final List<String> verses = versesData == '[]'
        ? <String>[]
        : (jsonDecode(versesData) as List).cast<String>().toList();

    return verses;
  }

  static Future<void> saveVerse(int surahNumber, int verseNumber) async {
    final List<String> verses = getSavedVerses();

    final String newVerse = '$surahNumber-$verseNumber';

    bool isDuplicate = false;
    for (var i = 0; i < verses.length; i++) {
      if (verses[i] == newVerse) {
        isDuplicate = true;
      }
    }

    if (!isDuplicate) {
      verses.add(newVerse);
      await prefs.setString(_verseCachedCode, jsonEncode(verses));
    }
  }

  static Future<void> removeVerse(int surahNumber, int verseNumber) async {
    final String versesData = prefs.getString(_verseCachedCode) ?? '[]';

    final List verses = jsonDecode(versesData);

    final String newVerse = '$surahNumber-$verseNumber';

    for (var i = 0; i < verses.length; i++) {
      if (verses[i] == newVerse) {
        verses.removeAt(i);
      }
    }

    await prefs.setString(_verseCachedCode, jsonEncode(verses));
  }

  static String? get getLastSeen => prefs.getString(_lastSeenCachedCode);

  static Future<void> saveLastSeen(int surahNumber, int verseNumber) async {
    await prefs.setString(
        _lastSeenCachedCode, jsonEncode('$surahNumber-$verseNumber'));
  }
}
