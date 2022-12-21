import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/constants/custom_widgets.dart';

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
                  "Enter Phone Number",
                  style: GoogleFonts.comfortaa(
                    fontSize: 18,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
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
                          phoneField(),
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
