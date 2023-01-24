import 'dart:developer';

import 'package:nityahealth/network/api/base_api.dart';
import '../model/user_model.dart';

class UserWebservice {
  Future<UserModel?> getUserInfo() async {
    try {
      var response = await http.get("my-profile");
      var model = UserModel.fromJson(response.data);
      return model;
    } catch (ex) {
      log("Error = ${ex.toString()}");
    }
    return null;
  }
}
