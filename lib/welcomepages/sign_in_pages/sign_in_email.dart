import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/constants/buttons.dart';

class SignInEmail extends StatefulWidget {
  const SignInEmail({super.key});

  @override
  State<SignInEmail> createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                foregroundColor: primaryColor,
                shadowColor: Colors.transparent,
                backgroundColor: Colors.transparent,
                title: Text(
                  "Sign In",
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
                    const SizedBox(height: 20),
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
                    const SizedBox(height: 30),
                    customButton1("Sign In", "", context),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Don't have an account yet?",
                          style: GoogleFonts.comfortaa(
                            fontSize: 14,
                            color: accent1Color,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, "sign_up_email");
                          },
                          child: Text(
                            "Sign Up",
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
