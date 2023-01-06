import 'package:nityahealth/network/api/base_api.dart';

import '../model/user_model.dart';

class UserWebservice {
  Future<UserModel?> getUserInfo() async {
    try {
      var response = await http.get("users/1");
      var model = UserModel.fromJson(response.data);
    } catch (ex) {
      print("Error = ${ex.toString()}");
    }

    return null;
  }
}
