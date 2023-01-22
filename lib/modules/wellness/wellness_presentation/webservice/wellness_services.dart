import 'dart:developer';

import 'package:nityahealth/modules/wellness/wellness_presentation/model/wellness_child_model.dart';

import '../../../../network/api/base_api.dart';
import '../model/wellness_model.dart';

class WellnessWebservices {
  static Future<WellnessModel> getWellness() async {
    var response = await http.get("wellness");
    log("response = $response");
    return WellnessModel.fromJson(response.data);
  }

  static Future<WellnessChildModel> getWellnessChild(int wellnessId) async {
    var response = await http.get("wellness/$wellnessId/items");
    log("response = $response");

    return WellnessChildModel.fromJson(response.data);
  }
}
