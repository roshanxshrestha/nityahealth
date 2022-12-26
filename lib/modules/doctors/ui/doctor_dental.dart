import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/profile/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';

class DentalDoctor extends StatelessWidget {
  const DentalDoctor({super.key});

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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // textF16W700("Find your desired doctor"),
              // const SizedBox(height: 8),
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
              textF16W700("Dental Surgeons"),
              const SizedBox(height: 10),

              const SizedBox(height: 16),

              SizedBox(
                height: 450,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: [
                      doctorsOverview(
                          "Dr. Stella Kane",
                          "Dental Surgeon",
                          "7 Years",
                          "87%",
                          "69 Patient Stories",
                          "assets/images/doctors/shruti.jpg",
                          "",
                          context)
                      // doctorsList(
                      //   "Dr. Stella Kane",
                      //   "Dental Surgeon",
                      //   "7 Years"
                      //       "assets/images/doctors/shruti.jpg",
                      //   context,
                      // ),
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
Widget doctorCategories(String title, String imageurl) {
  return GestureDetector(
    onTap: () {},
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
Widget doctorsOverview(
    String name,
    String info,
    String experience,
    String percentage,
    String history,
    String imageurl,
    String availability,
    BuildContext context) {
  return Container(
    padding: const EdgeInsets.only(left: 23, right: 23),
    height: 170,
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
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 5,
              width: MediaQuery.of(context).size.width / 5,
              child: Image.asset(
                imageurl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 8),
            SizedBox(
              height: 30,
              child: Column(
                children: [
                  Text(
                    "Next Available",
                    style: GoogleFonts.comfortaa(
                      fontSize: 13,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    availability,
                    style: GoogleFonts.comfortaa(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        const SizedBox(width: 16),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                textF16W700(name),
                SizedBox(width: MediaQuery.of(context).size.width / 5),
                Icon(
                  Icons.favorite_border,
                  size: 18,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Text(
              info,
              style: GoogleFonts.comfortaa(
                fontSize: 13,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 7),
            Text(
              experience,
              style: GoogleFonts.comfortaa(
                fontSize: 12,
                fontWeight: FontWeight.w300,
              ),
            ),
            const SizedBox(height: 6),
            Row(
              children: [
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: primaryColor,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  percentage,
                  style: GoogleFonts.comfortaa(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(width: 20),
                Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: primaryColor,
                  ),
                ),
                const SizedBox(width: 5),
                Text(
                  history,
                  style: GoogleFonts.comfortaa(
                    fontSize: 11,
                    fontWeight: FontWeight.w300,
                    color: primaryColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            GestureDetector(
              onTap: () {},
              child: Container(
                height: 34,
                width: 125,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: primaryColor,
                ),
                child: Center(
                  child: Text(
                    "Book Now",
                    style: GoogleFonts.comfortaa(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: accent2Color,
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ],
    ),
  );
}
