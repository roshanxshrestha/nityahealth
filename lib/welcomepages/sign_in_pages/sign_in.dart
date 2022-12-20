import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/constants/app_constants.dart';
import 'package:nityahealth/constants/custom_widgets.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 1.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "images/logo/Vector.png",
                        width: 150,
                        color: primaryColor,
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Welcome",
                        style: GoogleFonts.comfortaa(
                          fontSize: 24,
                          color: primaryColor,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 30),
                      Text(
                        "Sign in to continue",
                        style: GoogleFonts.comfortaa(
                          fontSize: 12,
                          color: accent3Color,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 30),
                      customButton1(
                          "Sign in with email", "sign_in_email", context),
                      const SizedBox(height: 20),
                      Text(
                        "or",
                        style: GoogleFonts.comfortaa(
                          fontSize: 14,
                          color: accent3Color,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      const SizedBox(height: 20),
                      customButton1(
                          "Sign in with facebook", "welcome", context),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account yet?",
                            style: GoogleFonts.comfortaa(
                              fontSize: 14,
                              color: accent3Color,
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
                      const SizedBox(height: 10),
                      const Skip(),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "By signing in, you accept our",
                  style: GoogleFonts.comfortaa(
                    fontSize: 12,
                    color: accent3Color,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    "Terms And Conditions",
                    style: GoogleFonts.comfortaa(
                      fontSize: 12,
                      color: primaryColor,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
