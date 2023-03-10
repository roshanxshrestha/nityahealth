//text
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

Widget textF16W700(String title) {
  return Text(
    title,
    style: GoogleFonts.comfortaa(fontSize: 16, fontWeight: FontWeight.w700),
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center,
  );
}

Widget textF14W300(String title) {
  return Text(
    title,
    style: GoogleFonts.comfortaa(
      fontSize: 14,
      fontWeight: FontWeight.w300,
      color: accent3Color,
      height: 1.2,
    ),
    overflow: TextOverflow.visible,
    textAlign: TextAlign.justify,
  );
}

Widget customText(String title, double fontSize, fontWeight) {
  return Text(
    title,
    style: GoogleFonts.comfortaa(
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: accent3Color,
      height: 1.2,
    ),
    overflow: TextOverflow.ellipsis,
    textAlign: TextAlign.justify,
  );
}

//text

Widget textF16W700L(String title, String routeName, BuildContext context) {
  return MouseRegion(
    cursor: SystemMouseCursors.click,
    child: GestureDetector(
      onTap: () {
        Get.toNamed(routeName);
      },
      child: Text(
        title,
        style: GoogleFonts.comfortaa(
            fontSize: 16, fontWeight: FontWeight.w700, color: accent3Color),
      ),
    ),
  );
}
