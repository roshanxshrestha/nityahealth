import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class GridItems extends StatelessWidget {
  final String imagepath;
  final String title;
  final String routeName;

  const GridItems(
      {super.key,
      required this.imagepath,
      required this.title,
      required this.routeName});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 175,
          width: 175,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: secondaryColor,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 88,
                width: 88,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  imagepath,
                  height: 50,
                  width: 50,
                  alignment: Alignment.center,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                title,
                style: GoogleFonts.comfortaa(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: accent3Color),
              )
            ],
          ),
        ),
      ),
    );
  }
}
