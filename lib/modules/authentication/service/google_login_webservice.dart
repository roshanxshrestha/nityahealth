import 'dart:convert';
import '../../../network/api/base_api.dart';
import '../model/google_login_response.dart';

class GoogleLoginWebService {
  Future<GoogleLoginResponseModel?> googleLogin(
      String name, String email, String googleId) async {
    Map<String, String> map = {};
    map["name"] = name;
    map["email"] = email;
    map["google_id"] = googleId;

    Map<String, String> headersmap = {};
    headersmap["Content-type"] = "Application/json";
    // headers["AuthToken"] ="Application/json";
    try {
      var response = await http.post("google", data: json.encode(map));
      print("response =$response");

      return GoogleLoginResponseModel.fromJson(response.data);
    } catch (ex) {
      print("Exception =$ex");
    }
    return null;
  }
}
