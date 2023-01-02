import 'dart:convert';
import 'package:nityahealth/modules/authentication/model/register_response.dart';

import '../../../network/api/base_api.dart';

class RegisterWebService {
  Future<RegisterResponseModel?> register(String name, String email,
      String password, String cPassword, String address, String phone) async {
    Map<String, String> map = {};
    map["name"] = name;
    map["email"] = email;
    map["password"] = password;
    map["c_password"] = cPassword;
    map["address"] = address;
    map["phone"] = phone;

    Map<String, String> headersmap = {};
    headersmap["Content-type"] = "Application/json";

    var response = await http.post("register", data: json.encode(map));
    print("response =$response");
    return RegisterResponseModel.fromJson(response.data);

    // try {
    //   var response = await http.post("register", data: json.encode(map));
    //   print("response =$response");
    //   return RegisterResponseModel.fromJson(response.data);
    // } catch (ex) {
    //   print("Exception =$ex");
    // }
  }
}
