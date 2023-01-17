import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

import '../utils/pref_manager.dart';

class DateDay extends StatefulWidget {
  const DateDay({super.key});

  @override
  State<DateDay> createState() => _DateDayState();
}

class _DateDayState extends State<DateDay> {
  int selected = 4;
  var name = "Falano";
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

  Widget customDateRadio(String day, int date, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 8,
        width: MediaQuery.of(context).size.width / 8,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: (selected == index) ? primaryColor : accent2Color,
            boxShadow: [
              BoxShadow(
                color: (selected == index)
                    ? primaryColor.withOpacity(0.5)
                    : Colors.transparent,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: GoogleFonts.comfortaa(
                fontSize: 12,
                fontWeight: FontWeight.w300,
                color: (selected == index) ? accent2Color : accent3Color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              date.toString(),
              style: GoogleFonts.comfortaa(
                fontSize: 18,
                fontWeight: FontWeight.w700,
                color: (selected == index) ? accent2Color : accent3Color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget customDayRadio(String day, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selected = index;
        });
      },
      child: Container(
        height: MediaQuery.of(context).size.width / 9,
        width: MediaQuery.of(context).size.width / 9,
        decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: (selected == index)
                  ? AppColor.primaryColor
                  : AppColor.accent1Color,
            ),
            borderRadius: BorderRadius.circular(50),
            color: AppColor.accent2Color,
            boxShadow: [
              BoxShadow(
                color: (selected == index)
                    ? primaryColor.withOpacity(0.5)
                    : Colors.transparent,
                blurRadius: 5,
                spreadRadius: 1,
              )
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              day,
              style: GoogleFonts.comfortaa(
                fontSize: 16,
                fontWeight: FontWeight.w700,
                color:
                    (selected >= index) ? AppColor.primaryColor : accent3Color,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        customText("Welcome back,", 12, FontWeight.w700),
        const SizedBox(height: 5),
        customText(name, 18, FontWeight.w700),
        const SizedBox(height: 16),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: accent2Color,
              boxShadow: [
                BoxShadow(
                  color: AppColor.accent1Color.withOpacity(0.1),
                  blurRadius: 10,
                  spreadRadius: 10,
                )
              ]),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              customDateRadio("SUN", 22, 1),
              customDateRadio("MON", 23, 2),
              customDateRadio("TUE", 24, 3),
              customDateRadio("WED", 25, 4),
              customDateRadio("THU", 26, 5),
              customDateRadio("FRI", 27, 6),
              customDateRadio("SAT", 28, 7),
            ],
          ),
        ),
        const SizedBox(height: 35),
        customText("Week Goal", 18, FontWeight.w700),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            customDayRadio("S", 1),
            customDayRadio("M", 2),
            customDayRadio("T", 3),
            customDayRadio("W", 4),
            customDayRadio("T", 5),
            customDayRadio("F", 6),
            customDayRadio("S", 7),
          ],
        ),
      ],
    );
  }
}
