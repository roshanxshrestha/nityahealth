import 'dart:convert';
import 'dart:developer';
import 'package:nityahealth/modules/user/model/user_update_model.dart';
import 'package:nityahealth/network/api/base_api.dart';

class UserUpdateWebservice {
  Future<UserUpdateModel?> updateProfile(Map<String, dynamic> map) async {
    log("Postdata = ${json.encode(map)}");

    var response =
        await http.post("update/user/profile", data: json.encode(map));
    UserUpdateModel model = UserUpdateModel.fromJson(response.data);
    return model;
  }
}
