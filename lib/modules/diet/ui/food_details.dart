import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:get/get.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/diet/controller/food_controller.dart';

class FoodDetails extends StatelessWidget {
  FoodDetails({super.key});
  final _controller = Get.put(FoodController());

  @override
  Widget build(BuildContext context) {
    print("id = ${_controller.id.value}");
    _controller.getSingleFoodData(_controller.id.value);
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(title: "Food"),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(top: 100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _controller.singlePost.value.post?.image != null
                  ? SizedBox(
                      height: 300,
                      width: MediaQuery.of(context).size.width,
                      child: Image.network(
                        _controller.singlePost.value.post?.image ?? "",
                        fit: BoxFit.cover,
                      ),
                    )
                  : const SizedBox.shrink(),
              Container(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 16.0),
                      child: Center(
                        child: customText(
                          _controller.singlePost.value.post?.title ?? "",
                          18,
                          FontWeight.w700,
                        ),
                      ),
                    ),
                    Html(
                      data:
                          _controller.singlePost.value.post?.description ?? "",
                    ),
                  ],
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.all(16.0),
              //   child: Column(
              //     crossAxisAlignment: CrossAxisAlignment.start,
              //     children: [
              //       customText("Balanced Diet For All", 18, FontWeight.w700),
              //       const SizedBox(height: 16),
              //       customText("Macros for Serving", 13, FontWeight.w400),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceAround,
              //         children: [
              //           Column(
              //             children: [
              //               customText("kcal", 12, FontWeight.w400),
              //               const SizedBox(height: 10),
              //               customText("313 kcal", 12, FontWeight.w300),
              //             ],
              //           ),
              //           Column(
              //             children: [
              //               customText("Protein", 12, FontWeight.w400),
              //               const SizedBox(height: 10),
              //               customText("313 kcal", 12, FontWeight.w300),
              //             ],
              //           ),
              //           Column(
              //             children: [
              //               customText("Carb", 12, FontWeight.w400),
              //               const SizedBox(height: 10),
              //               customText("313 kcal", 12, FontWeight.w300),
              //             ],
              //           ),
              //           Column(
              //             children: [
              //               customText("Fat", 12, FontWeight.w400),
              //               const SizedBox(height: 10),
              //               customText("313 kcal", 12, FontWeight.w300),
              //             ],
              //           ),
              //         ],
              //       ),
              //       const SizedBox(height: 16),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Preparation Time", 16, FontWeight.w300),
              //           customText("65 mins", 16, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("1 Serving", 16, FontWeight.w300),
              //           customText("482 g", 16, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 16),
              //       customText("Other Nutrients", 16, FontWeight.w400),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Fat Saturated", 12, FontWeight.w300),
              //           customText("2.01 g", 12, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Fat Trans", 12, FontWeight.w300),
              //           customText("0 g", 12, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Fat MonoSaturated", 12, FontWeight.w300),
              //           customText("9.01 g", 12, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Sugar", 12, FontWeight.w300),
              //           customText("5.01 g", 12, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Fiber", 12, FontWeight.w300),
              //           customText("10 g", 12, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Cholestrol", 12, FontWeight.w300),
              //           customText("0 g", 12, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Sodium", 12, FontWeight.w300),
              //           customText("201.64 mg", 12, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Calcium", 12, FontWeight.w300),
              //           customText("162.03 mg", 12, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 10),
              //       Row(
              //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //         children: [
              //           customText("Calcium", 12, FontWeight.w300),
              //           customText("7.01g", 12, FontWeight.w300),
              //         ],
              //       ),
              //       const SizedBox(height: 16),
              //       customButton1("Learn to make", "", context),
              //     ],
              //   ),
              // ),
            ],
          )),
    );
  }
}
