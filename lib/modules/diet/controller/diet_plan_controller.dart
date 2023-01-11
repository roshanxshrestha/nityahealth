import 'package:get/get.dart';
import 'package:nityahealth/modules/diet/model/diet_plan_model.dart';
import 'package:nityahealth/modules/diet/services/diet_plan_webservice.dart';

class DietPlanController extends GetxController {
  var dietPlan = DietPlanModel().obs;

  @override
  void onInit() {
    super.onInit();
    getDietPlanList();
  }

  getDietPlanList() async {
    try {
      var response = await DietPlanWebservice.getDietPlan();
      dietPlan.value = response;
      print("Response : ${response}");
    } catch (ex) {
      print("Response : ${ex.toString()}");
    }
  }
}
