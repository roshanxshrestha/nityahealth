import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/dashboard/wellness/ui/fitness.dart';
import 'package:nityahealth/modules/dashboard/wellness/ui/food.dart';
import 'package:nityahealth/modules/dashboard/wellness/ui/personal_care.dart';

class Wellness extends StatefulWidget {
  const Wellness({super.key});

  @override
  State<Wellness> createState() => _WellnessState();
}

class _WellnessState extends State<Wellness> {
  final List _isSelected = [true, false, false, false];

  List<Widget> wellnessCategories = [
    const Fitness(),
    const Food(),
    const PersonalCare(),
  ];
  final List<String> categories = [
    "Fitness",
    "Food",
    "Personal Care",
  ];

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
          "Wellness",
          style: GoogleFonts.comfortaa(
            fontSize: 18,
            color: accent2Color,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16),
        child: Stack(
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(top: 50, right: 0, left: 0, bottom: 10),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CarouselSlider(
                  items: wellnessCategories,
                  options: CarouselOptions(
                    enlargeCenterPage: false,
                    autoPlay: false,
                    viewportFraction: 1,
                    height: MediaQuery.of(context).size.height,
                    onPageChanged: (index, other) {
                      setState(
                        () {
                          for (int i = 0; i < categories.length; i++) {
                            if (i == index) {
                              _isSelected[i] = true;
                            } else {
                              _isSelected[i] = false;
                            }
                          }
                        },
                      );
                    },
                  ),
                ),
              ),
            ),
            Center(
              child: Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (int i = 0; i < categories.length; i++)
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Visibility(
                              visible: !_isSelected[i],
                              child: Container(
                                height: 40,
                                width: 132,
                                decoration: BoxDecoration(
                                  color: accent2Color,
                                  border: Border.all(
                                    color: primaryColor,
                                  ),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    categories[i],
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 16,
                                      color: accent3Color,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Visibility(
                              visible: _isSelected[i],
                              child: Container(
                                height: 40,
                                width: 124,
                                decoration: BoxDecoration(
                                  color: primaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Center(
                                  child: Text(
                                    categories[i],
                                    style: GoogleFonts.comfortaa(
                                      fontSize: 16,
                                      color: accent2Color,
                                      fontWeight: FontWeight.w700,
                                      decoration: TextDecoration.none,
                                    ),
                                  ),
                                ),
                              ),
                            )
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
    );
  }
}
