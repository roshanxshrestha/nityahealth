import 'dart:convert';
import 'package:get/get.dart';
import 'package:nityahealth/modules/authentication/model/register_response.dart';
import 'package:nityahealth/utils/pref_manager.dart';

class RegisterWebService extends GetConnect {
  Future<RegisterResponseModel?> register(
    String name,
    String email,
    String password,
    String cPassword,
    String address,
    String phone,
  ) async {
    var baseUrl = "http://health.sajiloweb.com/api";

    Map<String, String> map = {};
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    map["c_password"] = cPassword;
    map["address"] = address;
    map["phone"] = phone;

    Map<String, String> headersmap = {};
    headersmap["Content-type"] = "Application/json";

    var response = await super.post(
      "http://health.sajiloweb.com/api/register",
      json.encode(map),
      contentType: "Application/json",
      headers: headersmap,
    );
    print("response=${response.statusCode},\n baseUrl= ${baseUrl}");
    if (response.statusCode == 200 && response.body["success"] == true) {
      RegisterResponseModel model =
          RegisterResponseModel.fromJson(response.body);

      PrefManager.saveToken(
          model.data!.token == null ? "" : model.data!.token!);
      return model;
    } else {
      Get.snackbar("Error", response.body["message"]);
      return null;
    }
  }
}
