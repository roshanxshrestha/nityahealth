import 'dart:convert';
import 'dart:developer';
import 'package:get/get_connect/http/src/multipart/form_data.dart';
import 'package:nityahealth/modules/user/model/user_update_model.dart';
import 'package:nityahealth/network/api/base_api.dart';

class UserUpdateWebservice {
  Future<UserUpdateModel?> updateProfile(FormData formData) async {
    // log("Postdata = ${json.encode(formData)}");

// Convert the FormData object to a JSON-serializable Map
    Map<String, dynamic> data = {};
    for (var entry in formData.fields) {
      data[entry.key] = entry.value;
    }
    String jsonData = json.encode(data);
    log("Param data =${json.encode(jsonData)}");

    var response =
        await http.post("update/user/profile", data: json.encode(jsonData));
    UserUpdateModel model = UserUpdateModel.fromJson(response.data);
    return model;
  }
}
