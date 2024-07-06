
import 'package:get/get.dart';
import 'package:track_booking/view/screen/driver_screen/driver_home_screen/driver_home_screen.dart';
import 'package:track_booking/view/screen/driver_screen/driver_profile/driver_edit_profile/driver_edit_profile.dart';
import 'package:track_booking/view/screen/driver_screen/driver_sign_up/driver_sign_up.dart';
import 'package:track_booking/view/screen/driver_screen/feedback_screen/feedback_screen.dart';
import 'package:track_booking/view/screen/driver_screen/map_screen/map_screen.dart';
import 'package:track_booking/view/screen/driver_screen/notification_screen/notification_screen.dart';
import 'package:track_booking/view/screen/user_screen/add_trip_screen/add_trip_screen.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/forget_otp/forget_otp.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/forget_password/forget_password.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/on_board_screen/on_board-screen.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/reset_password/reset_password.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/signIn_screen/sign_in_screen.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/sign_up_screen/sign_up_screen.dart';
import 'package:track_booking/view/screen/user_screen/home_screen/home_screen.dart';
import 'package:track_booking/view/screen/user_screen/message_screen/message_screen.dart';
import 'package:track_booking/view/screen/user_screen/overview_screen/overview_screen.dart';
import 'package:track_booking/view/screen/user_screen/privacy_policy_screen/privacy_policy_screen.dart';
import 'package:track_booking/view/screen/user_screen/profile_screen/edit_profile_screen/edit_profile_screen.dart';
import 'package:track_booking/view/screen/user_screen/search_screen/search_screen.dart';
import 'package:track_booking/view/screen/user_screen/setting_screen/change_password_screen/change_password_screen.dart';
import 'package:track_booking/view/screen/user_screen/setting_screen/setting_screen.dart';
import 'package:track_booking/view/screen/user_screen/splash_screen/splash_screen.dart';
import 'package:track_booking/view/screen/user_screen/terms_and_condition_screen/terms_and_condition_screen.dart';



class AppRoutes {
  static const String splashScreen = "/SplashScreen";

  ///========================Home screen================
  static const String homeScreen = "/HomeScreen";
  static const String changePasswordScreen = "/ChangePasswordScreen";
  static const String settingScreen = "/SettingScreen";
  static const String termsAndConditionScreen = "/TermsAndConditionScreen";
  static const String privacyPolicyScreen = "/PrivacyPolicyScreen";
  static const String notificationScreen = "/NotificationScreen";

  ///==========================Authentication==================
  static const String signInScreen = "/SignInScreen";
  static const String forgetPassword = "/ForgetPassword";
  static const String forgetOtp = "/ForgetOtp";
  static const String resetPassword = "/ResetPassword";
  static const String signUpScreen = "/SignUpScreen";
  static const String onBoardScreen = "/OnBoardScreen";


  ///==============================Profile section================
  static const String editProfileScreen = "/EditProfileScreen";

  ///===================================Message section=============
  static const String messageScreen = "/MessageScreen";

  ///=========================Search Screen=============
  static const String searchScreen = "/SearchScreen";
  static const String addTripScreen = "/AddTripScreen";
  static const String overviewScreen = "/OverviewScreen";


  ///============================Driver home screen===================
  static const String driverHomeScreen = "/DriverHomeScreen";
  static const String driverEditProfile = "/DriverEditProfile";
  static const String feedbackScreen = "/FeedbackScreen";
  static const String mapScreen = "/MapScreen";

  ///==========================Driver auth===================
  static const String driverSignUp = "/DriverSignUp";







  static List<GetPage> routes = [
     GetPage(name: splashScreen, page: () => const SplashScreen()),

    ///========================Home screen================
     GetPage(name: homeScreen, page: () =>  HomeScreen()),
     GetPage(name: changePasswordScreen, page: () =>  ChangePasswordScreen()),
     GetPage(name: settingScreen, page: () =>  const SettingScreen()),
     GetPage(name: termsAndConditionScreen, page: () =>  const TermsAndConditionScreen()),
     GetPage(name: privacyPolicyScreen, page: () =>  const PrivacyPolicyScreen()),
     GetPage(name: forgetOtp, page: () =>  const ForgetOtp()),
     GetPage(name: notificationScreen, page: () =>   const NotificationScreen()),


    ///============================Authentication======================
    GetPage(name: signInScreen, page: () =>   const SignInScreen()),
    GetPage(name: forgetPassword, page: () =>   const ForgetPassword()),
    GetPage(name: resetPassword, page: () =>   const ResetPassword()),
    GetPage(name: signUpScreen, page: () =>    SignUpScreen()),
    GetPage(name: onBoardScreen, page: () =>    const OnBoardScreen()),

    ///==============================Profile section================
    GetPage(name: editProfileScreen, page: () =>  EditProfileScreen()),

    ///===================================Message section=============
    GetPage(name: messageScreen, page: () =>  MessageScreen()),



    ///===================================Driver Home section=============
    GetPage(name: driverHomeScreen, page: () => DriverHomeScreen()),
    GetPage(name: driverEditProfile, page: () => DriverEditProfile()),
    GetPage(name: feedbackScreen, page: () =>  FeedbackScreen()),
    GetPage(name: mapScreen, page: () =>  const MapScreen()),

    ///=========================Driver signup================
    GetPage(name: driverSignUp, page: () =>  DriverSignUp()),

    ///===================================User Search screen======
    GetPage(name: searchScreen, page: () =>  const SearchScreen()),
    GetPage(name: addTripScreen, page: () =>   AddTripScreen()),
    GetPage(name: overviewScreen, page: () =>   const OverviewScreen()),


  ];
}
