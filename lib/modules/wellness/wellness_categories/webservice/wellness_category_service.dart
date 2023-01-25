import 'dart:developer';

import 'package:nityahealth/common/singlepost_model.dart';
import 'package:nityahealth/modules/wellness/wellness_categories/model/wellness_list_model.dart';
import '../../../../network/api/base_api.dart';

class WellnessCategoryServices {
  static Future getWellnessList(int pageId) async {
    var response = await http.get("wellness/items/$pageId/pages");
    log("response = $response");
    return WellnessListModel.fromJson(response.data);
  }

  static Future getSinglePost(int id) async {
    var response = await http.get("singlepost/$id");
    log("response = $response");
    return SinglePostModel.fromJson(response.data);
  }
}
