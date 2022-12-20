import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/welcomepages/sign_in_pages/sign_in.dart';

class OnBoarding4 extends StatelessWidget {
  const OnBoarding4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        // height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height / 1.2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Align(
                    // alignment: Alignment.center,
                    child: Image.asset(
                      "images/boarding/boarding4.png",
                      height: 425,
                    ),
                  ),
                  const SizedBox(height: 0),
                  Text(
                    "Get food Plan\nfrom Experts",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.comfortaa(
                      color: accent2Color,
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(const SignIn());
              },
              child: Container(
                alignment: Alignment.center,
                height: 30,
                width: 180,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: secondaryColor,
                      offset: Offset(0, 0),
                      blurRadius: 5,
                      spreadRadius: 1,
                    ),
                  ],
                ),
                child: Text(
                  "Proceed to Login",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.comfortaa(
                    color: accent2Color,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
