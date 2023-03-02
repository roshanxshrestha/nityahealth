import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:get/get.dart';
import '../../common/custom_button.dart';
import '../../common/text_style.dart';
import '../../utils/constants/app_theme.dart';
import '../user/controller/user_profile_controller.dart';
import '../user/model/user_model.dart';

class MedicineRecord extends StatefulWidget {
  const MedicineRecord({super.key});

  @override
  State<MedicineRecord> createState() => _MedicineRecordState();
}

class _MedicineRecordState extends State<MedicineRecord> {
  final _controller = Get.put(UserProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(() => Column(
              children: [
                customButton1("+ Add medicine record", "", context),
                const SizedBox(height: 16.0),
                Row(
                  children: [
                    Expanded(
                        flex: 1, child: customText("S.N", 14, FontWeight.bold)),
                    Expanded(
                        flex: 4,
                        child:
                            customText("Medicine Name", 14, FontWeight.bold)),
                    Expanded(
                        flex: 4,
                        child: customText("Disease Name", 14, FontWeight.bold)),
                    Expanded(
                        flex: 3,
                        child: customText("Duration", 14, FontWeight.bold)),
                    Expanded(
                        flex: 2,
                        child: customText("Action", 14, FontWeight.bold)),
                  ],
                ),
                const Divider(
                  thickness: 1,
                  color: AppColor.accent1Color,
                ),
                const SizedBox(height: 10),
                Expanded(
                  child: ListView.separated(
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    itemCount: _controller
                            .userprofile.value.user?.mdicalRecords?.length ??
                        0,
                    itemBuilder: (context, index) {
                      MdicalRecords? mdCond = _controller
                          .userprofile.value.user?.mdicalRecords?[index];
                      log("count = ${_controller.userprofile.value.user?.mdicalRecords?.length}");

                      return Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child: textF14W300((index + 1).toString())),
                          const SizedBox(width: 10),
                          Expanded(
                              flex: 4,
                              child: textF14W300(mdCond?.medicineName ?? "")),
                          const SizedBox(width: 10),
                          Expanded(
                              flex: 4,
                              child: textF14W300(
                                  mdCond?.diseaseId.toString() ?? "")),
                          const SizedBox(width: 10),
                          Expanded(
                              flex: 3,
                              child: textF14W300(mdCond?.duration ?? "")),
                          const SizedBox(width: 10),
                          Expanded(flex: 2, child: textF14W300("edit")),
                        ],
                      );
                    },
                  ),
                )
              ],
            )),
      ),
    );
  }
}
