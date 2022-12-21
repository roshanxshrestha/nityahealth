import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/inside_app/dashboard/container_widgets.dart/dash_widgets.dart';
import 'package:nityahealth/inside_app/dashboard/dashboard_items/appbar_items/menu_items/menu_drawer.dart';

class UserProfileSetting extends StatefulWidget {
  const UserProfileSetting({super.key});

  @override
  State<UserProfileSetting> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileSetting> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
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
          "Mrs. Falano",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => const UserProfileSetting());
              },
              child: const Icon(
                Icons.account_circle,
                size: 25,
                color: accent2Color,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  textF16W700("User"),
                  const SizedBox(height: 10),
                  button1(
                      "Profile", (Icons.person), "userprofiledetails", context),
                  const SizedBox(height: 26),
                  textF16W700("General Setting"),
                  const SizedBox(height: 10),
                  button1("Sound Options", (Icons.mic), "", context),
                  button1("Workout Reminder", (Icons.access_time), "", context),
                  button1("Workout class notification", (Icons.notifications),
                      "", context),
                  button1("Security", (Icons.security), "", context),
                  button1("About", (Icons.bookmark), "", context),
                  button1("Help", (Icons.help), "", context),
                  const SizedBox(height: 26),
                  textF16W700("Support Us"),
                  const SizedBox(height: 10),
                  button1("Rate Us", (Icons.star), "", context),
                  button1("Share with Friends", (Icons.share), "", context),
                  button1("Privacy Policy", (Icons.policy), "", context),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
