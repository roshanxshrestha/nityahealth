import 'dart:developer';

import 'package:nityahealth/modules/food/model/single_post_model.dart';
import 'package:nityahealth/modules/fitness/model/fitness_model.dart';
import 'package:nityahealth/network/api/base_api.dart';

class FitnessWebservice {
  static Future getFitness() async {
    var response = await http.get("fitness");
    log("response  = $response");
    return FitnessModel.fromJson(response.data);
  }

  static Future getSingleFitnessPost(int id) async {
    var response = await http.get("singlepost/$id");
    log("response = $response");
    return SinglePostModel.fromJson(response.data);
  }
}
