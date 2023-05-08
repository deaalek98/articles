import 'package:shared_preferences/shared_preferences.dart';
import 'package:articles/src/core/core.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;

  AppSharedPrefs(this._preferences);

  bool getIsDarkTheme() {
    //isDark
    return _preferences.getBool(THEME) ?? false;
  }

  Future<void> setTheme(bool isDark) async {
    await _preferences.setBool(THEME, isDark);
  }

  String getLang() {
    return _preferences.getString("lang") ?? "en";
  }

  Future<void> setLang(String local) async {
    await _preferences.setString("lang", local);
  }
}
