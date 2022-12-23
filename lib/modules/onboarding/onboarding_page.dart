import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/onboarding/onboarding1.dart';
import 'package:nityahealth/modules/onboarding/onboarding2.dart';
import 'package:nityahealth/modules/onboarding/onboarding3.dart';
import 'package:nityahealth/modules/onboarding/onboarding4.dart';
import 'package:nityahealth/modules/authentication/ui/login_option.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingPage extends StatelessWidget {
  final PageController _controller = PageController();
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

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
                    Get.to(const LoginOption());
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
                  onPressed: () {
                    _controller.nextPage(duration: _kDuration, curve: _kCurve);
                  },
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
          ),
        ],
      ),
    );
  }
}
