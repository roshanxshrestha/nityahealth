import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        // width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              // alignment: Alignment.center,
              child: Image.asset(
                "images/boarding2.png",
                height: 425,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Get fitness class\nfrom Professionals",
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
