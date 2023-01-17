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

  static void setIsLogin(bool isLogin) {
    PrefsUtils.putBoolean(PrefKey.IS_LOGIN, isLogin);
  }

  static Future<bool> getIsLogin() async {
    return await PrefsUtils.getBoolean(PrefKey.IS_LOGIN, false);
  }

  static void isRegister(bool isRegister) {
    PrefsUtils.putBoolean(PrefKey.IS_REGISTER, isRegister);
  }

  static void isUpdateProfile(bool isUpdateProfile) {
    PrefsUtils.putBoolean(PrefKey.IS_UPDATE_PROFILE, isUpdateProfile);
  }

  static void isGoogleLogin(bool isGoogleLogin) {
    PrefsUtils.putBoolean(PrefKey.IS_GOOGLE_LOGIN, isGoogleLogin);
  }

  static void setName(String name) {
    PrefsUtils.putString(PrefKey.NAME, name);
  }

  static Future<String> getName() async {
    return await PrefsUtils.getString(PrefKey.NAME, "");
  }
}
