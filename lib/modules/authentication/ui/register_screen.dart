import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nityahealth/common/custom_button.dart';
import 'package:nityahealth/modules/authentication/controller/register_controller/register_controller.dart';
import 'package:nityahealth/utils/constants/app_theme.dart';
import '../../../common/custom_text_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _controller = Get.put(RegisterController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var cPasswordController = TextEditingController();
  var addressController = TextEditingController();
  var phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  get message => null;

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
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 20),
                        Text(
                          "Full Name",
                          style: GoogleFonts.comfortaa(
                            fontSize: 14,
                            color: accent3Color,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomTextField(
                          message: "name required",
                          hintText: "full name",
                          controller: nameController,
                        ),
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
                        CustomTextField(
                          hintText: "address",
                          controller: addressController,
                          message: "address required",
                        ),
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
                        CustomTextField(
                          isPhone: true,
                          hintText: "phone number",
                          controller: phoneController,
                          message: "phone required",
                        ),
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
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: emailController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "email",
                            hintStyle: GoogleFonts.comfortaa(
                              color: accent1Color,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          validator: ((value) {
                            if (value!.isNotEmpty) {
                              if (!RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value.toString())) {
                                return "enter valid email";
                              }
                              // return null;
                            } else {
                              return "email required";
                            }
                            return null;
                          }),
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
                          controller: passwordController,
                          hintText: "password",
                          isPassword: true,
                          message: "password required",
                        ),
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
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          textInputAction: TextInputAction.next,
                          controller: cPasswordController,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "re-enter password",
                            hintStyle: GoogleFonts.comfortaa(
                              color: accent1Color,
                              fontSize: 14,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                          obscureText: true,
                          validator: ((value) {
                            if (value?.isEmpty == true) {
                              return "re-enter password";
                            }
                            if (passwordController.text.trim() !=
                                cPasswordController.text.trim()) {
                              return "password does not match";
                            }
                            return null;
                          }),
                        ),
                        const SizedBox(height: 25),
                        customButton2("Sign up", context, () async {
                          // showDialog(
                          //   context: context,
                          //   builder: (context) {
                          //     return const Center(
                          //         child: CircularProgressIndicator(
                          //       color: AppColor.primaryColor,
                          //     ));
                          //   },
                          // );
                          if (_formKey.currentState?.validate() == true) {
                            _formKey.currentState?.save();

                            var name = nameController.text.trim();
                            var email = emailController.text.trim();
                            var password = passwordController.text.trim();
                            var cPassword = cPasswordController.text.trim();
                            var address = addressController.text.trim();
                            var phone = phoneController.text.trim();
                            _controller
                                .register(name, email, password, cPassword,
                                    address, phone)
                                .then((value) {
                              if (value != null && value.success!) {
                                Get.toNamed("phone_verification");
                              }
                            });
                          }
                        }),
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
      ),
    );
  }
}
