import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/inside_app/dashboard/container_widgets.dart/grid_container.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // floating: true,
        foregroundColor: primaryColor,
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
        leading: GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.menu,
            color: accent2Color,
            size: 25,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {},
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
              onTap: () {},
              child: const Icon(
                Icons.person,
                size: 25,
                color: accent2Color,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
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
                              "Falano,",
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
              GridView(
                shrinkWrap: true,
                padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                children: const [
                  GridItems(
                    imagepath: "images/dashboard/Wellness.png",
                    title: "Wellness",
                  ),
                  GridItems(
                    imagepath: "images/dashboard/consultants.png",
                    title: "Consultants",
                  ),
                  GridItems(
                    imagepath: "images/dashboard/healthtopics.png",
                    title: "Health Topics",
                  ),
                  GridItems(
                    imagepath: "images/dashboard/news.png",
                    title: "News/Articles",
                  ),
                  GridItems(
                    imagepath: "images/dashboard/activities.png",
                    title: "Activities",
                  ),
                  GridItems(
                    imagepath: "images/dashboard/profile.png",
                    title: "Profile",
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
