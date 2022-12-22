import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/custom_widgets.dart';

class Food extends StatefulWidget {
  const Food({super.key});

  @override
  State<Food> createState() => _FoodState();
}

class _FoodState extends State<Food> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.center,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width / 1.1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 10),
              Text(
                "You want to",
                style: GoogleFonts.comfortaa(
                    fontSize: 18, fontWeight: FontWeight.w700),
              ),
              const SizedBox(height: 16),
              customButton1("Gain Weight", "", context),
              const SizedBox(height: 8),
              customButton1("Loose Weight", "", context),
              const SizedBox(height: 8),
              customButton1("Maintain Weight", "", context),
              const SizedBox(height: 8),
              orDivider(),
              const SizedBox(height: 8),
              customButton1("Calculate your BMI", "bmicalc", context),
            ],
          ),
        ),
      ),
    );
  }
}
