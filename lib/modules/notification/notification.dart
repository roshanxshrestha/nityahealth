import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/settings.dart/user_profile_setting.dart';

class NotificationUser extends StatefulWidget {
  const NotificationUser({super.key});

  @override
  State<NotificationUser> createState() => _NotificationUserState();
}

class _NotificationUserState extends State<NotificationUser> {
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
      body: Container(
        padding: const EdgeInsets.all(16),
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView(
            children: [
              customText(
                  "New Yoga class has been updated", 16, FontWeight.w700),
              const Divider(color: accent4Color),
              customText("Time for Workout", 16, FontWeight.w700),
              const Divider(color: accent4Color),
              customText("Less than 24 hours left for doctors appointment", 16,
                  FontWeight.w700),
              const Divider(color: accent4Color),
              customText("New Diet Plan is updated", 16, FontWeight.w700),
              const Divider(color: accent4Color),
              customText(
                  "Please Update your Phone number", 16, FontWeight.w700),
              const Divider(color: accent4Color),
              customText(
                  "Your Gym class has just started", 16, FontWeight.w700),
              const Divider(color: accent4Color),
            ],
          ),
        ),
      ),
    );
  }
}
