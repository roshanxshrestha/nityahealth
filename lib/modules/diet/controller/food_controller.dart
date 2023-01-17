import 'package:get/get.dart';
import '../model/food_model.dart';
import '../services/food_webservice.dart';

class FoodController extends GetxController {
  int? id;
  // FoodController(this.id);
  var foodModel = FoodModel().obs;
  var isLoading = false.obs;

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
}
