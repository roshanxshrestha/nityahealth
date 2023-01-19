import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nityahealth/modules/authentication/ui/login_option.dart';
import 'package:nityahealth/modules/onboarding/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../utils/constants/app_theme.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  SplashState createState() => SplashState();
}

class SplashState extends State<Splash> with AfterLayoutMixin<Splash> {
  Future checkFirstSeen() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
            child: CircularProgressIndicator(
          color: AppColor.primaryColor,
        ));
      },
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool seen = (prefs.getBool("seen") ?? false);
    if (seen) {
      Get.off(() => const LoginOption());
    } else {
      await prefs.setBool("seen", true);
      Get.off(() => const WelcomeScreen());
    }
  }

  @override
  void afterFirstLayout(BuildContext context) => checkFirstSeen();

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
          // child: Text('Loading...'),
          ),
    );
  }
}
