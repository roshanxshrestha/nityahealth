import 'dart:convert';

import 'package:nityahealth/modules/diet/model/diet_plan_model.dart';

import '../../../network/api/base_api.dart';

class DietPlanWebservice {
  static Future<DietPlanModel?> getDietPlan() async {
    try {
      var response = await http.get("purposes");
      var model = DietPlanModel.fromJson(response.data);
      print("model data = ${json.encode(model)}");
      print("response = $response");
      return model;
    } catch (ex) {
      print("Error = ${ex.toString()}");
    }
    return null;
  }
}
