import 'dart:developer';

import 'package:nityahealth/common/singlepost_model.dart';
import 'package:nityahealth/modules/yoga/model/yoga_model.dart';

import '../../../network/api/base_api.dart';

class YogaWebservice {
  static Future<YogaModel> getYoga() async {
    var response = await http.get("yoga");
    log("response = $response");
    return YogaModel.fromJson(response.data);
  }

  static Future getSingleYogaPost(int id) async {
    var response = await http.get("singlepost/$id");
    log("response = $response");
    return SinglePostModel.fromJson(response.data);
  }
}
