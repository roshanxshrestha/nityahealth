import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/custom_text_field.dart';
import 'package:nityahealth/common/text_style.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class GetPhoneNumber extends StatefulWidget {
  const GetPhoneNumber({super.key});

  @override
  State<GetPhoneNumber> createState() => _GetPhoneNumberState();
}

class _GetPhoneNumberState extends State<GetPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                shadowColor: Colors.transparent,
                foregroundColor: primaryColor,
                title: Text(
                  "Recover your account",
                  style: GoogleFonts.comfortaa(
                    fontSize: 18,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              textF14W300("Enter phone number"),
              const SizedBox(height: 10),
              Text(
                "A 6-digit otp will be sent to your phone number",
                style: GoogleFonts.comfortaa(
                  fontSize: 12,
                  color: accent3Color,
                  fontWeight: FontWeight.w300,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 30),
                    Container(
                      color: Colors.transparent,
                      width: 350,
                      child: Column(
                        children: [
                          CustomTextField(hintText: "phone number"),
                          const SizedBox(height: 20),
                          customButton1(
                              'Continue', 'phone_verification', context),
                          const SizedBox(height: 15),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
