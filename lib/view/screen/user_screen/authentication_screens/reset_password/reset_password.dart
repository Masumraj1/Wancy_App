import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              ///===============================Confirm password=====================
              SizedBox(height: 100.h),
              CustomText(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
                text: AppStrings.confirmPassword,
                color: AppColors.black,
                bottom: 8.h,
              ),

              ///=============================Your new password====================
              CustomText(
                fontSize: 12.sp,
                maxLines: 2,
                fontWeight: FontWeight.w400,
                text: AppStrings.yourNewPasswordMustBe,
                color: AppColors.black,
                bottom: 100.h,
              ),

              ///====================================Password Field======================
              const CustomTextField(
                fillColor: AppColors.selectNavbarColor,
                hintText: AppStrings.password,
                hintStyle: TextStyle(color: AppColors.normalBlack),
                isPassword: true,
              ),
              SizedBox(height: 24.h),

              ///============================Confirm password========================
              const CustomTextField(
                fillColor: AppColors.selectNavbarColor,
                hintText: AppStrings.confirmPassword,
                hintStyle: TextStyle(color: AppColors.normalBlack),
                isPassword: true,
              ),
              SizedBox(height: 24.h),

              ///======================================Save button==================
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.signInScreen);
                },
                title: AppStrings.save,
                fillColor: AppColors.appBarBackground,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
