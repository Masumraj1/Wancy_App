
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

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(backgroundColor: AppColors.background,),
      body: Padding(
        padding:
        const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///===============================forget Password=====================

                       SizedBox(
                         height: 100.h,
                       ),
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 166.h,
                      width: 166.w,
                      decoration: const BoxDecoration(
                        color: AppColors.blueLight,
                        shape: BoxShape.circle,
                      ),
                      child: const CustomImage(
                        imageSrc: AppImages.forgetIcon,
                        imageType: ImageType.png,
                      ),
                    ),
                    CustomText(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      text: AppStrings.forgetPassword,
                      color: AppColors.black,
                      bottom: 12.h,
                      top: 24.h,
                    ),
                    CustomText(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      text: AppStrings.dontWorryItOccurs,
                      color: AppColors.black,
                      maxLines: 5,
                      bottom: 28,
                    ),
                  ],
                ),
              ),

              CustomText(
                fontSize: 16.sp,
                fontWeight: FontWeight.w400,
                text: AppStrings.enterYourEmail,
                color: AppColors.black,
                bottom: 12.h,
                top: 24.h,
              ),
              ///====================================Email Field======================
              const CustomTextField(
                fillColor: AppColors.selectNavbarColor,
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: AppColors.black,
                ),
                isPrefixIcon: true,
                hintText: AppStrings.enterYourEmail,
                hintStyle: TextStyle(color: AppColors.normalBlack),
              ),
              SizedBox(
                height: 24.h,
              ),

              ///======================================send A code Button==================
              CustomButton(
                onTap: () {
                  Get.toNamed(AppRoutes.forgetOtp);
                },
                title: AppStrings.sendCode,
                fillColor: AppColors.appBarBackground,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
