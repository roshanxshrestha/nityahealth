import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/modules/diet/controller/diet_plan_controller.dart';
import 'package:nityahealth/modules/diet/ui/food_list.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/diet/model/diet_plan_model.dart';

import '../../../common/or_divider.dart';
import '../../../utils/constants/app_theme.dart';

class DietPlan extends StatelessWidget {
  final _controller = Get.put(DietPlanController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: const CustomAppBar(title: "Diet Plan"),
      body: Obx(
        () {
          print(
              "diet plan count = ${_controller.dietPlan.value.purpose?.length}");
          return Container(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "You want to",
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
                    Purpose? model = _controller.dietPlan.value.purpose?[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 8),
                        GestureDetector(
                          onTap: () {
                            Get.to(FoodList());
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width,
                            height: 50,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: AppColor.primaryColor,
                              border: Border.all(
                                color: AppColor.primaryColor,
                              ),
                            ),
                            child: Text(
                              model?.purpose ?? "",
                              style: GoogleFonts.comfortaa(
                                color: Colors.white,
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
                customButton1("Maintain Weight", "foodlist", context),
                const SizedBox(height: 8),
                orDivider(),
                const SizedBox(height: 8),
                customButton1("Calculate your BMI", "bmicalc", context),
              ],
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
      //                     print(
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
