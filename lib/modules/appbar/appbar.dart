import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/settings.dart/user_profile_setting.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(15),
            ),
          ),
          foregroundColor: accent2Color,
          shadowColor: Colors.transparent,
          backgroundColor: primaryColor,
          title: Text(
            "Notifications",
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
      ),
    );
  }
}
