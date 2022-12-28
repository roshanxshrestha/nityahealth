import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/profile/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class MyActivities extends StatefulWidget {
  const MyActivities({super.key});

  @override
  State<MyActivities> createState() => _MyActivitiesState();
}

class _MyActivitiesState extends State<MyActivities> {
  int selected = 0;
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

  Widget customDayRadio(String day, int date, int index) {
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
            borderRadius: BorderRadius.circular(50),
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
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            customText("Welcome back,", 12, FontWeight.w700),
            const SizedBox(height: 5),
            customText("Falano", 18, FontWeight.w700),
            const SizedBox(height: 16),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: accent2Color,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.accent1Color.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 10,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customDateRadio("SUN", 22, 1),
                  customDateRadio("MON", 23, 2),
                  customDateRadio("TUE", 24, 3),
                  customDateRadio("WED", 25, 4),
                  customDateRadio("THU", 26, 5),
                  customDateRadio("FRI", 27, 6),
                  customDateRadio("SAT", 28, 7),
                ],
              ),
            ),
            const SizedBox(height: 35),
            customText("Week Goal", 18, FontWeight.w700),
            Container(
              height: 60,
              width: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: accent2Color,
                  boxShadow: [
                    BoxShadow(
                      color: AppColor.accent1Color.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 10,
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  customDayRadio("SUN", 22, 1),
                  customDayRadio("MON", 23, 2),
                  customDayRadio("TUE", 24, 3),
                  customDayRadio("WED", 25, 4),
                  customDayRadio("THU", 26, 5),
                  customDayRadio("FRI", 27, 6),
                  customDayRadio("SAT", 28, 7),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
