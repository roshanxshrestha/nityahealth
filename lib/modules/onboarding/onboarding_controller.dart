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

class OnBoardingPage extends StatefulWidget {
  static const _kDuration = Duration(milliseconds: 300);
  static const _kCurve = Curves.ease;

  const OnBoardingPage({super.key});

  @override
  State<OnBoardingPage> createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final PageController _controller = PageController();
  bool isLastPage = false;

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
                    onPageChanged: (index) {
                      setState(() {
                        isLastPage = index == 3;
                      });
                    },
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
            child: isLastPage
                ? TextButton(
                    onPressed: () {
                      Get.offAll(const LoginOption());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Proceed to Login",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.comfortaa(
                            color: accent2Color,
                            fontSize: 18,
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
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.offAll(const LoginOption());
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
                          _controller.nextPage(
                              duration: OnBoardingPage._kDuration,
                              curve: OnBoardingPage._kCurve);
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
