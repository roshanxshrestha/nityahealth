//text
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

Widget textF16W700(String title) {
  return Text(
    title,
    style: GoogleFonts.comfortaa(
        fontSize: 16, fontWeight: FontWeight.w700, color: accent3Color),
    overflow: TextOverflow.visible,
    textAlign: TextAlign.center,
  );
}

//text

Widget textF16W700L(String title, String routeName, BuildContext context) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Text(
      title,
      style: GoogleFonts.comfortaa(
          fontSize: 16, fontWeight: FontWeight.w700, color: accent3Color),
    ),
  );
}
