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

class OnBoardScreen extends StatelessWidget {
  const OnBoardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 25.h),
        child: Column(
          children: [
            SizedBox(height: 50.h),
            CustomText(
              text: AppStrings.hireBookTruckPickup,
              color: AppColors.buttonColor,
              fontWeight: FontWeight.w500,
              fontSize: 40.sp,
              maxLines: 2,
              bottom: 31.h,
            ),
            ///=========================Image==================
            const CustomImage(
              imageSrc: AppImages.onBoardImages,
              imageType: ImageType.png,
            ),
            SizedBox(height: 40.h),
            CustomText(
              bottom: 30.h,
              fontSize: 12.sp,
              maxLines: 6,
              fontWeight: FontWeight.w400,
              textAlign: TextAlign.center,
              color: Colors.black,
              text:
              'Welcome to EasyTruck! Effortlessly book trucks for all your transportation needs. Enjoy fast, reliable, and hassle-free service with real-time tracking and transparent pricing. Get started now!',
            ),

            ///============================Login as a user button===================
            CustomButton(
              onTap: () {
                Get.toNamed(AppRoutes.signInScreen);
              },
              title: AppStrings.loginAsAUser,
              fillColor: AppColors.appBarBackground,
              textColor: Colors.white,
            ),
            SizedBox(height: 18.h),

            ///============================Login as a driver=====================
            CustomButton(
              isBorder: true,

              onTap: () {
                Get.toNamed(AppRoutes.driverSignUp);
              },
              title: AppStrings.loginAsADriver,
              fillColor: AppColors.white,
              textColor: AppColors.appBarBackground,
            ),
          ],
        ),
      ),
    );
  }
}
