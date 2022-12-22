import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/inside_app/dashboard/container_widgets.dart/grid_container.dart';

class Consultant extends StatefulWidget {
  const Consultant({super.key});

  @override
  State<Consultant> createState() => _ConsultantState();
}

class _ConsultantState extends State<Consultant> {
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
          "Consultants",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: GridView(
          shrinkWrap: true,
          padding: const EdgeInsets.only(left: 8, right: 8, top: 8),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          children: const [
            GridItems(
              imagepath: "images/consultant/doctor.png",
              title: "Doctors",
              routeName: "",
            ),
            GridItems(
              imagepath: "images/consultant/trainer.png",
              title: "trainers",
              routeName: "trainers",
            ),
            GridItems(
              imagepath: "images/consultant/yoga.png",
              title: "Yoga Instructor",
              routeName: "",
            ),
            GridItems(
              imagepath: "images/consultant/gym.png",
              title: "Gym Instructor",
              routeName: "",
            ),
            GridItems(
              imagepath: "images/consultant/nurse.png",
              title: "Nurses",
              routeName: "",
            ),
            GridItems(
              imagepath: "images/consultant/watch.png",
              title: "Dietition",
              routeName: "",
            ),
          ],
        ),
      ),
    );
  }
}
