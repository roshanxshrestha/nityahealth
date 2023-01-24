import 'dart:developer';

import 'package:get/get.dart';

class DashBoardController extends GetxController {
  var hour = 0.obs;
  getHour() {
    var now = DateTime.now();
    var hour = now.hour;
    log("hour = $hour");
    return hour;
  }
}
