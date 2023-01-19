import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/common/grid_container.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/notification/notification.dart';

import '../../../utils/pref_manager.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
    return Scaffold(
      drawer: const MenuDrawer(),
      appBar: AppBar(
        // floating: true,
        foregroundColor: accent2Color,
        shadowColor: Colors.transparent,
        backgroundColor: primaryColor,
        title: Text(
          "Dashboard",
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
                Get.to(() => const NotificationUser());
              },
              child: const Icon(
                Icons.notifications,
                size: 25,
                color: accent2Color,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                Get.to(() => UserProfileDetails());
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
        physics: const NeverScrollableScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Stack(
            // mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height,
                child: GridView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.only(left: 8, right: 8, top: 140),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  children: const [
                    GridItems(
                      imagepath: "assets/images/dashboard/Wellness.png",
                      title: "Wellness",
                      routeName: "wellness",
                    ),
                    GridItems(
                      imagepath: "assets/images/dashboard/consultants.png",
                      title: "Consultants",
                      routeName: "consultant",
                    ),
                    GridItems(
                      imagepath: "assets/images/dashboard/healthtopics.png",
                      title: "Health Topics",
                      routeName: "healthtopics",
                    ),
                    GridItems(
                      imagepath: "assets/images/dashboard/news.png",
                      title: "News/Articles",
                      routeName: "news",
                    ),
                    GridItems(
                      imagepath: "assets/images/dashboard/activities.png",
                      title: "Activities",
                      routeName: "activities",
                    ),
                    GridItems(
                      imagepath: "assets/images/dashboard/profile.png",
                      title: "Profile",
                      routeName: "",
                    ),
                  ],
                ),
              ),
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(60),
                ),
                child: Container(
                  height: 130,
                  width: MediaQuery.of(context).size.width,
                  decoration: const BoxDecoration(
                    color: primaryColor,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Text(
                              "Hello ",
                              style: GoogleFonts.comfortaa(
                                fontSize: 18,
                                color: accent2Color,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                            Text(
                              "$name,",
                              style: GoogleFonts.comfortaa(
                                fontSize: 24,
                                color: accent2Color,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Row(
                          children: [
                            Text(
                              "Welcome to ",
                              style: GoogleFonts.comfortaa(
                                fontSize: 18,
                                color: accent2Color,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "NityaHealth",
                              style: GoogleFonts.comfortaa(
                                fontSize: 20,
                                color: accent2Color,
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
