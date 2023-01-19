import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/wellness/wellness_categories/views/wellness_categ_grid.dart';
import 'package:nityahealth/modules/wellness/wellness_presentation/controller/wellness_controller.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

import '../model/wellness_model.dart';

class WellnessDashboard extends StatelessWidget {
  final _wellnessController = Get.put(WellnessController());

  WellnessDashboard({super.key});
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: const CustomAppBar(title: "Wellness"),
        body: LoadingOverlay(
          progressIndicator:
              const CircularProgressIndicator(color: AppColor.primaryColor),
          isLoading: _wellnessController.isLoading.value,
          opacity: 0.2,
          child: SingleChildScrollView(
            child: Column(
              children: [
                DefaultTabController(
                  length: _wellnessController.wellnessList.length,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        child: TabBar(
                          isScrollable: true,
                          labelColor: AppColor.accent2Color,
                          unselectedLabelColor: AppColor.accent3Color,
                          indicator: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            color: AppColor.primaryColor,
                          ),
                          tabs: [
                            for (Wellness wellness
                                in _wellnessController.wellnessList.value)
                              Container(
                                height: 40,
                                width: 150,
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: AppColor.primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Tab(
                                  child: textF16W700(
                                    wellness.title ?? "",
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height,
                        child: TabBarView(
                          children: [
                            for (Wellness wellness
                                in _wellnessController.wellnessList)
                              GridViewList(wellness.id!),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// class Wellness extends StatefulWidget {
//   const Wellness({super.key});

//   @override
//   State<StatefulWidget> createState() {
//     return WellnessState();
//   }
// }

// class WellnessState extends State<Wellness>
//     with SingleTickerProviderStateMixin {
//   // final List _isSelected = [true, false, false, false];
//   final _wellnessController = Get.find<WellnessController>();
//   bool onIt = false;
//   late TabController _tabController;

//   final List<Tab> myTabs = <Tab>[
//     Tab(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Center(
//           child: Text(
//             "Fitness",
//             style: GoogleFonts.comfortaa(
//                 fontSize: 14, fontWeight: FontWeight.w300),
//           ),
//         ),
//       ),
//     ),
//     Tab(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Center(
//           child: Text(
//             "Food",
//             style: GoogleFonts.comfortaa(
//                 fontSize: 14, fontWeight: FontWeight.w300),
//           ),
//         ),
//       ),
//     ),
//     Tab(
//       child: Padding(
//         padding: const EdgeInsets.all(10),
//         child: Center(
//           child: Text(
//             "Personal Care",
//             style: GoogleFonts.comfortaa(
//                 fontSize: 14, fontWeight: FontWeight.w300),
//           ),
//         ),
//       ),
//     ),
//   ];

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(
//       vsync: this,
//       length: myTabs.length,
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Obx(
//       () => Scaffold(
//         appBar: const CustomAppBar(title: "Wellness"),
//         body: Padding(
//           padding: const EdgeInsets.only(top: 16),
//           child: Column(
//             children: [
//               PreferredSize(
//                 preferredSize: Size(MediaQuery.of(context).size.width, 0),
//                 child: TabBar(
//                   isScrollable: true,
//                   controller: _tabController,
//                   unselectedLabelColor: AppColor.primaryColor,
//                   indicator: BoxDecoration(
//                     color: AppColor.primaryColor,
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   labelColor: AppColor.accent2Color,
//                   tabs: myTabs,
//                 ),
//               ),
//               Container(
//                 padding: const EdgeInsets.only(top: 10),
//                 width: MediaQuery.of(context).size.width,
//                 height: MediaQuery.of(context).size.height - 200,
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: const [
//                     Center(
//                       child: Fitness(),
//                     ),
//                     Center(
//                       child: Food(),
//                     ),
//                     Center(
//                       child: PersonalCare(),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
