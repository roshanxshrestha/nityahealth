import 'package:get/get.dart';
import '../model/food_model.dart';
import '../services/food_webservice.dart';

class FoodController extends GetxController {
  var foodModel = FoodModel().obs;

  @override
  void onInit() {
    super.onInit();
    getFoodData();
  }

  getFoodData() async {
    try {
      var response = await FoodWebService.getFood();
      foodModel.value = response;
      print("response = ${response}");
    } catch (error) {
      print("Exception = ${error.toString()}");
    }
  }
}
