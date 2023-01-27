import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/authentication/ui/login_option.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/common/profile_setting_buttons.dart';

class UserProfileSetting extends StatefulWidget {
  const UserProfileSetting({super.key});

  @override
  State<UserProfileSetting> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfileSetting> {
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
          "Settings",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
        // actions: [
        //   Padding(
        //     padding: const EdgeInsets.only(right: 20.0),
        //     child: GestureDetector(
        //       onTap: () {
        //         Get.to(() => const UserProfileSetting());
        //       },
        //       child: const Icon(
        //         Icons.account_circle,
        //         size: 25,
        //         color: accent2Color,
        //       ),
        //     ),
        //   ),
        // ],
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
                  button1("Profile", (Icons.person_outline),
                      "userprofiledetails", context),
                  const SizedBox(height: 26),
                  textF16W700("General Setting"),
                  const SizedBox(height: 10),
                  button1("Sound Options", (Icons.mic_none), "", context),
                  button1("Workout Reminder", (Icons.access_time), "", context),
                  button1(
                      "Notifications", (Icons.notifications_none), "", context),
                  button1("Security", (Icons.security_outlined), "", context),
                  button1("About", (Icons.info_outline), "", context),
                  button1("Help", (Icons.help_outline), "", context),
                  const SizedBox(height: 26),
                  textF16W700("Support Us"),
                  const SizedBox(height: 10),
                  button1("Rate Us", (Icons.star_border_outlined), "", context),
                  button1("Share with Friends", (Icons.share), "", context),
                  button1(
                      "Privacy Policy", (Icons.policy_outlined), "", context),
                  const SizedBox(height: 26),
                  textF16W700("Logins"),
                  const SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Get.offAll(() => const LoginOption());
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: const BoxDecoration(
                        color: accent5Color,
                        border: Border(
                          bottom: BorderSide(width: 1, color: Colors.black12),
                        ),
                      ),
                      padding: const EdgeInsets.only(right: 20, left: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          TextButton.icon(
                            onPressed: (() {
                              Get.offAll(() => const LoginOption());
                            }),
                            icon: const Icon(
                              Icons.logout,
                              color: primaryColor,
                              size: 20,
                            ),
                            label: Text(
                              "Log Out",
                              style: GoogleFonts.comfortaa(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: accent3Color,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
