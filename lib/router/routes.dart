import 'package:get/get.dart';
import 'package:nityahealth/modules/dashboard/ui/dashboard.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/notification/notification.dart';
import 'package:nityahealth/modules/dashboard/consultants/ui/consultant.dart';
import 'package:nityahealth/modules/bmi_calculator/bmi_calculator.dart';
import 'package:nityahealth/modules/diet/ui/dietplan.dart';
import 'package:nityahealth/modules/dashboard/health_topics/ui/health_topics.dart';
import 'package:nityahealth/modules/dashboard/news_articles/ui/news.dart';
import 'package:nityahealth/modules/dashboard/wellness/ui/wellness.dart';
import 'package:nityahealth/modules/onboarding/onboarding1.dart';
import 'package:nityahealth/modules/onboarding/onboarding2.dart';
import 'package:nityahealth/modules/onboarding/onboarding3.dart';
import 'package:nityahealth/modules/onboarding/onboarding4.dart';
import 'package:nityahealth/modules/onboarding/onboarding_page.dart';
import 'package:nityahealth/modules/onboarding/welcome_screen.dart';
import 'package:nityahealth/modules/authentication/ui/phone_verification.dart';
import 'package:nityahealth/modules/authentication/ui/set_location.dart';
import 'package:nityahealth/modules/authentication/ui/sign_up_email.dart';
import 'package:nityahealth/modules/authentication/ui/password_reset.dart';
import 'package:nityahealth/modules/authentication/ui/login_option.dart';
import 'package:nityahealth/modules/authentication/ui/sign_in_email.dart';

import '../modules/profile/ui/user_profile_details.dart';

class AppRoutes {
  static List<GetPage> generateRoute() {
    List<GetPage> routes = [
      GetPage(name: '/welcome_screen', page: () => const WelcomeScreen()),
      GetPage(name: '/sign_in_email', page: () => const SignInEmail()),
      GetPage(name: '/login_option', page: () => const LoginOption()),
      GetPage(name: '/sign_up_email', page: () => const SignUpEmail()),
      GetPage(name: '/getphonenumber', page: () => const GetPhoneNumber()),
      GetPage(
          name: '/phone_verification', page: () => const PhoneVerification()),
      GetPage(name: '/set_location', page: () => const SetLocation()),
      GetPage(name: '/onboarding_page', page: () => OnBoardingPage()),
      GetPage(name: '/onboarding1', page: () => const OnBoarding1()),
      GetPage(name: '/onboarding2', page: () => const OnBoarding2()),
      GetPage(name: '/onboarding3', page: () => const OnBoarding3()),
      GetPage(name: '/onboarding4', page: () => const OnBoarding4()),
      GetPage(name: '/menudrawer', page: () => const MenuDrawer()),
      GetPage(name: '/dashboard', page: () => const Dashboard()),
      GetPage(name: '/notification', page: () => const NotificationUser()),
      GetPage(
          name: '/userprofiledetails', page: () => const UserProfileDetails()),
      GetPage(
          name: '/userprofilesetting', page: () => const UserProfileDetails()),
      GetPage(name: '/wellness', page: () => const Wellness()),
      GetPage(name: '/consultant', page: () => const Consultant()),
      GetPage(name: '/healthtopics', page: () => const HealthTopics()),
      GetPage(name: '/news', page: () => const NewsArticles()),
      GetPage(name: '/bmicalc', page: () => const BMICalculator()),
      GetPage(name: '/dietplan', page: () => const DietPlan()),
    ];
    return routes;
  }
}
