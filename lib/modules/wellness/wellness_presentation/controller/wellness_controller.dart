import 'dart:convert';
import 'dart:developer';

import 'package:get/get.dart';
import 'package:nityahealth/common/singlepost_model.dart';
import 'package:nityahealth/modules/wellness/wellness_categories/model/wellness_list_model.dart';
import 'package:nityahealth/modules/wellness/wellness_categories/webservice/wellness_category_service.dart';
import 'package:nityahealth/modules/wellness/wellness_presentation/model/wellness_child_model.dart';
import 'package:nityahealth/modules/wellness/wellness_presentation/webservice/wellness_services.dart';

import '../model/wellness_model.dart';

class WellnessController extends GetxController {
  var isLoading = false.obs;
  var wellnessList = <Wellness>[].obs;
  var wellnessChildList = WellnessChildModel().obs;
  var wellnessCategChild = WellnessListModel().obs;
  var singlePost = SinglePostModel().obs;

  var pageId = 0.obs;
  var id = 0.obs;
  var title = "Wellness".obs;

  @override
  void onInit() {
    getWellnessList();
    super.onInit();
  }

  getWellnessList() async {
    // isLoading.value = true;
    try {
      var response = await WellnessWebservices.getWellness();
      wellnessList.value = response.wellness!;
      log("getWellnessList ${json.encode(wellnessList)}");
    } catch (ex) {
      log("Exception = ${ex.toString()}");
    }
    // isLoading.value = false;
  }

  getWellnessChildList(int wellnessId) async {
    // isLoading.value = true;
    try {
      var response = await WellnessWebservices.getWellnessChild(wellnessId);
      wellnessChildList.value = response;
      log("getWellnessChildList ${json.encode(wellnessChildList.value)}");
    } catch (ex) {
      log("exception = ${ex.toString()}");
    }
    // isLoading.value = false;
  }

  getWellnessListData(int pageId) async {
    // isLoading.value = false;
    try {
      var response = await WellnessCategoryServices.getWellnessList(pageId);
      wellnessCategChild.value = response;
      log("response = ${json.encode(wellnessCategChild.value)}");
    } catch (ex) {
      log("Exception = ${ex.toString()}");
    }
    // isLoading.value = false;
  }

  getSinglePostData(int id) async {
    // isLoading.value = true;
    try {
      var response = await WellnessCategoryServices.getSinglePost(id);
      singlePost.value = response;
      log("response = ${json.encode(singlePost.value)}");
    } catch (ex) {
      log("exception = ${ex.toString()}");
    }
    // isLoading.value = false;
  }
}
