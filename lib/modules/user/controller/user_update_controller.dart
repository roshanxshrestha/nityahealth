import 'dart:convert';
import 'package:get/get.dart';
import 'package:nityahealth/modules/user/model/user_update_model.dart';

import '../../../utils/pref_manager.dart';
import '../service/user_update.webservice.dart';

class UserUpdateController extends GetxController {
  var updateUserProfileProcess = false.obs;

  Future<UserUpdateModel?> updateProfile(String name, address, email, meals,
      image, gender, phone, age, height, weight) async {
    var response = await UserUpdateWebservice().updateProfile(
        name, image, address, email, meals, gender, phone, age, height, weight);
    if (response?.success == true) {
      var authToken = response?.data?.token ?? "";
      PrefManager.saveToken(authToken);
      PrefManager.isUpdateProfile(true);
    }
    print("Response - ${json.encode(response)}");
    return response;
  }
}
