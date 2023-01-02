import 'package:get/get.dart';
import 'package:nityahealth/utils/pref_manager.dart';

import '../../model/google_login_response.dart';
import '../../service/google_login_webservice.dart';

class GoogleLoginController extends GetxController {
  var googleLoginProcess = false.obs;
  String error = "";

  Future<GoogleLoginResponseModel?> googleLogin(
      String name, String email, String googleId) async {
    var response =
        await GoogleLoginWebService().googleLogin(name, email, googleId);
    if (response?.success == true) {
      var authToken = response?.data?.token ?? "";
      PrefManager.saveToken(authToken);
      PrefManager.isGoogleLogin(true);
    }
    return response;
  }
}
