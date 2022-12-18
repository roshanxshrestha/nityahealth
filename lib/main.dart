import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nityahealth/welcomepages/opening_pages/welcome_screen.dart';
import 'package:nityahealth/welcomepages/register_pages/sign_up_email.dart';
import 'package:nityahealth/welcomepages/sign_in_pages/sign_in.dart';
import 'package:nityahealth/welcomepages/sign_in_pages/sign_in_email.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: "welcome_screen",
      routes: {
        "welcome_screen": (context) => const WelcomeScreen(),
        "sign_in": (context) => const SignIn(),
        "sign_in_email": (context) => const SignInEmail(),
        "sign_up_email": (context) => const SignUpEmail(),
      },
    );
  }
}
