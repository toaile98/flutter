import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../core/utils/constant/local_storage_constants.dart';
import '../../domain/entities/language_enum.dart';

class AppSharedPrefs {
  final SharedPreferences _preferences;
  final FlutterSecureStorage _secureStorage;

  final _keyAccessToken = 'access_token';
  final _keyRefreshToken = 'refresh_token';

  AppSharedPrefs(this._preferences, this._secureStorage);

  /// __________ Language __________ ///
  LanguageEnum? getLang() {
    String? data = _preferences.getString(lang);
    if (data == null) {
      return LanguageEnum.en;
    }
    return LanguageEnum.values.firstWhere((element) => element.local == data);
  }

  void setLang(LanguageEnum language) {
    _preferences.setString(lang, language.local);
  }

  /// __________ Dark Theme __________ ///
  bool getIsDarkTheme() {
    return _preferences.getBool(theme) ?? false;
  }

  void setDarkTheme(bool isDark) {
    _preferences.setBool(theme, isDark);
  }

  /// __________ AccessToken & RefreshToken __________ ///
  Future<void> setAccessToken(String token) async {
    if (kIsWeb) {
      await _preferences.setString(_keyAccessToken, token);
    } else {
      await _secureStorage.write(key: _keyAccessToken, value: token);
    }
  }

  Future<String> getAccessToken() async {
    if (kIsWeb) {
      return _preferences.getString(_keyAccessToken) ?? '';
    } else {
      return await _secureStorage.read(key: _keyAccessToken) ?? '';
    }
  }

  Future<void> clearAccessToken() async {
    if (kIsWeb) {
      await _preferences.remove(_keyAccessToken);
    } else {
      await _secureStorage.delete(key: _keyAccessToken);
    }
  }

  Future<void> setRefreshToken(String token) async {
    if (kIsWeb) {
      await _preferences.setString(_keyRefreshToken, token);
    } else {
      await _secureStorage.write(key: _keyRefreshToken, value: token);
    }
  }

  Future<String> getRefreshToken() async {
    if (kIsWeb) {
      return _preferences.getString(_keyRefreshToken) ?? '';
    } else {
      return await _secureStorage.read(key: _keyRefreshToken) ?? '';
    }
  }

  Future<void> clearRefreshToken() async {
    if (kIsWeb) {
      await _preferences.remove(_keyRefreshToken);
    } else {
      await _secureStorage.delete(key: _keyRefreshToken);
    }
  }

  // ================= Clear All Tokens =================
  Future<void> clearAllTokens() async {
    if (kIsWeb) {
      await _preferences.remove(_keyAccessToken);
      await _preferences.remove(_keyRefreshToken);
    } else {
      await _secureStorage.delete(key: _keyAccessToken);
      await _secureStorage.delete(key: _keyRefreshToken);
    }
  }
}
