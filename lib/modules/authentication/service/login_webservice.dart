import 'dart:convert';
import 'package:get/get.dart';
import 'package:nityahealth/modules/authentication/model/login_response.dart';
import '../../../utils/pref_manager.dart';

class LoginWebService extends GetConnect {
  Future<LoginResponseModel?> login(String email, String password) async {
    var baseUrl = "http://health.sajiloweb.com/api";

    Map<String, String> map = {};
    map["email"] = email;
    map["password"] = password;

    Map<String, String> headersmap = {};
    headersmap["Content-type"] = "Application/json";
    // headers["AuthToken"] ="Application/json";

    var response = await super.post(
      "http://health.sajiloweb.com/api/login",
      json.encode(map),
      contentType: "Application/json",
      headers: headersmap,
    );

    print("response = ${response.statusCode}, \n  baseUrl= ${baseUrl}");

    if (response.statusCode == 200) {
      LoginResponseModel model = LoginResponseModel.fromJson(response.body);

      PrefManager.saveToken(
          model.data!.token == null ? "" : model.data!.token!);
      // PrefManager.setIsLogin(true);
      // PrefManager.saveName(model.data!.name.toString());
      return model;
    } else {
      Get.snackbar("Error", "Something went wrong");
      return null;
    }
  }
}
