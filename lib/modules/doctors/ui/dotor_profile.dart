import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/ratings.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class DoctorProfile extends StatelessWidget {
  const DoctorProfile({super.key});

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
          "Dr. Falano",
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
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 3,
                  width: MediaQuery.of(context).size.width,
                  child: Image.asset(
                    "assets/images/doctors/doctorfalano.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  bottom: 8,
                  left: MediaQuery.of(context).size.width / 5,
                  child: Row(
                    children: [
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.phone,
                          size: 16,
                          color: accent2Color,
                        ),
                        label: Text(
                          "Audio call",
                          style: GoogleFonts.comfortaa(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor),
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width / 10),
                      ElevatedButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          MdiIcons.video,
                          size: 16,
                          color: accent2Color,
                        ),
                        label: Text(
                          "Video call",
                          style: GoogleFonts.comfortaa(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: primaryColor),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  docInfo("Dr. Falano", MdiIcons.doctor, 18, FontWeight.w700),
                  docInfo("Medicine and Heart Specialist", Icons.type_specimen,
                      16, FontWeight.w300),
                  docInfo("MBBS, MD", Icons.school, 12, FontWeight.w300),
                  docInfo("Good Health Clinic", MdiIcons.hospital, 12,
                      FontWeight.w300),
                  Padding(
                    padding: const EdgeInsets.only(left: 16),
                    child: ratings(4),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    textF16W700("About Falano"),
                    const SizedBox(height: 8),
                    textF14W300(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean neque, hendrerit velit, vitae cursus diam vel nunc, eget. Varius rutrum tempor pellentesque et, quam fermentum ac nunc at. Diam porta tellus faucibus mauris, consequat placerat fringilla. "),
                    const SizedBox(height: 16),
                    textF16W700("Patients"),
                    const SizedBox(height: 8),
                    textF14W300(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean neque, hendrerit velit, vitae cursus diam vel nunc, eget. "),
                    const SizedBox(height: 16),
                    textF16W700("Experience"),
                    const SizedBox(height: 8),
                    textF14W300(
                        "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean neque, hendrerit velit, vitae cursus diam vel nunc, eget. "),
                    const SizedBox(height: 16),
                    customButton1(
                        "Get an Appointment", "doctorappointment", context),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget docInfo(
    String title, IconData icon, double fontSize, FontWeight weight) {
  return Row(
    children: [
      IconButton(
        onPressed: () {},
        icon: Icon(
          icon,
          size: 16,
        ),
      ),
      Text(
        title,
        style: GoogleFonts.comfortaa(
          fontSize: fontSize,
          fontWeight: weight,
        ),
      ),
    ],
  );
}
