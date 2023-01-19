import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/fitness/controller/fitness_controller.dart';
import 'package:nityahealth/modules/fitness/ui/fitness_child.dart';
import '../../../utils/constants/app_theme.dart';
import '../model/fitness_model.dart';

class FitnessScreen extends StatelessWidget {
  final _controller = Get.put(FitnessController());
  int id;

  FitnessScreen(this.id, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Fitness"),

      body: Obx(
        () {
          print(
              "fitness count = ${_controller.fitnessModel.value.fitness?.length}");
          print("fitness id = $id");
          return LoadingOverlay(
            progressIndicator:
                const CircularProgressIndicator(color: AppColor.primaryColor),
            isLoading: _controller.isLoading.value,
            opacity: 0.2,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 1,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 0,
                  ),
                  shrinkWrap: true,
                  itemCount:
                      _controller.fitnessModel.value.fitness?.length ?? 0,
                  itemBuilder: (BuildContext context, int index) {
                    Fitness? model =
                        _controller.fitnessModel.value.fitness?[index];
                    return InkWell(
                      onTap: () {
                        _controller.pageId.value = model?.id ?? 0;
                        _controller.title.value = model?.title ?? "Fitness";
                        Get.to(() => FitnessChild(pageId: index));
                      },
                      child: SingleChildScrollView(
                        physics: const NeverScrollableScrollPhysics(),
                        child: Container(
                          height: 175,
                          width: 175,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: AppColor.secondaryColor),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 88,
                                width: 88,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Image.asset(
                                  "assets/images/fitness/yoga.png",
                                  height: 50,
                                  width: 50,
                                  alignment: Alignment.center,
                                ),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(top: 10, left: 5),
                                child: textF16W700(model?.title ?? ""),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

/*return Column(
            children: [
              ListView.builder(
                physics: AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                shrinkWrap: true,
                itemCount: _controller.fitnessModel.value.fitness == null
                    ? 0
                    : _controller.fitnessModel.value.fitness?.length,
                itemBuilder: (context, index) {
                  Fitness? model =
                      _controller.fitnessModel.value.fitness?[index];
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customText(model?.title ?? "", 18, FontWeight.w700),
                      SizedBox(
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount:
                              model?.childs == null ? 0 : model?.childs?.length,
                          itemBuilder: (context, index) {
                            Childs? child = model?.childs?[index];
                            return Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(height: 10),
                                textF16W700(child?.title ?? ""),
                                Container(
                                  margin:
                                      const EdgeInsets.symmetric(vertical: 10),
                                  height: 230,
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    clipBehavior: Clip.none,
                                    scrollDirection: Axis.horizontal,
                                    itemCount: model?.childs?[index].posts ==
                                            null
                                        ? 0
                                        : model?.childs?[index].posts?.length,
                                    itemBuilder: (context, ind) {
                                      Posts? post =
                                          model?.childs?[index].posts?[ind];
                                      return GestureDetector(
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
                                )
                              ],
                            );
                          },
                        ),
                      ),
                    ],
                  );
                },
              ),
            ],
          );
          */