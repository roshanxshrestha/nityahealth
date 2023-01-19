import 'dart:ffi';

import 'package:get/get.dart';
import 'package:nityahealth/modules/fitness/model/fitness_model.dart';
import 'package:nityahealth/modules/fitness/service/fitness_webservice.dart';

class FitnessController extends GetxController {
  var fitnessModel = FitnessModel().obs;
  var pageId = 0.obs;
  var id = 0.obs;
  var title = "Fitness".obs;
  var isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    getFitnessData();
  }

  getFitnessData() async {
    isLoading.value = true;
    try {
      var response = await FitnessWebservice.getFitness();
      fitnessModel.value = response;
      print("response = ${response}");
    } catch (ex) {
      print("Exception = ${ex.toString()}");
    }
    isLoading.value = false;
  }

  // getFitnessList() async {
  //   try {
  //     var response = await FitnessWebservice.getFitness();
  //   } catch (ex) {
  //     print("Exception = ${ex.toString()}");
  //   }
  // }
}
