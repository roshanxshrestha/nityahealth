import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:nityahealth/modules/yoga/model/yoga_model.dart';
import 'package:nityahealth/modules/yoga/webservice/yoga_webservice.dart';

import '../../../common/singlepost_model.dart';

class YogaController extends GetxController {
  var yogaModel = YogaModel().obs;
  var isLoading = false.obs;
  var singlePost = SinglePostModel().obs;
  var id = 0.obs;
  var title = "Yoga".obs;

  @override
  void onInit() {
    getYogaList();
    super.onInit();
  }

  getYogaList() async {
    isLoading.value = true;
    try {
      var response = await YogaWebservice.getYoga();
      yogaModel.value = response;
      log("getYOgaList ${json.encode(yogaModel)} ");
    } catch (ex) {
      log("Exception = ${ex.toString()}");
    }
    isLoading.value = false;
  }

  getSingleYogaPost(int id) async {
    try {
      var response = await YogaWebservice.getSingleYogaPost(id);
      singlePost.value = response;
      log("response= ${json.encode(singlePost.value)}");
    } catch (ex) {
      log("Exception = ${ex.toString()}");
    }
  }
}
