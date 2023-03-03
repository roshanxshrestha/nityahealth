import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

// or divider
Widget orDivider() {
  return Row(
    children: [
      const Expanded(
        child: Divider(color: accent4Color),
      ),
      Text(
        " Or continue with ",
        style: GoogleFonts.comfortaa(
          fontSize: 14,
          color: accent3Color,
          fontWeight: FontWeight.w400,
        ),
      ),
      const Expanded(
        child: Divider(color: accent4Color),
      ),
    ],
  );
}
