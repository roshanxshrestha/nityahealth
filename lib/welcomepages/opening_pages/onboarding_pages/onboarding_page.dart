import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding1.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding2.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding3.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding4.dart';
import 'package:nityahealth/welcomepages/sign_in_pages/sign_in.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  final _controller = PageController();

  OnBoardingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 1.1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: PageView(
                    controller: _controller,
                    children: const [
                      OnBoarding1(),
                      OnBoarding2(),
                      OnBoarding3(),
                      OnBoarding4(),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width / 1.1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    Get.to(const SignIn());
                  },
                  child: Text(
                    "Skip",
                    style: GoogleFonts.comfortaa(
                      color: accent2Color,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                SmoothPageIndicator(
                  controller: _controller,
                  count: 4,
                  effect: const SwapEffect(
                    activeDotColor: accent4Color,
                    dotColor: accent2Color,
                    dotHeight: 15,
                    dotWidth: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Next",
                    style: GoogleFonts.comfortaa(
                      color: accent2Color,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
