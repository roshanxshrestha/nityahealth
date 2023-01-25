import 'dart:developer';

import 'package:nityahealth/modules/diet/model/diet_plan_model.dart';

import '../../../network/api/base_api.dart';

class DietPlanWebservice {
  static Future getDietPlan() async {
    var response = await http.get("purposes");
    log("response = $response");
    return DietPlanModel.fromJson(response.data);
  }
}
