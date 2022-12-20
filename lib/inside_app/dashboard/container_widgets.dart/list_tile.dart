import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';

class TileItems extends StatelessWidget {
  final String tileTitle;
  final bool isSelected;
  final VoidCallback onTap;

  const TileItems({
    super.key,
    required this.tileTitle,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10),
        child: Container(
          height: 40,
          width: 145,
          decoration: BoxDecoration(
            color: isSelected ? primaryColor : accent2Color,
            border: Border.all(
              color: primaryColor,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              tileTitle,
              style: GoogleFonts.comfortaa(
                fontSize: 16,
                color: isSelected ? accent2Color : accent3Color,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
