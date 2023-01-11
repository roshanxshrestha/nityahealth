import '../../../network/api/base_api.dart';
import '../model/food_model.dart';

class FoodWebService {
  static Future getFood() async {
    var response = await http.get("food");
    print("response  = $response");
    return FoodModel.fromJson(response.data);
  }
}
