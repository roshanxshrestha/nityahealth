import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:nityahealth/inside_app/dashboard/dashboard.dart';
import 'package:nityahealth/inside_app/dashboard/dashboard_items/appbar_items/menu_items/menu_drawer.dart';
import 'package:nityahealth/inside_app/dashboard/dashboard_items/appbar_items/notification_center/notification.dart';
import 'package:nityahealth/inside_app/dashboard/dashboard_items/appbar_items/user_profile/user_profile_setting.dart';
import 'package:nityahealth/inside_app/dashboard/dashboard_items/wellness/wellness.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding1.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding2.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding3.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding4.dart';
import 'package:nityahealth/welcomepages/opening_pages/onboarding_pages/onboarding_page.dart';
import 'package:nityahealth/welcomepages/opening_pages/welcome_screen.dart';
import 'package:nityahealth/welcomepages/register_pages/phone_verification.dart';
import 'package:nityahealth/welcomepages/register_pages/set_location.dart';
import 'package:nityahealth/welcomepages/register_pages/sign_up_email.dart';
import 'package:nityahealth/welcomepages/sign_in_pages/password_reset.dart';
import 'package:nityahealth/welcomepages/sign_in_pages/sign_in.dart';
import 'package:nityahealth/welcomepages/sign_in_pages/sign_in_email.dart';

import 'inside_app/dashboard/dashboard_items/appbar_items/user_profile/user_profile_details.dart';

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
        "phone_verification": (context) => const PhoneVerification(),
        "getphonenumber": (context) => const GetPhoneNumber(),
        "set_location": (context) => const SetLocation(),
        "onboarding_page": (context) => OnBoardingPage(),
        "onboarding1": (context) => const OnBoarding1(),
        "onboarding2": (context) => const OnBoarding2(),
        "onboarding3": (context) => const OnBoarding3(),
        "onboarding4": (context) => const OnBoarding4(),
        //logged in screens
        "dashboard": (context) => const Dashboard(),
        "wellness": (context) => const Wellness(),
        "userprofiledetails": (context) => const UserProfileDetails(),
        "userprofilesetting": (context) => const UserProfileSetting(),
        "notification": (context) => const NotificationUser(),
        "menudrawer": (context) => const MenuDrawer(),
      },
    );
  }
}
