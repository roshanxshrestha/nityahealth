import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/modules/user/controller/user_update_controller.dart';
import '../utils/constants/app_theme.dart';

class FoodTypeDropdown extends StatefulWidget {
  final String selectedValue;
  const FoodTypeDropdown({super.key, required this.selectedValue});

  @override
  State<FoodTypeDropdown> createState() => _FoodTypeDropdownState();
}

class _FoodTypeDropdownState extends State<FoodTypeDropdown> {
  var controller = Get.find<UserUpdateController>();
  List<String> items = [
    'veg',
    'non veg',
    'vegan',
  ];
  String? selectedItem = "veg";

  @override
  void initState() {
    selectedItem = widget.selectedValue;
    log("foodType = $selectedItem");
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
            controller.selectedFoodType.value = item ?? "veg";
            setState(() => selectedItem = item);
          },
        ),
      ),
    );
  }
}
