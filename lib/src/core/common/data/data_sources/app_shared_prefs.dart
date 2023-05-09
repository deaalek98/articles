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

  Future<void> setFilter(int days) async {
    await _preferences.setInt(FILTER_DAYS, days);
  }
  int getFilter() {
    return _preferences.getInt("FILTER_DAYS") ?? Helper.getListFilter()[0];
  }
  String getLang() {
    return _preferences.getString("lang") ?? "en";
  }

  Future<void> setLang(String local) async {
    await _preferences.setString("lang", local);
  }
}
