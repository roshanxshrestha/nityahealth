import 'package:get/get.dart';
import 'package:nityahealth/modules/authentication/ui/google_login.dart';
import 'package:nityahealth/modules/onboarding/splash_screen.dart';
import 'package:nityahealth/modules/yoga/ui/course_detail.dart';
import 'package:nityahealth/modules/dashboard/activities/ui/activities.dart';
import 'package:nityahealth/modules/dashboard/ui/dashboard.dart';
import 'package:nityahealth/modules/diet/ui/food_details.dart';
import 'package:nityahealth/modules/diet/ui/food_list.dart';
import 'package:nityahealth/modules/doctors/ui/doctor_appointment.dart';
import 'package:nityahealth/modules/doctors/ui/doctors.dart';
import 'package:nityahealth/modules/doctors/ui/doctor_dental.dart';
import 'package:nityahealth/modules/doctors/ui/dotor_profile.dart';
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
import 'package:nityahealth/modules/authentication/ui/register_screen.dart';
import 'package:nityahealth/modules/authentication/ui/password_reset.dart';
import 'package:nityahealth/modules/authentication/ui/login_option.dart';
import 'package:nityahealth/modules/authentication/ui/sign_in_email.dart';
import 'package:nityahealth/modules/profile/ui/user_profile_setting.dart';
import 'package:nityahealth/modules/yoga/ui/exercise_list_screen.dart';
import 'package:nityahealth/modules/yoga/ui/exercise_timer.dart';
import 'package:nityahealth/modules/yoga/ui/yoga_activities.dart';
import 'package:nityahealth/modules/yoga/ui/yoga_menu.dart';

import '../modules/profile/ui/user_profile_details.dart';

class AppRoutes {
  static List<GetPage> generateRoute() {
    List<GetPage> routes = [
      GetPage(name: '/welcome_screen', page: () => const WelcomeScreen()),
      GetPage(name: '/splash_screen', page: () => const Splash()),
      GetPage(name: '/sign_in_email', page: () => const SignInEmail()),
      GetPage(name: '/login_option', page: () => const LoginOption()),
      GetPage(name: '/google_login', page: () => const GoogleLogin()),
      GetPage(name: '/register_screen', page: () => const RegisterScreen()),
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
          name: '/userprofilesetting', page: () => const UserProfileSetting()),
      GetPage(name: '/wellness', page: () => const Wellness()),
      GetPage(name: '/consultant', page: () => const Consultant()),
      GetPage(name: '/healthtopics', page: () => const HealthTopics()),
      GetPage(name: '/news', page: () => const NewsArticles()),
      GetPage(name: '/activities', page: () => const MyActivities()),
      GetPage(name: '/bmicalc', page: () => const BMICalculator()),
      GetPage(name: '/dietplan', page: () => const DietPlan()),
      GetPage(name: '/foodlist', page: () => const FoodList()),
      GetPage(name: '/fooddetails', page: () => const FoodDetails()),
      GetPage(name: '/yogamenu', page: () => const YogaMenu()),
      GetPage(name: '/yogaactivities', page: () => const YogaActivities()),
      GetPage(name: '/coursedetail', page: () => const CourseDetail()),
      GetPage(name: '/doctors', page: () => const FindDoctors()),
      GetPage(name: '/dentaldoctors', page: () => const DentalDoctor()),
      GetPage(name: '/doctorprofile', page: () => const DoctorProfile()),
      GetPage(name: '/exerciselist', page: () => const ExerciseList()),
      GetPage(name: '/exercisetimer', page: () => const ExerciseTimer()),
      GetPage(
          name: '/doctorappointment', page: () => const DoctorAppointment()),
    ];
    return routes;
  }
}
