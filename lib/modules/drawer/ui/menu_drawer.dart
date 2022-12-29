import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/profile/ui/user_profile_details.dart';

class MenuDrawer extends StatelessWidget {
  const MenuDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              "Falano",
              style: GoogleFonts.comfortaa(
                fontSize: 18,
                color: accent2Color,
                fontWeight: FontWeight.w700,
              ),
            ),
            accountEmail: Text(
              "Kathmandu, Nepal",
              style: GoogleFonts.comfortaa(
                fontSize: 14,
                color: accent2Color,
                fontWeight: FontWeight.w700,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              child: GestureDetector(
                onTap: () {
                  Get.to(() => const UserProfileDetails());
                },
                child: ClipOval(
                  child: Image.asset("assets/images/profile/user/profile.jpeg"),
                ),
              ),
            ),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          ListTile(
            title: textF16W700L("Profile", "userprofiledetails", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("My Appointment", "", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("Doctors", "doctors", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("Fitness", "wellness", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("Diet", "dietplan", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("Yoga", "yogaactivities", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("My Reports", "", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("My Accounts", "userprofilesetting", context),
          ),
          const Divider(color: accent4Color),
        ],
      ),
    );
  }
}
