import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/doctors/ui/dotor_profile.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';

class FindDoctors extends StatelessWidget {
  const FindDoctors({super.key});

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
          "Doctors",
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textF16W700("Find your desired doctor"),
              const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search Doctors',
                ),
              ),
              const SizedBox(height: 16),
              textF16W700("Categories"),
              const SizedBox(height: 10),
              SizedBox(
                height: 137,
                child: Expanded(
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      doctorCategories("Eye Specialist",
                          "assets/images/doctors/eye.png", "", context),
                      const SizedBox(width: 16),
                      doctorCategories(
                          "Dental Surgeon",
                          "assets/images/doctors/dental.png",
                          "dentaldoctors",
                          context),
                      const SizedBox(width: 16),
                      doctorCategories("Heart Surgeon",
                          "assets/images/doctors/heart.png", "", context),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  textF16W700("Top Doctors"),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "View all",
                      style: GoogleFonts.comfortaa(
                        fontWeight: FontWeight.w700,
                        fontSize: 12,
                        color: accent3Color,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 450,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      topDoctorsList(
                        "Dr. Stella Kane",
                        "Heart Surgeon - Flowers Hospital",
                        "assets/images/doctors/Stella.png",
                      ),
                      const SizedBox(height: 8),
                      topDoctorsList(
                        "Dr. Joseph Cart",
                        "Heart Surgeon - Flowers Hospital",
                        "assets/images/doctors/Joseph.png",
                      ),
                      const SizedBox(height: 8),
                      topDoctorsList(
                        "Dr. Stefani Albert",
                        "Heart Surgeon - Flowers Hospital",
                        "assets/images/doctors/Stefani.png",
                      ),
                      topDoctorsList(
                        "Dr. Stella Kane",
                        "Heart Surgeon - Flowers Hospital",
                        "assets/images/doctors/Stella.png",
                      ),
                      const SizedBox(height: 8),
                      topDoctorsList(
                        "Dr. Joseph Cart",
                        "Heart Surgeon - Flowers Hospital",
                        "assets/images/doctors/Joseph.png",
                      ),
                      const SizedBox(height: 8),
                      topDoctorsList(
                        "Dr. Stefani Albert",
                        "Heart Surgeon - Flowers Hospital",
                        "assets/images/doctors/Stefani.png",
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

//categories
Widget doctorCategories(
    String title, String imageurl, String routeName, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Container(
      // width: MediaQuery.of(context).size.width / 3,
      width: 108,
      decoration: BoxDecoration(
        color: accent2Color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: accent5Color, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageurl),
            const SizedBox(height: 5),
            textF16W700(title),
          ],
        ),
      ),
    ),
  );
}

//top doctors list
Widget topDoctorsList(String name, String info, String imageurl) {
  return GestureDetector(
    onTap: () {
      Get.to(() => const DoctorProfile());
    },
    child: Container(
      padding: const EdgeInsets.only(left: 23, right: 23),
      height: 87,
      decoration: BoxDecoration(
        color: accent2Color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: accent5Color, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Row(
        // mainAxisAlignment: MainAxisAlignment.space,
        children: [
          Image.asset(imageurl),
          const SizedBox(width: 16),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              textF16W700(name),
              const SizedBox(height: 10),
              Text(
                info,
                style: GoogleFonts.comfortaa(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              )
            ],
          ),
        ],
      ),
    ),
  );
}
