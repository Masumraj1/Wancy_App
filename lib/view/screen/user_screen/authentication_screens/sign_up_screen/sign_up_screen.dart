import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/authentication_controller/authentication_controller.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_widgets/custom_widgets.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});

  final AuthenticationController authenticationController =
  Get.find<AuthenticationController>();

  final CustomWidgets customWidgets = CustomWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      ///=========================Appbar========================
      appBar: AppBar(
        backgroundColor: AppColors.background,
        title: CustomText(
          text: AppStrings.setYourProfile,
          fontSize: 20.sp, // Use sp for font size
          fontWeight: FontWeight.w500,
          color: AppColors.buttonColor,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h), // Use w and h for padding
        child: SingleChildScrollView(
          child: Obx(
                () {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ///===============================name========================
                  customWidgets.customEditProfile(
                      title: AppStrings.name, controller: TextEditingController()),
                  ///===============================Email========================
                  customWidgets.customEditProfile(
                      title: AppStrings.email, controller: TextEditingController()),
                  ///===============================Password========================
                  customWidgets.customEditProfile(
                      title: AppStrings.password,
                      controller: TextEditingController()),
                  ///===============================Confirm password========================
                  customWidgets.customEditProfile(
                      title: AppStrings.confirmPassword,
                      controller: TextEditingController()),
                  Row(
                    children: [
                      ///========================Checkbox=======================
                      Checkbox(
                        value: authenticationController.isRemember.value,
                        checkColor: AppColors.white,
                        activeColor: AppColors.appBarBackground,
                        onChanged: (value) {
                          authenticationController.toggleRemember();
                        },
                      ),
                      Expanded(
                        child: RichText(
                          maxLines: 4,
                          text: TextSpan(
                            children: <TextSpan>[
                              TextSpan(
                                text: AppStrings.byProceedingYouAccept,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                ),
                              ),
                              ///==========================Terms of use=======================
                              TextSpan(
                                text: AppStrings.termsOfUse,
                                style: TextStyle(
                                  color: AppColors.blueNormal,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(AppRoutes.termsAndConditionScreen);
                                  },
                              ),
                              TextSpan(
                                text: AppStrings.and,
                                style: TextStyle(
                                  color: AppColors.black,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 16.sp,
                                ),
                              ),
                              ///==============================Privacy policy====================
                              TextSpan(
                                text: AppStrings.privacyPolicy,
                                style: TextStyle(
                                  color: AppColors.blueNormal,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    Get.toNamed(AppRoutes.privacyPolicyScreen);
                                  },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50.h, // Use h for vertical spacing
                  ),
                  CustomButton(
                    onTap: () {
                      Get.toNamed(AppRoutes.homeScreen);
                    },
                    title: AppStrings.letsGo,
                    fillColor: AppColors.appBarBackground,
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
