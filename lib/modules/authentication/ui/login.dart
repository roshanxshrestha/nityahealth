import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/common/custom_text_field.dart';
import 'package:nityahealth/common/or_divider.dart';
import 'package:nityahealth/modules/authentication/controller/login_controller/login_controller.dart';
import 'package:nityahealth/modules/dashboard/ui/dashboard.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import 'package:nityahealth/modules/authentication/ui/password_reset.dart';

class SignInEmail extends StatefulWidget {
  const SignInEmail({super.key});

  @override
  State<SignInEmail> createState() => _SignInEmailState();
}

class _SignInEmailState extends State<SignInEmail> {
  final LoginController _controller = Get.put(LoginController());
  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

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
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                      CustomTextField(
                        controller: usernameController,
                        hintText: "email",
                        message: "email required",
                        isEmail: true,
                      ),
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
                      CustomTextField(
                        hintText: "Password",
                        controller: passwordController,
                        isPassword: true,
                        message: "enter password",
                      ),
                      const SizedBox(height: 30),
                      customButton2(
                        "Sign In",
                        context,
                        () async {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return const Center(
                                  child: CircularProgressIndicator(
                                color: AppColor.primaryColor,
                              ));
                            },
                          );
                          if (_formKey.currentState!.validate()) {
                            _controller.loginProcess.value = true;
                            _formKey.currentState?.save();
                            var email = usernameController.text.trim();
                            var password = passwordController.text.trim();

                            _controller.login(email, password).then(
                              (response) {
                                _controller.loginProcess.value = false;
                                if (response == null) {
                                  // Get.snackbar("Error", "Something went wrong!");
                                } else if (response.success!) {
                                  Get.offAll(Dashboard());
                                }
                              },
                            );
                          }
                        },
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {
                              Get.to(() => const GetPhoneNumber());
                            },
                            child: Text(
                              "Forgot password?",
                              style: GoogleFonts.comfortaa(
                                fontSize: 14,
                                color: primaryColor,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      orDivider(),
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
                              Navigator.pushNamed(context, "register_screen");
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
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
