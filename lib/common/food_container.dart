//food items list
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

Widget foodItems(
  String title,
  String imagePath,
  String time,
  String calories,
) {
  return Container(
    margin: const EdgeInsets.only(left: 0, right: 16),
    width: 160,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: AppColor.accent2Color,
      boxShadow: [
        BoxShadow(
            color: accent4Color.withOpacity(0.1),
            offset: const Offset(3, 3),
            blurRadius: 5,
            spreadRadius: 1),
      ],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 110,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
            ),
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: 40,
          child: Text(
            title,
            style: GoogleFonts.comfortaa(
              fontSize: 16,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 12, right: 12),
          child: Column(
            children: [
              Row(
                children: [
                  Icon(
                    MdiIcons.clockOutline,
                    color: AppColor.accent3Color.withOpacity(0.7),
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    time,
                    style: GoogleFonts.comfortaa(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Row(
                children: [
                  const Icon(
                    MdiIcons.flash,
                    color: AppColor.accent3Color,
                    size: 18,
                  ),
                  const SizedBox(width: 10),
                  Text(
                    calories,
                    style: GoogleFonts.comfortaa(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}
