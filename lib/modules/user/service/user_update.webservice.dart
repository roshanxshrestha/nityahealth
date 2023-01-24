import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';

import 'package:nityahealth/modules/user/model/user_update_model.dart';
import '../../../utils/pref_manager.dart';

class UserUpdateWebservice extends GetConnect {
  Future<UserUpdateModel?> updateProfile(
    String name,
    address,
    email,
    meals,
    image,
    gender,
    phone,
    age,
    height,
    weight,
    blood,
  ) async {
    var baseUrl = "http://health.sajiloweb.com/api";

    Map<String, String> map = {};
    map["name"] = name;
    map["image"] = image;
    map["address"] = address;
    map["email"] = email;
    map["meals"] = meals;
    map["gender"] = gender;
    map["phone"] = phone;
    map["age"] = age;
    map["height"] = height;
    map["weight"] = weight;
    map["blood"] = blood;

    Map<String, String> headersmap = {};
    headersmap["Content-type"] = "Application/json";

    var response = await super.post(
      "http://health.sajiloweb.com/api/update/user/profile",
      json.encode(map),
      contentType: "Application/json",
      headers: headersmap,
    );
    log("response=${response.statusCode},\n baseUrl= $baseUrl");
    if (response.statusCode == 200 && response.body["success"] == true) {
      UserUpdateModel model = UserUpdateModel.fromJson(response.body);

      PrefManager.saveToken(
          model.data!.token == null ? "" : model.data!.token!);
      return model;
    } else {
      Get.snackbar("Error", response.body["message"]);
      log("error: ${response.body["message"]}");
      return null;
    }
  }
}
