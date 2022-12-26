import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/common/profile_setting_buttons.dart';

class HealthTopics extends StatefulWidget {
  const HealthTopics({super.key});

  @override
  State<HealthTopics> createState() => _HealthTopicsState();
}

class _HealthTopicsState extends State<HealthTopics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(15),
          ),
        ),
        foregroundColor: accent2Color,
        shadowColor: Colors.transparent,
        backgroundColor: primaryColor,
        title: Text(
          "Health Topics",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          scrollDirection: Axis.vertical,
          children: [
            button3("Blindness", (Icons.bookmark), "", context),
            button3("Bone Cancer", (Icons.bookmark), "", context),
            button3("Breast Cancer", (Icons.bookmark), "", context),
            button3("Blood Cancer", (Icons.bookmark), "", context),
            button3("HIV/AIDS", (Icons.bookmark), "", context),
            button3("Back Pain", (Icons.bookmark), "", context),
            button3("Corona", (Icons.bookmark), "", context),
            button3("Eye Health", (Icons.bookmark), "", context),
            button3("Gastritis", (Icons.bookmark), "", context),
            button3("Oral Health", (Icons.bookmark), "", context),
            button3("Measles", (Icons.bookmark), "", context),
            button3("Pneumonia", (Icons.bookmark), "", context),
            button3("Rabies", (Icons.bookmark), "", context),
            button3("Skin", (Icons.bookmark), "", context),
          ],
        ),
      ),
    );
  }
}
