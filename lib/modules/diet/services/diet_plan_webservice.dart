import 'package:nityahealth/modules/diet/model/diet_plan_model.dart';

import '../../../network/api/base_api.dart';

class DietPlanWebservice {
  static Future getDietPlan() async {
    var response = await http.get("purposes");
    print("response = $response");
    return DietPlanModel.fromJson(response.data);
  }
}
