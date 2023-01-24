import 'dart:developer';

import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/yoga/controller/yoga_controller.dart';
import 'package:nityahealth/modules/yoga/ui/yoga_singlepost.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

import '../../../common/date_day.dart';
import '../model/yoga_model.dart';

class YogaActivities extends StatefulWidget {
  YogaActivities({super.key});

  @override
  State<YogaActivities> createState() => _YogaActivitiesState();
}

class _YogaActivitiesState extends State<YogaActivities> {
  final _controller = Get.put(YogaController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Yoga"),
      body: Obx(
        () {
          return LoadingOverlay(
            progressIndicator:
                const CircularProgressIndicator(color: AppColor.primaryColor),
            isLoading: _controller.isLoading.value,
            opacity: 0.2,
            child: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const DateDay(),
                    Container(
                      height: 450,
                      padding: const EdgeInsets.only(top: 16),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.vertical,
                        child: ListView.builder(
                          clipBehavior: Clip.none,
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: _controller.yogaModel.value.yoga == null
                              ? 0
                              : _controller.yogaModel.value.yoga?.length,
                          itemBuilder: (context, index) {
                            Yoga? model =
                                _controller.yogaModel.value.yoga?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // const SizedBox(height: 16),
                                textF16W700(model?.title ?? ""),

                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  height: 230,
                                  child: ListView.builder(
                                    clipBehavior: Clip.none,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: model?.posts == null
                                        ? 0
                                        : model?.posts?.length,
                                    itemBuilder: (context, id) {
                                      log("Count = ${model?.posts?.length}");
                                      Posts? post = model?.posts?[id];
                                      return GestureDetector(
                                        onTap: () {
                                          _controller.id.value = post?.id ?? 0;
                                          Get.to(() => YogaSinglePost());
                                        },
                                        child: Container(
                                          margin: const EdgeInsets.only(
                                              left: 0, right: 16),
                                          width: 160,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: AppColor.accent2Color,
                                            boxShadow: [
                                              BoxShadow(
                                                  color: AppColor.accent4Color
                                                      .withOpacity(0.1),
                                                  offset: const Offset(3, 3),
                                                  blurRadius: 5,
                                                  spreadRadius: 1),
                                            ],
                                          ),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Container(
                                                height: 110,
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(10),
                                                    topRight:
                                                        Radius.circular(10),
                                                  ),
                                                  image: DecorationImage(
                                                    image: NetworkImage(
                                                        post?.image ?? ""),
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              ),
                                              Container(
                                                margin:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 10,
                                                        vertical: 10),
                                                height: 40,
                                                child: Text(
                                                  post?.title ?? "",
                                                  style: GoogleFonts.comfortaa(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 12, right: 12),
                                                child: Column(
                                                  children: [
                                                    Row(
                                                      children: [
                                                        Icon(
                                                          MdiIcons.clockOutline,
                                                          color: AppColor
                                                              .accent3Color
                                                              .withOpacity(0.7),
                                                          size: 18,
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          "not available",
                                                          style: GoogleFonts
                                                              .comfortaa(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const SizedBox(height: 12),
                                                    Row(
                                                      children: [
                                                        const Icon(
                                                          MdiIcons.flash,
                                                          color: AppColor
                                                              .accent3Color,
                                                          size: 18,
                                                        ),
                                                        const SizedBox(
                                                            width: 10),
                                                        Text(
                                                          "not available",
                                                          style: GoogleFonts
                                                              .comfortaa(
                                                            fontSize: 14,
                                                            fontWeight:
                                                                FontWeight.w300,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
