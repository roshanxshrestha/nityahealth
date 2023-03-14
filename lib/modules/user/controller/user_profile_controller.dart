import 'dart:developer';

import 'package:get/get.dart';
import 'package:nityahealth/modules/user/model/user_model.dart';
import 'package:nityahealth/modules/user/service/user_webservice.dart';

class UserProfileController extends GetxController {
  var userprofile = UserModel().obs;
  // var personalDetails = PersonalDetails().obs;
  var isLoading = false.obs;

  @override
  onInit() {
    super.onInit();
    getUserProfile();
  }

  getUserProfile() async {
    isLoading.value = true;
    var response = await UserWebservice().getUserInfo();

    if (response != null) {
      userprofile.value = response;
    }
    isLoading.value = false;
    log("Response: $response");
  }
}

class ImageUpdateController extends GetxController {
  var isProfileImgPathSet = false.obs;
  var profileImgPath = "".obs;

  void setProfileImagePath(String path) {
    profileImgPath.value = path;
    isProfileImgPathSet.value = true;
  }
}
