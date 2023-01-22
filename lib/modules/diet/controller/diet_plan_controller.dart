import 'dart:developer';

import 'package:get/get.dart';
import 'package:nityahealth/modules/diet/model/diet_plan_model.dart';
import 'package:nityahealth/modules/diet/services/diet_plan_webservice.dart';

class DietPlanController extends GetxController {
  var dietPlan = DietPlanModel().obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getDietPlanList();
  }

  getDietPlanList() async {
    isLoading.value = true;

    try {
      var response = await DietPlanWebservice.getDietPlan();
      dietPlan.value = response;
      log("Response : $response");
    } catch (ex) {
      log("Response : ${ex.toString()}");
    }
    isLoading.value = false;
  }
}
