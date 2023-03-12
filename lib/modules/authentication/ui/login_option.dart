import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/or_divider.dart';
import 'package:nityahealth/common/skip_button.dart';
import 'package:nityahealth/modules/authentication/ui/register_screen.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';

class LoginOption extends StatefulWidget {
  const LoginOption({super.key});

  @override
  State<LoginOption> createState() => _LoginOptionState();
}

final GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: ["email"],
);

class _LoginOptionState extends State<LoginOption> {
  @override
  void initState() {
    _googleSignIn.onCurrentUserChanged.listen((account) {
      setState(() {});
    });
    _googleSignIn.signInSilently();
    super.initState();
  }

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
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/logo/Vector.png",
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
                      const SizedBox(height: 30),
                      orDivider(),
                      const SizedBox(height: 30),
                      Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("");
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/logo/google-logo.png"),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(width: 20),
                            GestureDetector(
                              onTap: () {
                                Get.toNamed("");
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        "assets/images/logo/logo-facebook.png"),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
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
                              Get.to(() => const RegisterScreen());
                            },
                            child: Text(
                              "Sign Up",
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
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
