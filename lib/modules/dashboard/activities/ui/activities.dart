import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/date_day.dart';
import 'package:nityahealth/common/fitness_container.dart';
import 'package:nityahealth/common/food_container.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  int selected = 4;
  Widget customDateRadio(String day, int date, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 8,
        width: MediaQuery.of(context).size.width / 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (selected == index) ? primaryColor : accent2Color,
            boxShadow: [
              BoxShadow(
                color: (selected == index)
                    ? primaryColor.withOpacity(0.5)
                    : Colors.transparent,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: GoogleFonts.comfortaa(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: (selected == index) ? accent2Color : accent3Color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              date.toString(),
              style: GoogleFonts.comfortaa(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: (selected == index) ? accent2Color : accent3Color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customDayRadio(String day, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 9,
        width: MediaQuery.of(context).size.width / 9,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: (selected == index)
                  ? AppColor.primaryColor
                  : AppColor.accent1Color,
            ),
            borderRadius: BorderRadius.circular(50),
            color: AppColor.accent2Color,
            boxShadow: [
              BoxShadow(
                color: (selected == index)
                    ? primaryColor.withOpacity(0.5)
                    : Colors.transparent,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: GoogleFonts.comfortaa(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color:
                    (selected >= index) ? AppColor.primaryColor : accent3Color,
              ),
            ),
          ],
        ),
      ),
    );
  }

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
          "My Activities",
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
              customText("Fitness for today", 18, FontWeight.w700),
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
              const SizedBox(height: 20),
              customText("Diet for today", 18, FontWeight.w700),
              const SizedBox(height: 16),
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
    );
  }
}
