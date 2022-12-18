import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';

import '../../constants/buttons.dart';

class SignUpEmail extends StatefulWidget {
  const SignUpEmail({super.key});

  @override
  State<SignUpEmail> createState() => _SignUpEmailState();
}

class _SignUpEmailState extends State<SignUpEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SizedBox(
          // height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
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
              ),
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
                        color: accent1Color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    nameField("First name"),
                    const SizedBox(height: 10),
                    Text(
                      "Last Name",
                      style: GoogleFonts.comfortaa(
                        fontSize: 14,
                        color: accent1Color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    nameField("Last name"),
                    const SizedBox(height: 10),
                    Text(
                      "Address",
                      style: GoogleFonts.comfortaa(
                        fontSize: 14,
                        color: accent1Color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    nameField("Address"),
                    const SizedBox(height: 10),
                    Text(
                      "Phone number",
                      style: GoogleFonts.comfortaa(
                        fontSize: 14,
                        color: accent1Color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    phoneField(),
                    const SizedBox(height: 10),
                    Text(
                      "Email address",
                      style: GoogleFonts.comfortaa(
                        fontSize: 14,
                        color: accent1Color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    emailField(),
                    const SizedBox(height: 20),
                    Text(
                      "Password",
                      style: GoogleFonts.comfortaa(
                        fontSize: 14,
                        color: accent1Color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    passwordField("at least 8 characters"),
                    const SizedBox(height: 20),
                    Text(
                      "Confirm Password",
                      style: GoogleFonts.comfortaa(
                        fontSize: 14,
                        color: accent1Color,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(height: 10),
                    passwordField("Re-enter password"),
                    const SizedBox(height: 20),
                    customButton1("Sign In", "", context),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Already have an account?",
                          style: GoogleFonts.comfortaa(
                            fontSize: 14,
                            color: accent1Color,
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
                        )
                      ],
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
