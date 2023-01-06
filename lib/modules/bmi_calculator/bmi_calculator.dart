import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/custom_text_field.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

import '../settings.dart/user_profile_setting.dart';

class BMICalculator extends StatefulWidget {
  const BMICalculator({super.key});

  @override
  State<BMICalculator> createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  int selected = 0;
  Widget customRadio(String text, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selected = index;
        });
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: (selected == index ? primaryColor : accent2Color),
      ),
      child: Text(
        text,
        style: GoogleFonts.comfortaa(
          fontSize: 14,
          fontWeight: FontWeight.w300,
          color: (selected == index ? accent2Color : accent3Color),
        ),
      ),
    );
  }

  final TextEditingController _heightController = TextEditingController();
  final TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

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
          "BMI Calculator",
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
                Get.to(() => const UserProfileSetting());
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
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                textF16W700(
                  "Height",
                ),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "in meter",
                  controller: _heightController,
                ),
                const SizedBox(height: 30),
                textF16W700("Weight"),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "in kg",
                  controller: _weightController,
                ),
                const SizedBox(height: 30),
                textF16W700("Age"),
                const SizedBox(height: 10),
                CustomTextField(
                  hintText: "in years",
                ),
                const SizedBox(height: 30),
                textF16W700("Gender"),
                const SizedBox(height: 10),
                Row(
                  children: [
                    customRadio("Male", 1),
                    const SizedBox(width: 10),
                    customRadio("Female", 2),
                    const SizedBox(width: 10),
                    customRadio("Others", 3),
                  ],
                ),
                const SizedBox(height: 30),
                GestureDetector(
                  onTap: () {
                    double h = double.parse(_heightController.text);
                    double w = double.parse(_weightController.text);
                    setState(() {
                      _bmiResult = w / (h * h);
                      if (_bmiResult > 25) {
                        _textResult = "You're over weight!!!";
                      } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                        _textResult = "You've normal weight ;)";
                      } else {
                        _textResult = "You're under weight :(";
                      }
                    });
                  },
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.height / 1.1,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: Text(
                        "Calculate",
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          fontWeight: FontWeight.w700,
                          color: accent2Color,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Visibility(
                  visible: _textResult.isNotEmpty,
                  child: Container(
                    height: 50,
                    width: MediaQuery.of(context).size.height / 1.1,
                    color: secondaryColor,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              _bmiResult.toStringAsFixed(2),
                              style: GoogleFonts.comfortaa(
                                fontSize: 16,
                                color: primaryColor,
                              ),
                            ),
                            const SizedBox(width: 10),
                            Text(
                              "kg/m²",
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                                color: primaryColor,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          _textResult,
                          style: GoogleFonts.comfortaa(
                            fontSize: 14,
                            color: primaryColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30),
                Visibility(
                  visible: _textResult.isNotEmpty,
                  child:
                      customButton1("Get your diet plan", "foodlist", context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
