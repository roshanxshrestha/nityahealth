import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import '../../../common/custom_text_field.dart';

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({super.key});

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            floating: true,
            foregroundColor: primaryColor,
            shadowColor: Colors.transparent,
            backgroundColor: Colors.transparent,
            title: Text(
              "Sign Up",
              style: GoogleFonts.comfortaa(
                fontSize: 18,
                color: primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          )
        ],
        body: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: SizedBox(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 30),
                      Text(
                        "First Name",
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          color: accent3Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(hintText: "First name"),
                      const SizedBox(height: 20),
                      Text(
                        "Last Name",
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          color: accent3Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(hintText: "Last name"),
                      const SizedBox(height: 20),
                      Text(
                        "Address",
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          color: accent3Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(hintText: "Address"),
                      const SizedBox(height: 20),
                      Text(
                        "Phone number",
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          color: accent3Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(hintText: "Phone number"),
                      const SizedBox(height: 20),
                      Text(
                        "Email address",
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          color: accent3Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(hintText: "someone@example.com"),
                      const SizedBox(height: 20),
                      Text(
                        "Password",
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          color: accent3Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(hintText: "password", isPassword: true),
                      const SizedBox(height: 20),
                      Text(
                        "Confirm Password",
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          color: accent3Color,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 5),
                      CustomTextField(hintText: "password", isPassword: true),
                      const SizedBox(height: 25),
                      customButton1("Sign In", "phone_verification", context),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Already have an account?",
                            style: GoogleFonts.comfortaa(
                              fontSize: 14,
                              color: accent3Color,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, "sign_in_email");
                            },
                            child: Text(
                              "Sign In",
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
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
        ),
      ),
    );
  }
}
