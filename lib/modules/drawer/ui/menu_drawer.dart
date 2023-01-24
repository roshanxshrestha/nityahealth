import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';

import '../../../utils/pref_manager.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  var name = "";

  getName() async {
    setState(() async {
      name = await PrefManager.getName();
    });
  }

  @override
  void initState() {
    getName();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(
              name,
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
            currentAccountPicture: const CircleAvatar(
              backgroundImage:
                  AssetImage("assets/images/profile/user/profile.jpeg"),
            ),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
          ),
          Column(
            children: [
              dashboardItems(context, "Profile", "userprofiledetails"),
              dashboardItems(context, "My Appointment", "doctorappointment"),
              dashboardItems(context, "Doctors", "doctors"),
              dashboardItems(context, "Fitness", "fitness"),
              dashboardItems(context, "Diet", "dietplan"),
              dashboardItems(context, "Yoga", "yogaactivities"),
              dashboardItems(context, "My Reports", ""),
              dashboardItems(context, "My Accounts", "userprofilesetting"),
            ],
          ),
        ],
      ),
    );
  }
}

Widget dashboardItems(BuildContext context, String title, String routeName) {
  return GestureDetector(
    onTap: () {
      Get.toNamed(routeName);
    },
    child: Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(color: AppColor.accent1Color),
        ),
      ),
      width: MediaQuery.of(context).size.width,
      height: 60,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16),
            child: textF16W700(title),
          ),
        ],
      ),
    ),
  );
}
