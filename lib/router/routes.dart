import 'package:get/get.dart';
import 'package:nityahealth/modules/authentication/ui/google_login.dart';
import 'package:nityahealth/modules/authentication/ui/login.dart';
import 'package:nityahealth/modules/fitness/ui/fitness_screen.dart';
import 'package:nityahealth/modules/onboarding/splash_screen.dart';
import 'package:nityahealth/modules/user_medical/medicalpage_main.dart';
import 'package:nityahealth/modules/user/ui/user_update_screen.dart';
import 'package:nityahealth/modules/yoga/ui/course_detail.dart';
import 'package:nityahealth/modules/activities/ui/activities.dart';
import 'package:nityahealth/modules/dashboard/ui/dashboard.dart';
import 'package:nityahealth/modules/food/ui/food_details.dart';
import 'package:nityahealth/modules/food/ui/food_list.dart';
import 'package:nityahealth/modules/appointment/doctor_appointment.dart';
import 'package:nityahealth/modules/doctors/ui/doctors.dart';
import 'package:nityahealth/modules/doctors/ui/doctor_dental.dart';
import 'package:nityahealth/modules/doctors/ui/dotor_profile.dart';
import 'package:nityahealth/modules/drawer/ui/menu_drawer.dart';
import 'package:nityahealth/modules/notification/notification.dart';
import 'package:nityahealth/modules/consultants/ui/consultant.dart';
import 'package:nityahealth/modules/bmi_calculator/bmi_calculator.dart';
import 'package:nityahealth/modules/food/ui/dietplan.dart';
import 'package:nityahealth/modules/health_topics/ui/health_topics.dart';
import 'package:nityahealth/modules/news_articles/ui/news.dart';
import 'package:nityahealth/modules/wellness/wellness_presentation/ui/wellness.dart';
import 'package:nityahealth/modules/onboarding/onboarding1.dart';
import 'package:nityahealth/modules/onboarding/onboarding2.dart';
import 'package:nityahealth/modules/onboarding/onboarding3.dart';
import 'package:nityahealth/modules/onboarding/onboarding4.dart';
import 'package:nityahealth/modules/onboarding/onboarding_controller.dart';
import 'package:nityahealth/modules/onboarding/welcome_screen.dart';
import 'package:nityahealth/modules/authentication/ui/phone_verification.dart';
import 'package:nityahealth/modules/authentication/ui/set_location.dart';
import 'package:nityahealth/modules/authentication/ui/register_screen.dart';
import 'package:nityahealth/modules/authentication/ui/password_reset.dart';
import 'package:nityahealth/modules/authentication/ui/login_option.dart';
import 'package:nityahealth/modules/settings.dart/user_profile_setting.dart';
import 'package:nityahealth/modules/yoga/ui/yoga_timer.dart';
import 'package:nityahealth/modules/yoga/ui/yoga_screen.dart';
import 'package:nityahealth/modules/yoga/ui/yoga_menu.dart';

import '../modules/fitness/ui/fitness_timer.dart';
import '../modules/user/ui/user_profile_details.dart';
import '../modules/wellness/wellness_categories/screen/wellness_timer.dart';

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
      GetPage(name: '/onboarding_page', page: () => const OnBoardingPage()),
      GetPage(name: '/onboarding1', page: () => const OnBoarding1()),
      GetPage(name: '/onboarding2', page: () => const OnBoarding2()),
      GetPage(name: '/onboarding3', page: () => const OnBoarding3()),
      GetPage(name: '/onboarding4', page: () => const OnBoarding4()),
      GetPage(name: '/menudrawer', page: () => const MenuDrawer()),
      GetPage(name: '/dashboard', page: () => const Dashboard()),
      GetPage(name: '/notification', page: () => const NotificationUser()),
      GetPage(name: '/userprofiledetails', page: () => UserProfileDetails()),
      GetPage(name: '/profileupdate', page: () => const UpdateProfile()),
      GetPage(
          name: '/userprofilesetting', page: () => const UserProfileSetting()),
      GetPage(name: '/wellness', page: () => WellnessDashboard()),
      GetPage(name: "/fitness", page: () => FitnessScreen(0)),
      GetPage(name: '/consultant', page: () => const Consultant()),
      GetPage(name: '/healthtopics', page: () => const HealthTopics()),
      GetPage(name: '/news', page: () => const NewsArticles()),
      GetPage(name: '/activities', page: () => const MyActivities()),
      GetPage(name: '/bmicalc', page: () => const BMICalculator()),
      GetPage(name: '/dietplan', page: () => const DietPlan()),
      GetPage(name: '/foodlist', page: () => FoodList(0)),
      GetPage(name: '/fooddetails', page: () => FoodDetails()),
      GetPage(name: '/yogamenu', page: () => const YogaMenu()),
      GetPage(name: '/yogaactivities', page: () => const YogaActivities()),
      GetPage(name: '/coursedetail', page: () => const CourseDetail()),
      GetPage(name: '/doctors', page: () => FindDoctors()),
      GetPage(name: '/dentaldoctors', page: () => const DentalDoctor()),
      GetPage(name: '/doctorprofile', page: () => const DoctorProfile()),
      GetPage(
          name: '/usermedicalrecords', page: () => const UserMedicalRecords()),
      GetPage(name: '/yogatimer', page: () => YogaTimer()),
      GetPage(name: '/fitnesstimer', page: () => FitnessTimer()),
      GetPage(name: '/wellnesstimer', page: () => WellnessTimer()),
      GetPage(
          name: '/doctorappointment', page: () => const DoctorAppointment()),
    ];
    return routes;
  }
}
