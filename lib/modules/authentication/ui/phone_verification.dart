import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/otpfield.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/authentication/ui/sign_up_email.dart';

class PhoneVerification extends StatefulWidget {
  const PhoneVerification({super.key});

  @override
  State<PhoneVerification> createState() => _PhoneVerificationState();
}

class _PhoneVerificationState extends State<PhoneVerification> {
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
                  "Verification",
                  style: GoogleFonts.comfortaa(
                    fontSize: 18,
                    color: primaryColor,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Enter an otp sent to your phone",
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
                          otpField(context),
                          const SizedBox(height: 20),
                          customButton1('Continue', 'set_location', context),
                          const SizedBox(height: 15),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Get.to(
                                    const PhoneVerification(),
                                  );
                                },
                                child: Text(
                                  "Resend Code",
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 14,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.to(
                                    const SignUpEmail(),
                                  );
                                },
                                child: Text(
                                  "Change Number",
                                  style: GoogleFonts.comfortaa(
                                    fontSize: 14,
                                    color: primaryColor,
                                    fontWeight: FontWeight.w300,
                                  ),
                                ),
                              ),
                            ],
                          ),
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
