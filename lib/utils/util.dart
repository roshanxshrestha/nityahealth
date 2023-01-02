// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:get/get.dart';
// import 'package:nityahealth/features/constants/pref_keys.dart';
// import 'package:nityahealth/features/presentation/ui/login/view/homepage.dart';
// import 'package:nityahealth/features/presentation/ui/login/view/sign_in.dart';
// import 'package:nityahealth/features/utils/pref_manager.dart';
// import 'package:nityahealth/features/utils/prefsutils.dart';

// class Util{
//   static Future<bool> getIsLogin() async {
//     return await PrefsUtils.getBoolean(PrefKey.IS_LOGIN, false);
//   }


//   static showToast(String msg){
//     Fluttertoast.showToast(
//       msg: msg,
//       toastLength: Toast.LENGTH_SHORT,
//       gravity: ToastGravity.CENTER,
//       timeInSecForIosWeb: 1,
//       backgroundColor: Colors.grey.shade400,
//       textColor: Colors.white,
//       fontSize: 14.0
//     );
//   }


//   static logout(BuildContext context){
//     PrefManager.saveToken("");
//     PrefManager.setIsLogin(true);
//     PrefManager.saveUserInfo("");
//     Get.to(HomePage());
//   }
// }