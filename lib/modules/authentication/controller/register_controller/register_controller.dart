import 'package:get/state_manager.dart';
import 'package:nityahealth/modules/authentication/model/register_response.dart';
import 'package:nityahealth/modules/authentication/service/register_webservice.dart';
import 'package:nityahealth/utils/pref_manager.dart';

class RegisterController extends GetxController {
  var registerProcess = false.obs;
  String error = "";

  Future<RegisterResponseModel?> register(String name, String email,
      String password, String cPassword, String address, String phone) async {
    var response = await RegisterWebService()
        .register(name, email, password, cPassword, address, phone);
    if (response?.success == true) {
      var authToken = response?.data?.token ?? "";
      PrefManager.saveToken(authToken);
      PrefManager.isRegister(true);
    }
    return response;
  }
}
