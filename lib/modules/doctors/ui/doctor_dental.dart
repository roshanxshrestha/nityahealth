import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/modules/doctors/ui/doctor_appointment.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/user/ui/user_profile_details.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class DentalDoctor extends StatelessWidget {
  const DentalDoctor({super.key});

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
          "Doctors",
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
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // textF16W700("Find your desired doctor"),
              // const SizedBox(height: 8),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: const Icon(Icons.search),
                  hintText: 'Search Doctors',
                ),
              ),
              const SizedBox(height: 16),
              textF16W700("Dental Surgeons"),
              const SizedBox(height: 16),

              SizedBox(
                height: MediaQuery.of(context).size.height / 1.4,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: Column(
                    children: const [
                      DoctorsOverview(
                        name: "Dr. Stella Kane",
                        info: "Dental Surgeon",
                        experience: "7 years experience",
                        percentage: "87%",
                        history: "69 Patient Stories",
                        imageurl: "assets/images/doctors/shruti.jpg",
                        availability: "11 Jan",
                        routeName: "doctorprofile",
                      ),
                      SizedBox(height: 8),
                      DoctorsOverview(
                        name: "Dr. Crownover",
                        info: "Dental Surgeon",
                        experience: "7 years experience",
                        percentage: "87%",
                        history: "69 Patient Stories",
                        imageurl: "assets/images/doctors/crownover.png",
                        availability: "10 am, Tomorrow",
                        routeName: "",
                      ),
                      SizedBox(height: 8),
                      DoctorsOverview(
                        name: "Dr. Watamaniuk",
                        info: "Dental Surgeon",
                        experience: "7 years experience",
                        percentage: "87%",
                        history: "69 Patient Stories",
                        imageurl: "assets/images/doctors/watamaniuk.png",
                        availability: "11 Jan",
                        routeName: "",
                      ),
                      SizedBox(height: 8),
                      DoctorsOverview(
                        name: "Dr. Balestra",
                        info: "Dental Surgeon",
                        experience: "7 years experience",
                        percentage: "87%",
                        history: "69 Patient Stories",
                        imageurl: "assets/images/doctors/balestra.png",
                        availability: "10 am, 11 Jan",
                        routeName: "",
                      ),
                      SizedBox(height: 8),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

//categories
Widget doctorCategories(String title, String imageurl) {
  return GestureDetector(
    onTap: () {},
    child: Container(
      // width: MediaQuery.of(context).size.width / 3,
      width: 108,
      decoration: BoxDecoration(
        color: accent2Color,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(color: accent5Color, blurRadius: 5, spreadRadius: 2),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(imageurl),
            const SizedBox(height: 5),
            textF16W700(title),
          ],
        ),
      ),
    ),
  );
}

//doctors Overview
class DoctorsOverview extends StatefulWidget {
  final String name;
  final String info;
  final String experience;
  final String percentage;
  final String history;
  final String imageurl;
  final String availability;
  final String routeName;

  const DoctorsOverview({
    Key? key,
    required this.name,
    required this.info,
    required this.experience,
    required this.percentage,
    required this.history,
    required this.imageurl,
    required this.availability,
    required this.routeName,
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
        padding: const EdgeInsets.only(left: 23, right: 23),
        height: 170,
        decoration: BoxDecoration(
          color: accent2Color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(color: accent5Color, blurRadius: 5, spreadRadius: 2),
          ],
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.width / 5,
                  width: MediaQuery.of(context).size.width / 5,
                  child: Image.asset(
                    widget.imageurl,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  height: 45,
                  width: 100,
                  child: Column(
                    children: [
                      Text(
                        "Next Available",
                        style: GoogleFonts.comfortaa(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        widget.availability,
                        style: GoogleFonts.comfortaa(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(width: 16),
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
                      fontSize: 13,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    widget.experience,
                    style: GoogleFonts.comfortaa(
                      fontSize: 12,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.percentage,
                        style: GoogleFonts.comfortaa(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 20),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 5),
                      Text(
                        widget.history,
                        style: GoogleFonts.comfortaa(
                          fontSize: 11,
                          fontWeight: FontWeight.w300,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.to(() => const DoctorAppointment());
                        },
                        child: Container(
                          height: 34,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: primaryColor,
                          ),
                          child: Center(
                            child: Text(
                              "Book Now",
                              style: GoogleFonts.comfortaa(
                                fontSize: 12,
                                fontWeight: FontWeight.w700,
                                color: accent2Color,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
