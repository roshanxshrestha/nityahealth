import 'package:get/get.dart';
import 'package:nityahealth/modules/user/model/user_model.dart';
import 'package:nityahealth/modules/user/service/user_webservice.dart';

class UserProfileController extends GetxController {
  var userprofile = UserModel().obs;

  @override
  onInit() {
    super.onInit();
    getUserProfile();
  }

  getUserProfile() async {
    var response = await UserWebservice().getUserInfo();
    if (response != null) {
      userprofile.value = response;
    }
    print("Response: ${response}");
  }
}
