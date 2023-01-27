import 'dart:developer';

import 'package:nityahealth/modules/food/model/single_post_model.dart';

import '../../../network/api/base_api.dart';
import '../model/food_model.dart';

class FoodWebService {
  static Future getFood() async {
    var response = await http.get("food");
    log("response  = $response");
    return FoodModel.fromJson(response.data);
  }

  static Future getSinglePost(int id) async {
    var response = await http.get("singlepost/$id");
    log("response = $response");
    return SinglePostModel.fromJson(response.data);
  }
}
