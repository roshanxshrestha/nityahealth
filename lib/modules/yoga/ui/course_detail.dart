import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_appbar.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class CourseDetail extends StatelessWidget {
  const CourseDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Course Details"),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              "assets/images/fitness/coreyoga.png",
              height: MediaQuery.of(context).size.height / 2.5,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: customText("Core Yoga", 24, FontWeight.w700),
                  ),
                  const SizedBox(height: 16),
                  customText("Choose your level", 18, FontWeight.w400),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      levelButton("Beginner", "exerciselist", context),
                      levelButton("Intermediate", "exerciselist", context),
                      levelButton("Professional", "exerciselist", context),
                    ],
                  ),
                  const SizedBox(height: 8),
                  customText(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Natoque nibh suscipit massa arcu magna. In diam faucibus cursus convallis velit, posuere. Urna diam montes, cursus mollis rhoncus rhoncus. Volutpat eget ultrices purus dictumst at sit fermentum id. Viverra leo ipsum purus maecenas. Condimentum nibh natoque mi mattis amet, a, id. Purus sed ullamcorper..",
                      16,
                      FontWeight.w300),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget levelButton(String title, String routeName, BuildContext context) {
  return GestureDetector(
    onTap: () {
      // Navigator.pushNamed(context, routeName);
      Get.toNamed(routeName);
    },
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width / 3.5,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: primaryColor,
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: Text(
        title,
        style: GoogleFonts.comfortaa(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
