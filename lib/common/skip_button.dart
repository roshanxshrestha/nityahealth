import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/modules/dashboard/ui/dashboard.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

//skip widget with dialog
class Skip extends StatelessWidget {
  const Skip({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          title: Text(
            'Are you sure you want to skip login?',
            style: GoogleFonts.comfortaa(
              fontSize: 18,
              color: accent1Color,
              fontWeight: FontWeight.w700,
            ),
          ),
          content: Text(
            'Sign in to get the most out of us.',
            style: GoogleFonts.comfortaa(
              fontSize: 14,
              color: accent1Color,
              fontWeight: FontWeight.w400,
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: Text(
                'Cancel',
                style: GoogleFonts.comfortaa(
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                Get.to(() => Dashboard());
              },
              child: Text(
                'Continue',
                style: GoogleFonts.comfortaa(
                  fontSize: 18,
                  color: primaryColor,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
      child: Text(
        'Skip',
        style: GoogleFonts.comfortaa(
          color: primaryColor,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
