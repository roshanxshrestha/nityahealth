import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:nityahealth/modules/user/model/user_update_model.dart';

class UserUpdateWebservice extends GetConnect {
  Future<UserUpdateModel?> updateProfile(
    String name,
    String address,
    String email,
    String meals,
    String image,
    String gender,
    String phone,
    String age,
    String height,
    String weight,
    String blood,
  ) async {
    var baseUrl = "http://health.sajiloweb.com/api/";

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
      "${baseUrl}update/user/profile",
      json.encode(map),
      contentType: "Application/json",
      headers: headersmap,
    );
    log("response=${response.statusCode},\n baseUrl= $baseUrl");
    if (response.statusCode == 200 && response.body["success"] == true) {
      UserUpdateModel model = UserUpdateModel.fromJson(response.body);

      return model;
    } else {
      
      // Get.snackbar("Error", response.body["message"]);
      // log("error: ${response.body["message"]}");
      return null;
    }
  }
}
