import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding_page.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                // alignment: Alignment.center,
                child: Image.asset(
                  "images/Vector.png",
                  width: 150,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Welcome to",
                style: GoogleFonts.comfortaa(
                  color: accent2Color,
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Nitya Health",
                style: GoogleFonts.roboto(
                  color: accent2Color,
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        child: InkWell(
          onTap: () {
            Get.to(OnBoardingPage());
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Text(
                "Get Started",
                style: GoogleFonts.comfortaa(
                  color: accent2Color,
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const Icon(
                Icons.keyboard_arrow_right,
                color: accent2Color,
                size: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}
