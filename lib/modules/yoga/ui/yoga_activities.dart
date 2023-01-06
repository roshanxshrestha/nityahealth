import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/date_day.dart';
import 'package:nityahealth/common/fitness_container.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class YogaActivities extends StatefulWidget {
  const YogaActivities({super.key});

  @override
  State<YogaActivities> createState() => _YogaActivitiesState();
}

class _YogaActivitiesState extends State<YogaActivities> {
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
          "Yoga",
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const DateDay(),
              const SizedBox(height: 20),
              customText("Yoga for today", 18, FontWeight.w700),
              const SizedBox(height: 16),
              SizedBox(
                height: 230,
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    fitnessContainer(
                      "Core Yoga",
                      "assets/images/fitness/yoga1.png",
                      "05:30 minutes",
                      "13 exercises",
                    ),
                    fitnessContainer(
                      "Dynamic Yoga",
                      "assets/images/fitness/yoga2.png",
                      "05:30 minutes",
                      "11 exercises",
                    ),
                    fitnessContainer(
                      "Gentle Yoga",
                      "assets/images/fitness/yoga1.png",
                      "05:30 minutes",
                      "11 exercises",
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              customText("Recommended", 18, FontWeight.w700),
              const SizedBox(height: 16),
              SizedBox(
                height: 230,
                child: ListView(
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  children: [
                    fitnessContainer(
                      "Gym Workout",
                      "assets/images/fitness/yoga1.png",
                      "1.5 hours",
                      "13 exercises",
                    ),
                    fitnessContainer(
                      "Weight Lifting",
                      "assets/images/fitness/yoga2.png",
                      "30 minutes",
                      "11 exercises",
                    ),
                    fitnessContainer(
                      "Running",
                      "assets/images/fitness/yoga1.png",
                      "1 hour",
                      "11 exercises",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
