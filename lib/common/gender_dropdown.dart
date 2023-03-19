import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import '../modules/user/controller/user_update_controller.dart';
import '../utils/constants/app_theme.dart';

class GenderDropdown extends StatefulWidget {
  final String selectedValue;
  const GenderDropdown(this.selectedValue, {super.key});

  @override
  State<GenderDropdown> createState() => _GenderDropdownState();
}

class _GenderDropdownState extends State<GenderDropdown> {
  var controller = Get.find<UserUpdateController>();
  List<String> items = [
    'Male',
    'Female',
    'Others',
  ];

  String? selectedItem = "Male";
  @override
  void initState() {
    String value = widget.selectedValue;
    String firstLetter = value[0].toUpperCase();
    String rest = value.substring(1).toLowerCase();
    var gender = firstLetter + rest;
    log("gender = $gender");

    selectedItem = gender;
    super.initState();
  }

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
            controller.selectedGender.value = item ?? "male";
            setState(() => selectedItem = item);
          },
        ),
      ),
    );
  }
}
