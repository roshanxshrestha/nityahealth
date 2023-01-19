import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/wellness/wellness_categories/model/wellness_list_model.dart';
import 'package:nityahealth/modules/wellness/wellness_categories/views/single_post_page.dart';
import 'package:nityahealth/modules/wellness/wellness_presentation/controller/wellness_controller.dart';
import '../../../../utils/constants/app_theme.dart';

class WellnessCategoryChild extends StatelessWidget {
  WellnessCategoryChild({super.key});
  final _controller = Get.put(WellnessController());

  @override
  Widget build(BuildContext context) {
    print("pageId = ${_controller.pageId.value}");
    _controller.getWellnessListData(_controller.pageId.value);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(
        title: "Wellness List",
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(left: 16.0, right: 16.0),
          child: Obx(
            () {
              return LoadingOverlay(
                progressIndicator: const CircularProgressIndicator(
                    color: AppColor.primaryColor),
                isLoading: _controller.isLoading.value,
                opacity: 0.2,
                child: Column(
                  children: [
                    ListView.builder(
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      itemCount:
                          _controller.wellnessCategChild.value.wellnessPage ==
                                  null
                              ? 0
                              : _controller.wellnessCategChild.value
                                  .wellnessPage?.length,
                      itemBuilder: (BuildContext context, int index) {
                        WellnessPage? model = _controller
                            .wellnessCategChild.value.wellnessPage?[index];
                        return Padding(
                          padding: const EdgeInsets.only(top: 16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              customText(
                                  model?.title ?? "", 18, FontWeight.w400),
                              const SizedBox(height: 16),
                              SizedBox(
                                height: 204,
                                child: ListView.builder(
                                  clipBehavior: Clip.none,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemCount: model?.posts == null
                                      ? 0
                                      : model?.posts?.length,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    Posts? posts = model?.posts?[index];
                                    return GestureDetector(
                                      onTap: () {
                                        _controller.id.value = posts?.id ?? 0;
                                        Get.to(SinglePostPage());
                                      },
                                      child: Container(
                                        margin: const EdgeInsets.only(
                                            left: 0, right: 16),
                                        width: 152,
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
                                              height: 102,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                                image: DecorationImage(
                                                  image: NetworkImage(
                                                      posts?.image ??
                                                          "image here"),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      horizontal: 10,
                                                      vertical: 10),
                                              child: customText(
                                                  posts?.title ?? "",
                                                  16,
                                                  FontWeight.w300),
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
                                                      textF14W300(
                                                          "no key in api"),
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
                                                      textF14W300(
                                                          "no key in api"),
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
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
