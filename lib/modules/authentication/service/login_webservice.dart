import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:nityahealth/modules/authentication/model/login_response.dart';
import '../../../utils/pref_manager.dart';

class LoginWebService extends GetConnect {
  Future<LoginResponseModel?> login(String email, String password) async {
    var baseUrl = "http://health.sajiloweb.com/api/";

    Map<String, String> map = {};
    map["email"] = email;
    map["password"] = password;

    Map<String, String> headersmap = {};
    headersmap["Content-type"] = "Application/json";

    var response = await super.post(
      "${baseUrl}login",
      json.encode(map),
      contentType: "Application/json",
      headers: headersmap,
    );

    log("response = ${response.statusCode}, \n  baseUrl= $baseUrl ");

    if (response.statusCode == 200 && response.body["success"] == true) {
      LoginResponseModel model = LoginResponseModel.fromJson(response.body);

      PrefManager.saveToken(
          model.data!.token == null ? "" : model.data!.token!);
      return model;
    } else {
      Get.snackbar("Error", response.body["message"]);
      log("message = ${response.statusText}");
      return null;
    }
  }
}
