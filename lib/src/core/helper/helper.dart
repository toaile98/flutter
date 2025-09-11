import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../shared/data/data_sources/app_shared_prefs.dart';
import '../../shared/domain/entities/language_enum.dart';
import '../utils/injections.dart';

class Helper {
  /// Get language
  static LanguageEnum getLang() {
    LanguageEnum? lang;
    lang = sl<AppSharedPrefs>().getLang();
    lang = lang ?? LanguageEnum.vi;
    return lang;
  }

  /// Get vertical space
  static double getVerticalSpace() {
    return 10.h;
  }

  /// Get horizontal space
  static double getHorizontalSpace() {
    return 10.w;
  }

  /// Get Dio Header
  static Future<Map<String, dynamic>> getHeaders() async {
    final accessToken = await sl<AppSharedPrefs>().getAccessToken();
    return {"token": accessToken}..removeWhere((key, value) => value == null);
  }

  static bool isDarkTheme() {
    return sl<AppSharedPrefs>().getIsDarkTheme();
  }
}
