import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:nityahealth/modules/user/model/user_update_model.dart';

import '../../../utils/pref_manager.dart';
import '../model/user_model.dart';
import '../service/user_update_webservice.dart';

class UserUpdateController extends GetxController {
  var userprofile = UserModel().obs;
  var updateUserProfileProcess = false.obs;
  var selectedGender = "male".obs;
  var selectedBloodGroup = "select".obs;
  var selectedFoodType = "veg".obs;

  Future<UserUpdateModel?> updateProfile(Map<String, dynamic> map) async {
    var response = await UserUpdateWebservice().updateProfile(map);
    if (response?.success == true) {
      PrefManager.isUpdateProfile(true);
    }

    log("Response = ${json.encode(response)}");
    return response;
  }
}
