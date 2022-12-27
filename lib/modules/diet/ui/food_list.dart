import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
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
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textF16W700("Diet Plan For You"),
              const SizedBox(height: 10),
              SizedBox(
                height: 220,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      Container(
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/food/food1.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 160,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor,
                        ),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: const DecorationImage(
                                  image: AssetImage(
                                      "assets/images/food/food1.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
