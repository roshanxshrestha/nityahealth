import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../common/custom_button.dart';
import '../../common/text_style.dart';
import '../../utils/constants/app_theme.dart';
import '../user/controller/user_profile_controller.dart';
import '../user/model/user_model.dart';

class MedicalRecord extends StatefulWidget {
  const MedicalRecord({super.key});

  @override
  State<MedicalRecord> createState() => _MedicalRecordState();
}

class _MedicalRecordState extends State<MedicalRecord> {
  final _controller = Get.put(UserProfileController());
  var diseaseNameController = TextEditingController();
  var diseaseTypeController = TextEditingController();

  List<String> items = [
    'Yes',
    'No',
  ];
  String? selectedItem = "Yes";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Obx(
          () => Column(
            children: [
              customButton2("+ Add medical condition", context, () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: textF16W700("+ Add medical condition"),
                      content: SizedBox(
                        height: 305,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            customText("Disease Name*", 14, FontWeight.w400),
                            TextField(
                              controller: diseaseNameController,
                            ),
                            const SizedBox(height: 20),
                            customText("Disease Type", 14, FontWeight.w400),
                            TextField(
                              controller: diseaseTypeController,
                            ),
                            const SizedBox(height: 20),
                            customText("is Cured?", 14, FontWeight.w400),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 0),
                              child: Center(
                                child: DropdownButtonFormField(
                                  decoration: const InputDecoration(
                                    fillColor: AppColor.accent1Color,
                                  ),
                                  value: selectedItem,
                                  items: items
                                      .map((item) => DropdownMenuItem<String>(
                                          value: item,
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 10),
                                            child: Text(
                                              item,
                                              style: GoogleFonts.comfortaa(
                                                color: accent3Color,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w300,
                                              ),
                                            ),
                                          )))
                                      .toList(),
                                  onChanged: (String? item) {
                                    setState(() => selectedItem = item);
                                  },
                                ),
                              ),
                            ),
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
                      child: customText("Disease Name", 14, FontWeight.bold)),
                  Expanded(
                      flex: 4,
                      child: customText("Disease Type", 14, FontWeight.bold)),
                  Expanded(
                      flex: 2,
                      child: customText("Cured?", 14, FontWeight.bold)),
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
                          .userprofile.value.user?.medicalConditions?.length ??
                      0,
                  itemBuilder: (context, index) {
                    MedicalConditions? mdCond = _controller
                        .userprofile.value.user?.medicalConditions?[index];
                    log("count = ${_controller.userprofile.value.user?.medicalConditions?.length}");
                    diseaseNameController.text = _controller.userprofile.value
                            .user?.medicalConditions?[index].diseaseName ??
                        "";
                    diseaseNameController.text = _controller.userprofile.value
                            .user?.medicalConditions?[index].type ??
                        "";
                    return Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: textF14W300((index + 1).toString())),
                        const SizedBox(width: 10),
                        Expanded(
                            flex: 4,
                            child: textF14W300(mdCond?.diseaseName ?? "")),
                        const SizedBox(width: 10),
                        Expanded(
                            flex: 4, child: textF14W300(mdCond?.type ?? "")),
                        const SizedBox(width: 10),
                        Expanded(
                            flex: 2, child: textF14W300(mdCond?.isCured ?? "")),
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
                                        textF16W700("Edit Medical Condition"),
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
                                          customText("Disease Name*", 14,
                                              FontWeight.w400),
                                          TextField(
                                            controller: diseaseNameController,
                                          ),
                                          const SizedBox(height: 20),
                                          customText("Disease Type", 14,
                                              FontWeight.w400),
                                          TextField(
                                            controller: diseaseTypeController,
                                          ),
                                          const SizedBox(height: 20),
                                          customText(
                                              "Cured?", 14, FontWeight.w400),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 0),
                                            child: Center(
                                              child: DropdownButtonFormField(
                                                decoration:
                                                    const InputDecoration(
                                                  fillColor:
                                                      AppColor.accent1Color,
                                                ),
                                                value: selectedItem,
                                                items: items
                                                    .map(
                                                      (item) =>
                                                          DropdownMenuItem<
                                                              String>(
                                                        value: item,
                                                        child: Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                      .symmetric(
                                                                  horizontal:
                                                                      10),
                                                          child: Text(
                                                            item,
                                                            style: GoogleFonts
                                                                .comfortaa(
                                                              color:
                                                                  accent3Color,
                                                              fontSize: 14,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w300,
                                                            ),
                                                          ),
                                                        ),
                                                      ),
                                                    )
                                                    .toList(),
                                                onChanged: (String? item) {
                                                  setState(() =>
                                                      selectedItem = item);
                                                },
                                              ),
                                            ),
                                          ),
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
