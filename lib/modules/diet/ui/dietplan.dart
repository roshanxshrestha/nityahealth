import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/modules/diet/controller/diet_plan_controller.dart';
import 'package:nityahealth/modules/diet/ui/food_list.dart';
import 'package:nityahealth/modules/diet/model/diet_plan_model.dart';

import '../../../utils/constants/app_theme.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({super.key});

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
  int selected = 0;
  final _controller = Get.put(DietPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Diet Plan"),
      body: Obx(
        () {
          log("diet plan count = ${_controller.dietPlan.value.purpose?.length}");
          return LoadingOverlay(
            progressIndicator:
                const CircularProgressIndicator(color: AppColor.primaryColor),
            isLoading: _controller.isLoading.value,
            opacity: 0.2,
            child: Container(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Choose your goal",
                    style: GoogleFonts.comfortaa(
                        fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: _controller.dietPlan.value.purpose == null
                        ? 0
                        : _controller.dietPlan.value.purpose?.length,
                    itemBuilder: (BuildContext context, int index) {
                      Purpose? model =
                          _controller.dietPlan.value.purpose?[index];
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                selected = index;
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                color: (selected == index)
                                    ? AppColor.primaryColor
                                    : AppColor.accent2Color,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(
                                  color: AppColor.primaryColor,
                                ),
                              ),
                              child: Text(
                                model?.purpose ?? "",
                                style: GoogleFonts.comfortaa(
                                  color: (selected == index)
                                      ? AppColor.accent2Color
                                      : AppColor.primaryColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  // customButton1("Maintain Weight", "foodlist", context),
                  // const SizedBox(height: 8),
                  // orDivider(),
                  // const SizedBox(height: 8),
                  // customButton1("Calculate your BMI", "bmicalc", context),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: GestureDetector(
                          onTap: () {
                            Get.to(FoodList(_controller
                                .dietPlan.value.purpose?[selected].id));
                          },
                          child: Container(
                            height: 65,
                            width: 65,
                            decoration: BoxDecoration(
                              color: AppColor.primaryColor,
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: const Icon(
                              Icons.keyboard_arrow_right,
                              color: AppColor.accent2Color,
                              size: 36,
                            ),
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
      // body: Align(
      //   alignment: Alignment.center,
      //   child: SizedBox(
      //     height: MediaQuery.of(context).size.height,
      //     width: MediaQuery.of(context).size.width / 1.1,
      //     child: Column(
      //       crossAxisAlignment: CrossAxisAlignment.center,
      //       children: [
      //         const SizedBox(height: 16),
      //         Text(
      //           "You want to",
      //           style: GoogleFonts.comfortaa(
      //               fontSize: 18, fontWeight: FontWeight.w700),
      //         ),
      //         const SizedBox(height: 16),
      //         Column(
      //           crossAxisAlignment: CrossAxisAlignment.center,
      //           children: [
      //             Obx(
      //               () => SizedBox(
      //                 height: 200,
      //                 child: ListView.builder(
      //                   itemCount: _controller.dietPlan.value.purpose?.length,
      //                   itemBuilder: (BuildContext context, int index) {
      //                     log(
      //                         "Array size  = ${_controller.dietPlan.value.purpose?.length}");
      //                     Purpose? model =
      //                         _controller.dietPlan.value.purpose?[index];
      //                     return Column(
      //                       children: [
      //                         const SizedBox(height: 8),
      //                         customButton1(
      //                             model?.purpose ?? "", "foodlist", context),
      //                       ],
      //                     );
      //                   },
      //                 ),
      //               ),
      //             ),
      //             // customButton1("Gain Weight", "foodlist", context),
      //             const SizedBox(height: 8),
      //             customButton1("Loose Weight", "foodlist", context),
      //             const SizedBox(height: 8),
      //             customButton1("Maintain Weight", "foodlist", context),
      //             const SizedBox(height: 8),
      //             orDivider(),
      //             const SizedBox(height: 8),
      //             customButton1("Calculate your BMI", "bmicalc", context),
      //           ],
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
