import 'package:get/get.dart';
import 'package:nityahealth/utils/pref_manager.dart';

import '../../model/login_response.dart';
import '../../service/login_webservice.dart';

class LoginController extends GetxController {
  var loginProcess = false.obs;
  String error = "";

  Future<LoginResponseModel?> login(String email, String password) async {
    var response = await LoginWebService().login(email, password);
    if (response?.success == true) {
      var authToken = response?.data?.token ?? "";
      PrefManager.saveToken(authToken);
      PrefManager.setIsLogin(true);
      PrefManager.setName(response?.data?.name ?? "");

      // var name = await PrefManager.getName();

      // Map mapResponse = json.decode(response?.data);
      // Map dataResponse = mapResponse["message"];

    }
    return response;
  }
}
