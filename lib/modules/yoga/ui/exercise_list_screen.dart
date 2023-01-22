import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/modules/yoga/ui/yoga_singlepost.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class ExerciseList extends StatelessWidget {
  const ExerciseList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          "Exercises",
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
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Image.asset(
                  "assets/images/fitness/yoga3.png",
                  height: MediaQuery.of(context).size.height / 2.5,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 0,
                  child: Container(
                    padding: const EdgeInsets.all(34.0),
                    height: MediaQuery.of(context).size.height / 7,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.transparent,
                      boxShadow: [
                        BoxShadow(
                          color: AppColor.accent3Color.withOpacity(0.35),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, -5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Core Yoga",
                          style: GoogleFonts.comfortaa(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: AppColor.accent2Color,
                          ),
                        ),
                        const SizedBox(height: 24),
                        Row(
                          children: [
                            Row(
                              children: [
                                Icon(
                                  MdiIcons.clockOutline,
                                  color: AppColor.accent2Color.withOpacity(0.7),
                                  size: 18,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "05:30 minutes",
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.accent2Color,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                width: MediaQuery.of(context).size.width / 5),
                            Row(
                              children: [
                                const Icon(
                                  MdiIcons.flash,
                                  color: AppColor.accent2Color,
                                  size: 18,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  "13 exercises",
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w700,
                                    color: AppColor.accent2Color,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  exerciseList(
                      "Easy Pose",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Natoque nibh suscipit massa arcu magna.",
                      "assets/images/fitness/coreyoga.png",
                      context),
                  const SizedBox(height: 10),
                  exerciseList(
                      "Forward Bend",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Natoque nibh suscipit massa arcu magna.",
                      "assets/images/fitness/yoga4.png",
                      context),
                  const SizedBox(height: 10),
                  exerciseList(
                      "Warrior Pose",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Natoque nibh suscipit massa arcu magna.",
                      "assets/images/fitness/yoga5.png",
                      context),
                  const SizedBox(height: 10),
                  exerciseList(
                      "Forearm Plank",
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Natoque nibh suscipit massa arcu magna.",
                      "assets/images/fitness/yoga6.png",
                      context),
                  const SizedBox(height: 16),
                  customButton1("Start", "exercisetimer", context),
                  const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

//Exercise list
Widget exerciseList(
    String title, String description, String imagePath, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Get.to(() => YogaSinglePost());
    },
    child: Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: AppColor.accent2Color,
        boxShadow: [
          BoxShadow(
            color: AppColor.accent4Color.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 5,
            offset: const Offset(3, 3),
          ),
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                bottomLeft: Radius.circular(10),
              ),
            ),
          ),
          const SizedBox(width: 5),
          const VerticalDivider(
            thickness: 1,
            color: AppColor.accent1Color,
            endIndent: 10,
            indent: 10,
          ),
          const SizedBox(width: 5),
          SizedBox(
            height: 100,
            width: MediaQuery.of(context).size.width / 1.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                customText(title, 18, FontWeight.w300),
                const SizedBox(height: 16),
                Text(
                  description,
                  maxLines: 2,
                  style: GoogleFonts.comfortaa(
                      fontSize: 14, fontWeight: FontWeight.w300),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
          const Icon(
            Icons.keyboard_arrow_right,
            size: 30,
            color: AppColor.accent1Color,
          )
        ],
      ),
    ),
  );
}
