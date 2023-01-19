import 'package:nityahealth/modules/diet/model/single_post_model.dart';

import '../../../network/api/base_api.dart';
import '../model/food_model.dart';

class FoodWebService {
  static Future getFood() async {
    var response = await http.get("food");
    print("response  = $response");
    return FoodModel.fromJson(response.data);
  }

  static Future getSinglePost(int id) async {
    var response = await http.get("singlepost/$id");
    print("response = $response");
    return SinglePostModel.fromJson(response.data);
  }
}
