import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/controller/user_profile_controller.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import '../../../utils/pref_manager.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  var name = "Falano";
  var address = "Kathmandu";
  var imageController = "";

  getName() async {
    setState(() async {
      name = await PrefManager.getName();
    });
  }

  final _controller = Get.put(UserProfileController());

  @override
  void initState() {
    getName();
    imageController = _controller.userprofile.value.user?.image ??
        "assets/images/profile/user/profile.jpeg";
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
              address,
              style: GoogleFonts.comfortaa(
                fontSize: 14,
                color: accent2Color,
                fontWeight: FontWeight.w700,
              ),
            ),
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage(imageController),
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
              dashboardItems(context, "Food", "dietplan"),
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
