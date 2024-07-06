import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_images/app_images.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 40.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///===============================Login  Image=====================
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 166.h,
                      width: 166.w,
                      decoration: const BoxDecoration(
                        color: AppColors.darkLight,
                        shape: BoxShape.circle,
                      ),
                      child: const CustomImage(
                        imageSrc: AppImages.signInIcon,
                        imageType: ImageType.png,
                      ),
                    ),
                    CustomText(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      text: AppStrings.login,
                      color: AppColors.black,
                      bottom: 12.h,
                      top: 24.h,
                    ),
                    CustomText(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      text: AppStrings.loginToContinueUsingTheApp,
                      color: AppColors.grayNormal,
                      bottom: 25.h,
                    ),
                  ],
                ),
              ),

              ///====================================Email Field======================
              CustomText(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                text: AppStrings.email,
                color: AppColors.black,
                bottom: 8.h,
              ),
              const CustomTextField(
                fillColor: AppColors.selectNavbarColor,
                hintText: AppStrings.email,
                hintStyle: TextStyle(color: AppColors.normalBlack),
              ),

              ///====================================Password ==============================
              CustomText(
                top: 10.h,
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                text: AppStrings.password,
                color: AppColors.black,
                bottom: 8.h,
              ),
              const CustomTextField(
                fillColor: AppColors.selectNavbarColor,
                isPassword: true,
                hintText: AppStrings.password,
                hintStyle: TextStyle(color: AppColors.normalBlack),
              ),
                 ///================================Forgot password screen======================
              Row(
                children: [
                  const SizedBox(),
                  const Spacer(),
                  InkWell(
                    onTap: (){
                      Get.toNamed(AppRoutes.forgetPassword);
                    },
                    child: CustomText(
                      top: 10.h,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      text: AppStrings.forgotPassword,
                      color: AppColors.buttonColor,
                      bottom: 24.h,
                    ),
                  ),
                ],
              ),

              ///======================================Log In Button==================
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.homeScreen);
                },
                title: AppStrings.login,
                fillColor: AppColors.appBarBackground
              ),

              SizedBox(
                height: 84.h,
              ),

              ///=======================================Sign Up Button===================
              Center(
                child: RichText(
                  textAlign: TextAlign.center,
                  maxLines: 2,
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: AppStrings.dontHaveAnAccount,
                        style: TextStyle(
                          color: AppColors.black,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.sp,
                        ),
                      ),
                      TextSpan(
                        text: AppStrings.signUp,
                        style: TextStyle(
                          color: AppColors.blueNormal,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w500,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.toNamed(AppRoutes.signUpScreen);
                          },
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
