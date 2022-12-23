import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              // alignment: Alignment.center,
              child: Image.asset(
                "assets/images/boarding/boarding1.png",
                height: 425,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Talk to our\nDoctors",
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
    );
  }
}
