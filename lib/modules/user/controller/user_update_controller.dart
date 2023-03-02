import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:nityahealth/modules/user/model/user_update_model.dart';

import '../../../utils/pref_manager.dart';
import '../service/user_update.webservice.dart';

class UserUpdateController extends GetxController {
  var updateUserProfileProcess = false.obs;

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
    var response = await UserUpdateWebservice().updateProfile(name, image,
        address, email, meals, gender, phone, age, height, weight, blood);
    if (response?.success == true) {
      // var authToken = response?.data?.token ?? "";
      // PrefManager.saveToken(authToken);
      PrefManager.isUpdateProfile(true);
    }
    log("Response - ${json.encode(response)}");
    return response;
  }
}
