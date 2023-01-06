import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/or_divider.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/settings.dart/user_profile_setting.dart';

class DietPlan extends StatefulWidget {
  const DietPlan({super.key});

  @override
  State<DietPlan> createState() => _DietPlanState();
}

class _DietPlanState extends State<DietPlan> {
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
          "Diet Plan",
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
                Get.to(() => const UserProfileSetting());
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
      body: Scaffold(
        body: Align(
          alignment: Alignment.center,
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width / 1.1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 16),
                Text(
                  "You want to",
                  style: GoogleFonts.comfortaa(
                      fontSize: 18, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 16),
                customButton1("Gain Weight", "foodlist", context),
                const SizedBox(height: 8),
                customButton1("Loose Weight", "foodlist", context),
                const SizedBox(height: 8),
                customButton1("Maintain Weight", "foodlist", context),
                const SizedBox(height: 8),
                orDivider(),
                const SizedBox(height: 8),
                customButton1("Calculate your BMI", "bmicalc", context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
