import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/fitness/controller/fitness_controller.dart';
import 'package:nityahealth/modules/fitness/ui/single_post.dart';

import '../../../utils/constants/app_theme.dart';
import '../model/fitness_model.dart';

class FitnessChild extends StatelessWidget {
  FitnessChild({required this.pageId, super.key});
  final _controller = Get.put(FitnessController());
  int pageId;

  @override
  Widget build(BuildContext context) {
    log("pageId = ${_controller.pageId.value}");
    log("pageTitle = ${_controller.title.value}");
    return Scaffold(
      appBar: CustomAppBar(title: _controller.title.value),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _controller
                        .fitnessModel.value.fitness?[pageId].childs?.length,
                    itemBuilder: (BuildContext context, int index) {
                      Childs? childs = _controller
                          .fitnessModel.value.fitness?[pageId].childs?[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          textF16W700(childs?.title ?? ""),
                          Container(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            height: 230,
                            child: ListView.builder(
                              shrinkWrap: true,
                              clipBehavior: Clip.none,
                              scrollDirection: Axis.horizontal,
                              itemCount: childs?.posts == null
                                  ? 0
                                  : childs?.posts?.length,
                              itemBuilder: (context, id) {
                                Posts? post = childs?.posts?[id];
                                return GestureDetector(
                                  onTap: () {
                                    _controller.id.value = post?.id ?? 0;
                                    Get.to(() => FitnessSinglePost());
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        left: 0, right: 16),
                                    width: 160,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
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
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            image: DecorationImage(
                                              image: NetworkImage(
                                                  post?.image ?? ""),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.symmetric(
                                              horizontal: 10, vertical: 10),
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
                                                    color: AppColor.accent3Color
                                                        .withOpacity(0.7),
                                                    size: 18,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    "not available",
                                                    style:
                                                        GoogleFonts.comfortaa(
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
                                                    color:
                                                        AppColor.accent3Color,
                                                    size: 18,
                                                  ),
                                                  const SizedBox(width: 10),
                                                  Text(
                                                    "not available",
                                                    style:
                                                        GoogleFonts.comfortaa(
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
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
