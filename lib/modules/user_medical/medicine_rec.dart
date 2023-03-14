import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/custom_button.dart';
import '../../common/datepicker.dart';
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
        child: Obx(
          () => Column(
            children: [
              customButton2("+ Add medicine record", context, () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: textF16W700("+ Add medicine record"),
                      content: SizedBox(
                        height: 305,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText("Medicine Name*", 14, FontWeight.w400),
                            const TextField(),
                            const SizedBox(height: 20),
                            customText("Disease Name", 14, FontWeight.w400),
                            const TextField(),
                            const SizedBox(height: 20),
                            customText("Duration", 14, FontWeight.w400),
                            const DatePicker(),
                            const SizedBox(height: 20),
                            Row(
                              children: [
                                InkWell(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 3.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.red,
                                      border: Border.all(
                                        color: Colors.red,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Cancel",
                                        style: GoogleFonts.comfortaa(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 16),
                                InkWell(
                                  child: Container(
                                    height: 50,
                                    width:
                                        MediaQuery.of(context).size.width / 3.1,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: AppColor.primaryColor,
                                      border: Border.all(
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        "Confirm",
                                        style: GoogleFonts.comfortaa(
                                          color: Colors.white,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
              const SizedBox(height: 16.0),
              Row(
                children: [
                  Expanded(
                      flex: 1, child: customText("S.N", 14, FontWeight.bold)),
                  Expanded(
                      flex: 4,
                      child: customText("Medicine Name", 14, FontWeight.bold)),
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
                        Expanded(
                          flex: 2,
                          child: IconButton(
                            icon: const Icon(
                              Icons.edit,
                            ),
                            iconSize: 14,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        textF16W700("Edit Medicine Record"),
                                        GestureDetector(
                                          onTap: () {
                                            Get.back();
                                          },
                                          child: const Align(
                                            alignment: Alignment.topRight,
                                            child: CircleAvatar(
                                              radius: 14.0,
                                              backgroundColor: Colors.white,
                                              child: Icon(Icons.close,
                                                  color: Colors.red),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    content: SizedBox(
                                      height: 305,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          customText("Medicine Name*", 14,
                                              FontWeight.w400),
                                          const TextField(),
                                          const SizedBox(height: 20),
                                          customText("Disease Name*", 14,
                                              FontWeight.w400),
                                          const TextField(),
                                          const SizedBox(height: 20),
                                          customText(
                                              "Duration", 14, FontWeight.w400),
                                          const DatePicker(),
                                          const SizedBox(height: 20),
                                          Row(
                                            children: [
                                              InkWell(
                                                child: Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.1,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color: Colors.red,
                                                    border: Border.all(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Delete",
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 16),
                                              InkWell(
                                                child: Container(
                                                  height: 50,
                                                  width: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      3.1,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    color:
                                                        AppColor.primaryColor,
                                                    border: Border.all(
                                                      color:
                                                          AppColor.primaryColor,
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Text(
                                                      "Update",
                                                      style:
                                                          GoogleFonts.comfortaa(
                                                        color: Colors.white,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.w700,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
