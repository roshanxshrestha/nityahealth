import 'package:nityahealth/utils/prefsutils.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'constants/pref_key.dart';

class PrefManager {
  late SharedPreferences pref;

  static void saveToken(String token) {
    PrefsUtils.putString(PrefKey.AUTHORIZATION_TOKEN, token);
  }

  static Future<String> getToken() async {
    return await PrefsUtils.getString(PrefKey.AUTHORIZATION_TOKEN, "");
  }

  static void isLogin(bool isLogin) {
    PrefsUtils.putBoolean(PrefKey.IS_LOGIN, isLogin);
  }

  static Future<bool> getBoolean() async {
    return await PrefsUtils.getBoolean(PrefKey.IS_LOGIN, false);
  }

  static void isRegister(bool isRegister) {
    PrefsUtils.putBoolean(PrefKey.IS_REGISTER, isRegister);
  }

  static void isGoogleLogin(bool isGoogleLogin) {
    PrefsUtils.putBoolean(PrefKey.IS_GOOGLE_LOGIN, isGoogleLogin);
  }
}
