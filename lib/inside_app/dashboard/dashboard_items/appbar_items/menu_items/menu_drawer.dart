import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/inside_app/dashboard/container_widgets.dart/dash_widgets.dart';
import 'package:nityahealth/inside_app/dashboard/dashboard_items/appbar_items/user_profile/user_profile_details.dart';

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
                  child: Image.asset("images/profile/user/profile.jpeg"),
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
            title: textF16W700L("Doctors", "", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("Fitness", "", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("Food", "", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("Yoga", "", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("My Reports", "", context),
          ),
          const Divider(color: accent4Color),
          ListTile(
            title: textF16W700L("My Accounts", "", context),
          ),
          const Divider(color: accent4Color),
        ],
      ),
    );
  }
}
