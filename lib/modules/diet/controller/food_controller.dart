import 'dart:convert';

import 'package:get/get.dart';
import 'package:nityahealth/modules/diet/model/single_post_model.dart';
import '../model/food_model.dart';
import '../services/food_webservice.dart';

class FoodController extends GetxController {
  var id = 0.obs;
  // FoodController(this.id);
  var foodModel = FoodModel().obs;
  var isLoading = false.obs;
  var singlePost = SinglePostModel().obs;

  @override
  void onInit() {
    super.onInit();
    getFoodData();
  }

  getFoodData() async {
    isLoading.value = true;
    try {
      var response = await FoodWebService.getFood();
      foodModel.value = response;
      print("response = ${response}");
    } catch (error) {
      print("Exception = ${error.toString()}");
    }
    isLoading.value = false;
  }

  getSingleFoodData(int id) async {
    // isLoading.value = true;
    try {
      var response = await FoodWebService.getSinglePost(id);
      singlePost.value = response;
      print("response = ${json.encode(singlePost.value)}");
    } catch (ex) {
      print("exception = ${ex.toString()}");
    }
    // isLoading.value = false;
  }
}
