import 'package:nityahealth/modules/fitness/model/fitness_model.dart';
import 'package:nityahealth/network/api/base_api.dart';

class FitnessWebservice {
  static Future getFitness() async {
    var response = await http.get("fitness");
    print("response  = $response");
    return FitnessModel.fromJson(response.data);
  }
}
