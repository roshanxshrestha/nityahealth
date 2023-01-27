import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/food/controller/food_controller.dart';
import 'package:nityahealth/modules/food/model/food_model.dart';
import '../../../utils/constants/app_theme.dart';
import 'food_details.dart';

class FoodList extends StatelessWidget {
  int? id;

  FoodList(this.id, {super.key});
  final _controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Food"),
      body: Obx(() {
        log("count = ${_controller.foodModel.value.food?.length}");

        return LoadingOverlay(
          progressIndicator:
              const CircularProgressIndicator(color: AppColor.primaryColor),
          isLoading: false,
          opacity: 0.2,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16),
                  itemCount: _controller.foodModel.value.food == null
                      ? 0
                      : _controller.foodModel.value.food?.length,
                  itemBuilder: (BuildContext context, int index) {
                    Food? model = _controller.foodModel.value.food?[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textF16W700(model?.title ?? ""),
                        const SizedBox(height: 10),
                        SizedBox(
                          height: 230,
                          child: ListView.builder(
                            clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount:
                                model?.posts == null ? 0 : model?.posts?.length,
                            itemBuilder: (BuildContext context, int ind) {
                              Post? post = model?.posts?[ind];
                              return GestureDetector(
                                onTap: () {
                                  _controller.id.value = post?.id ?? 0;
                                  Get.to(FoodDetails());
                                },
                                child: Container(
                                  margin:
                                      const EdgeInsets.only(left: 0, right: 16),
                                  width: 160,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColor.accent2Color,
                                    boxShadow: [
                                      BoxShadow(
                                          color: accent4Color.withOpacity(0.1),
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
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(10),
                                            topRight: Radius.circular(10),
                                          ),
                                          image: DecorationImage(
                                            image:
                                                NetworkImage(post?.image ?? ""),
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
                                                  style: GoogleFonts.comfortaa(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
                                                  ),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 12),
                                            Row(
                                              children: [
                                                const Icon(
                                                  MdiIcons.flash,
                                                  color: AppColor.accent3Color,
                                                  size: 18,
                                                ),
                                                const SizedBox(width: 10),
                                                Text(
                                                  "not available",
                                                  style: GoogleFonts.comfortaa(
                                                    fontSize: 14,
                                                    fontWeight: FontWeight.w300,
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
                        ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              model?.childs == null ? 0 : model?.childs?.length,
                          itemBuilder: (BuildContext context, int id) {
                            log("child count = ${model?.childs?.length}");
                            Childs? child = model?.childs?[id];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                textF16W700(child?.title ?? "nothing here"),
                                const SizedBox(height: 10),
                                SizedBox(
                                  height: 230,
                                  child: ListView.builder(
                                    clipBehavior: Clip.none,
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    itemCount: child?.posts == null
                                        ? 0
                                        : child?.posts?.length,
                                    itemBuilder:
                                        (BuildContext context, int ind) {
                                      Posts? posts = child?.posts?[ind];
                                      return Container(
                                        margin: const EdgeInsets.only(
                                            left: 0, right: 16),
                                        width: 160,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColor.accent2Color,
                                          boxShadow: [
                                            BoxShadow(
                                                color: accent4Color
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
                                                      posts?.image ?? ""),
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
                                                posts?.title ?? "",
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
                                                      const SizedBox(width: 10),
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
                                                      const SizedBox(width: 10),
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
                                      );
                                    },
                                  ),
                                )
                              ],
                            );
                          },
                        )
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
