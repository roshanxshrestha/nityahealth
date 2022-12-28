import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/diet/ui/food_details.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/profile/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

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
      body: Padding(
        padding: const EdgeInsets.only(left: 18, right: 16, bottom: 16),
        child: SingleChildScrollView(
          child: GestureDetector(
            onTap: () {
              Get.to(() => const FoodDetails());
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                textF16W700("Diet Plan For You"),
                const SizedBox(height: 10),
                SizedBox(
                  height: 230,
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: [
                      foodItems(
                        "Balanced Diet For You",
                        "assets/images/food/food1.png",
                        "05:30 minutes",
                        "1775 calories",
                      ),
                      foodItems(
                        "Balanced Diet For You",
                        "assets/images/food/food1.png",
                        "05:30 minutes",
                        "1775 calories",
                      ),
                      foodItems(
                        "Balanced Diet For You",
                        "assets/images/food/food1.png",
                        "05:30 minutes",
                        "1775 calories",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                textF16W700("Lunch Diet"),
                const SizedBox(height: 10),
                SizedBox(
                  height: 230,
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: [
                      foodItems(
                        "Balanced Diet For You",
                        "assets/images/food/food1.png",
                        "05:30 minutes",
                        "1775 calories",
                      ),
                      foodItems(
                        "Balanced Diet For You",
                        "assets/images/food/food1.png",
                        "05:30 minutes",
                        "1775 calories",
                      ),
                      foodItems(
                        "Balanced Diet For You",
                        "assets/images/food/food1.png",
                        "05:30 minutes",
                        "1775 calories",
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                textF16W700("Dinner Diet"),
                const SizedBox(height: 10),
                SizedBox(
                  height: 230,
                  child: ListView(
                    clipBehavior: Clip.none,
                    scrollDirection: Axis.horizontal,
                    children: [
                      foodItems(
                        "Balanced Diet For You",
                        "assets/images/food/food1.png",
                        "05:30 minutes",
                        "1775 calories",
                      ),
                      foodItems(
                        "Balanced Diet For You",
                        "assets/images/food/food1.png",
                        "05:30 minutes",
                        "1775 calories",
                      ),
                      foodItems(
                        "Balanced Diet For You",
                        "assets/images/food/food1.png",
                        "05:30 minutes",
                        "1775 calories",
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

//food items list
Widget foodItems(
  String title,
  String imagePath,
  String time,
  String calories,
) {
  return Container(
    margin: const EdgeInsets.only(left: 0, right: 16),
    width: 160,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColor.accent2Color,
      boxShadow: [
        BoxShadow(
            color: accent4Color.withOpacity(0.5),
            offset: const Offset(1, 1),
            blurRadius: 8,
            spreadRadius: 1)
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: Text(
            title,
            style: GoogleFonts.comfortaa(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    MdiIcons.clockOutline,
                    color: AppColor.accent3Color.withOpacity(0.7),
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    time,
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
                    calories,
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
  );
}
