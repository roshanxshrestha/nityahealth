import '../../../network/api/base_api.dart';
import '../model/doctors_model.dart';

class DoctorsWebservice {
  static Future getDoctorData() async {
    var response = await http.get("alldoctors");
    print("response  = $response");
    return DoctorsModel.fromJson(response.data);
  }
}
