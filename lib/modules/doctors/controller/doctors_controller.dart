import 'package:get/get.dart';
import 'package:nityahealth/modules/doctors/model/doctors_model.dart';

import '../service/doctors_webservice.dart';

class DoctorsController extends GetxController {
  var doctorModel = DoctorsModel().obs;
  var isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getDoctorData();
  }

  getDoctorData() async {
    isLoading.value = true;
    try {
      var response = await DoctorsWebservice.getDoctorData();
      doctorModel.value = response;
      print("response = $response");
    } catch (ex) {
      print("Exception = ${ex.toString()}");
    }
    isLoading.value = false;
  }
}
