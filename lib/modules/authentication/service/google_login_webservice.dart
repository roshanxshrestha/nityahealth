import 'dart:convert';
import 'package:get/get.dart';
import 'package:nityahealth/utils/pref_manager.dart';
import '../model/google_login_response.dart';

class GoogleLoginWebService extends GetConnect {
  Future<GoogleLoginResponseModel?> googleLogin(
      String name, String email, String googleId) async {
    var baseUrl = "http://health.sajiloweb.com/api";
    Map<String, String> map = {};
    map["name"] = name;
    map["email"] = email;
    map["google_id"] = googleId;

    Map<String, String> headersmap = {};
    headersmap["Content-type"] = "Application/json";

    var response = await super.post(
      "http://health.sajiloweb.com/api/google",
      json.encode(map),
      contentType: "Aplication/json",
      headers: headersmap,
    );

    print("response= ${response.statusCode},\n baseUrl= ${baseUrl}");
    if (response.statusCode == 200 && response.body["success"] == true) {
      GoogleLoginResponseModel model =
          GoogleLoginResponseModel.fromJson(response.body);

      PrefManager.saveToken(
          model.data!.token == null ? "" : model.data!.token!);

      return model;
    } else {
      Get.snackbar("Error", response.body["message"]);
      return null;
    }
  }
}
