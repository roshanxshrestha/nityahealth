import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../utils/constants/app_theme.dart';

class BloodGroupDropdown extends StatefulWidget {
  const BloodGroupDropdown({super.key});

  @override
  State<BloodGroupDropdown> createState() => _BloodGroupDropdownState();
}

class _BloodGroupDropdownState extends State<BloodGroupDropdown> {
  List<String> items = [
    'Select',
    'A+',
    'A-',
    'B+',
    'B-',
    'O+',
    'O-',
    'AB+',
    'AB-',
  ];
  String? selectedItem = "Select";
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Center(
        child: DropdownButtonFormField(
          decoration: const InputDecoration(
            fillColor: AppColor.accent1Color,
          ),
          value: selectedItem,
          items: items
              .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Text(
                      item,
                      style: GoogleFonts.comfortaa(
                        color: accent3Color,
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                  )))
              .toList(),
          onChanged: (String? item) {
            setState(() => selectedItem = item);
          },
        ),
      ),
    );
  }
}
