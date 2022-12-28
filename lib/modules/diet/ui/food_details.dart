import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/profile/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class FoodDetails extends StatelessWidget {
  const FoodDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        foregroundColor: accent2Color,
        shadowColor: Colors.transparent,
        backgroundColor: primaryColor,
        title: Text(
          "Food",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const UserProfileDetails());
              },
              child: const Icon(
                Icons.account_circle,
                size: 25,
                color: accent2Color,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            "assets/images/food/food1.png",
            height: MediaQuery.of(context).size.height / 3,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                customText("Balanced Diet For All", 18, FontWeight.w700),
                const SizedBox(height: 16),
                customText("Macros for Serving", 13, FontWeight.w400),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        customText("kcal", 12, FontWeight.w400),
                        const SizedBox(height: 10),
                        customText("313 kcal", 12, FontWeight.w300),
                      ],
                    ),
                    Column(
                      children: [
                        customText("Protein", 12, FontWeight.w400),
                        const SizedBox(height: 10),
                        customText("313 kcal", 12, FontWeight.w300),
                      ],
                    ),
                    Column(
                      children: [
                        customText("Carb", 12, FontWeight.w400),
                        const SizedBox(height: 10),
                        customText("313 kcal", 12, FontWeight.w300),
                      ],
                    ),
                    Column(
                      children: [
                        customText("Fat", 12, FontWeight.w400),
                        const SizedBox(height: 10),
                        customText("313 kcal", 12, FontWeight.w300),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Preparation Time", 16, FontWeight.w300),
                    customText("65 mins", 16, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("1 Serving", 16, FontWeight.w300),
                    customText("482 g", 16, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 16),
                customText("Other Nutrients", 16, FontWeight.w400),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Fat Saturated", 12, FontWeight.w300),
                    customText("2.01 g", 12, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Fat Trans", 12, FontWeight.w300),
                    customText("0 g", 12, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Fat MonoSaturated", 12, FontWeight.w300),
                    customText("9.01 g", 12, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Sugar", 12, FontWeight.w300),
                    customText("5.01 g", 12, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Fiber", 12, FontWeight.w300),
                    customText("10 g", 12, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Cholestrol", 12, FontWeight.w300),
                    customText("0 g", 12, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Sodium", 12, FontWeight.w300),
                    customText("201.64 mg", 12, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Calcium", 12, FontWeight.w300),
                    customText("162.03 mg", 12, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    customText("Calcium", 12, FontWeight.w300),
                    customText("7.01g", 12, FontWeight.w300),
                  ],
                ),
                const SizedBox(height: 16),
                customButton1("Learn to make", "", context),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
