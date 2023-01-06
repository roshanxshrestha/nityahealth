import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/food_container.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/diet/ui/food_details.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class FoodList extends StatelessWidget {
  const FoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
      // appBar: PreferredSize(preferredSize: const Size.fromWidth(200),child: Container(),),
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
                Get.to(() => UserProfileDetails());
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
