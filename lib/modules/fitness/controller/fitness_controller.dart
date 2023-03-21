import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:nityahealth/modules/food/model/single_post_model.dart';
import 'package:nityahealth/modules/fitness/model/fitness_model.dart';
import 'package:nityahealth/modules/fitness/service/fitness_webservice.dart';

class FitnessController extends GetxController {
  var fitnessModel = FitnessModel().obs;
  var singlePost = SinglePostModel().obs;

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
      log("response = $response");
    } catch (ex) {
      log("Exception = ${ex.toString()}");
    }
    isLoading.value = false;
  }

  getSingleFitnessPost(int id) async {
    try {
      var response = await FitnessWebservice.getSingleFitnessPost(id);
      singlePost.value = response;
      log("response= ${json.encode(singlePost.value)}");
    } catch (ex) {
      log("Exception = ${ex.toString()}");
    }
  }
}
