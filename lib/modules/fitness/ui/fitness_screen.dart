import 'dart:developer';

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
          log("fitness count = ${_controller.fitnessModel.value.fitness?.length}");
          log("fitness id = $id");
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
