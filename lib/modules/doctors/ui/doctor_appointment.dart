import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/custom_text_field.dart';
import 'package:nityahealth/common/ratings.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/profile/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class DoctorAppointment extends StatefulWidget {
  const DoctorAppointment({super.key});

  @override
  State<DoctorAppointment> createState() => _DoctorAppointmentState();
}

class _DoctorAppointmentState extends State<DoctorAppointment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MenuDrawer(),
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
          "Appointment",
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
                Get.to(() => const UserProfileDetails());
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
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textF16W700("Appointment"),
            const SizedBox(height: 10),
            const DoctorsOverview(
              name: "Dr. Balestra",
              info: "Dental Surgeon",
              imageurl: "assets/images/doctors/balestra.png",
              routeName: "",
              rating: 4.5,
              rate: 28.29,
            ),
            const SizedBox(height: 16),
            textF16W700("Appointment Form"),
            const SizedBox(height: 16),
            CustomTextField(hintText: "Patient's Name"),
            const SizedBox(height: 8),
            CustomTextField(hintText: "Contact Number"),
            const SizedBox(height: 8),
            CustomTextField(hintText: "Age"),
            const SizedBox(height: 8),
            CustomTextField(hintText: "Gender"),
            const SizedBox(height: 8),
            CustomTextField(hintText: "Date"),
            const SizedBox(height: 8),
            CustomTextField(hintText: "Time"),
            const SizedBox(height: 8),
            CustomTextField(hintText: "Address"),
            const SizedBox(height: 16),
            appointmentConfirmedDialog(context),
          ],
        ),
      ),
    );
  }
}

//doctors Overview
class DoctorsOverview extends StatefulWidget {
  final String name;
  final String info;
  final String imageurl;
  final String routeName;
  final double rating;
  final double rate;

  const DoctorsOverview({
    Key? key,
    required this.name,
    required this.info,
    required this.imageurl,
    required this.routeName,
    required this.rating,
    required this.rate,
  }) : super(key: key);

  @override
  State<DoctorsOverview> createState() => _DoctorsOverviewState();
}

class _DoctorsOverviewState extends State<DoctorsOverview> {
  bool _isFavorite = false;

  void _toggleFavorite() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
      } else {
        _isFavorite = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, widget.routeName);
      },
      child: Container(
        height: 120,
        decoration: BoxDecoration(
          color: accent2Color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: accent5Color,
              blurRadius: 5,
              spreadRadius: 2,
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 90,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(
                    widget.imageurl,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 1.9,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      textF16W700(widget.name),
                      IconButton(
                        onPressed: _toggleFavorite,
                        icon: (_isFavorite
                            ? const Icon(
                                Icons.favorite,
                                color: Colors.red,
                                size: 18,
                              )
                            : const Icon(
                                Icons.favorite_border,
                                size: 18,
                                color: accent3Color,
                              )),
                      )
                    ],
                  ),
                  Text(
                    widget.info,
                    style: GoogleFonts.comfortaa(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      ratings(widget.rating),
                      Text(
                        "USD ${widget.rate} /hr",
                        style: GoogleFonts.comfortaa(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget appointmentConfirmedDialog(BuildContext context) {
  return GestureDetector(
    onTap: () => showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height / 3.5,
          child: Column(
            children: [
              Image.asset(
                "assets/images/common/like.png",
                height: 120,
              ),
              const SizedBox(height: 10),
              Text(
                "Thank You",
                style: GoogleFonts.comfortaa(
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Your Appointment is Successful",
                style: GoogleFonts.comfortaa(
                  fontSize: 16,
                  fontWeight: FontWeight.w300,
                  color: accent3Color,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                "You have an appointment with Dr. Pediatrician Purpieson on February 21, at 02:00 PM",
                style: GoogleFonts.comfortaa(
                  fontSize: 14,
                  fontWeight: FontWeight.w300,
                  color: accent3Color,
                  height: 1.5,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        actions: <Widget>[
          customButton1("Done", "dashboard", context),
        ],
      ),
    ),
    child: Container(
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: primaryColor,
        border: Border.all(
          color: primaryColor,
        ),
      ),
      child: Text(
        "Next",
        style: GoogleFonts.comfortaa(
          color: Colors.white,
          fontSize: 14,
          fontWeight: FontWeight.w700,
        ),
      ),
    ),
  );
}
