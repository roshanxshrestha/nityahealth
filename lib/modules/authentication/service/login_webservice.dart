import 'dart:convert';
import 'package:nityahealth/modules/authentication/model/login_response.dart';

import '../../../network/api/base_api.dart';

class LoginWebService {
  Future<LoginResponseModel?> login(String email, String password) async {
    Map<String, String> map = {};
    map["email"] = email;
    map["password"] = password;

    Map<String, String> headersmap = {};
    headersmap["Content-type"] = "Application/json";
    try {
      var response = await http.post("login", data: json.encode(map));
      print("response =$response");

      return LoginResponseModel.fromJson(response.data);
    } catch (ex) {
      print("Exception =$ex");
    }
  }
}
