import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

//buttom 1 with title and icon only
Widget button1(
    String title, IconData icon, String routeName, BuildContext context) {
  return InkWell(
    onTap: () {
      Navigator.pushNamed(context, routeName);
    },
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: accent5Color,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      padding: const EdgeInsets.only(right: 20, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          TextButton.icon(
            onPressed: (() {
              Navigator.pushNamed(context, routeName);
            }),
            icon: Icon(
              icon,
              color: primaryColor,
              size: 20,
            ),
            label: Text(
              title,
              style: GoogleFonts.comfortaa(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: accent3Color,
              ),
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    ),
  );
}

class Button2 extends StatefulWidget {
  const Button2({super.key});

  @override
  State<Button2> createState() => _Button2State();
}

class _Button2State extends State<Button2> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

//button 2 with icon, title and info
Widget button2(String title, IconData icon, String info, String routeName,
    BuildContext context) {
  bool isTapped = false;
  return GestureDetector(
    onTap: () {},
    child: Container(
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        color: accent5Color,
        border: Border(
          bottom: BorderSide(width: 1, color: Colors.black12),
        ),
      ),
      padding: const EdgeInsets.only(right: 20, left: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          TextButton.icon(
            onPressed: (() {
              Navigator.pushNamed(context, routeName);
            }),
            icon: Icon(
              icon,
              color: primaryColor,
              size: 20,
            ),
            label: Text(
              title,
              style: GoogleFonts.comfortaa(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: accent3Color,
              ),
            ),
          ),
          Text(
            info,
            style: GoogleFonts.comfortaa(
              fontSize: 12,
              fontWeight: FontWeight.w700,
              color: accent3Color,
            ),
          ),
          // Container(
          //   width: 100,
          //   child: isTapped? TextField(
          //           decoration: InputDecoration(
          //             border: InputBorder.none,
          //             hintText: info,
          //           ),
          //         )
          //       : Text(
          //           info,
          //           style: GoogleFonts.comfortaa(
          //             fontSize: 12,
          //             fontWeight: FontWeight.w700,
          //             color: accent3Color,
          //           ),
          //         ),
          // )
        ],
      ),
    ),
  );
}

//button 3 with forward arrow
Widget button3(
    String title, IconData icon, String routeName, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(bottom: 16),
    child: InkWell(
      onTap: () {
        Navigator.pushNamed(context, routeName);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: secondaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.only(right: 20, left: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: (() {
                Navigator.pushNamed(context, routeName);
              }),
              icon: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Icon(
                  icon,
                  color: accent2Color,
                  size: 23,
                ),
              ),
              label: Text(
                title,
                style: GoogleFonts.comfortaa(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: accent3Color,
                ),
              ),
            ),
            const Icon(
              Icons.double_arrow,
              color: primaryColor,
              size: 20,
            ),
          ],
        ),
      ),
    ),
  );
}
