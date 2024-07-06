import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_images/app_images.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class ForgetOtp extends StatelessWidget {
  const ForgetOtp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor:
        AppColors.background,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20.h),
              ///===============================otp icon=====================
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
                        imageSrc: AppImages.otpIcon,
                        imageType: ImageType.png,
                      ),
                    ),
                    ///=======================Otp verification===========================
                    CustomText(
                      fontSize: 24.sp,
                      fontWeight: FontWeight.w500,
                      text: AppStrings.otpVerification,
                      color: AppColors.black,
                      bottom: 12.h,
                      top: 24.h,
                    ),
                    CustomText(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      text: AppStrings.enterTheVerificationCodeWeJust,
                      color: AppColors.grayNormal,
                      maxLines: 5,
                      bottom: 40.h,
                    ),
                  ],
                ),
              ),
              CustomText(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                text: AppStrings.cancel,
                color: AppColors.white,
                bottom: 12.h,
              ),
              ///====================================Pin Code text field=============================
              PinCodeTextField(
                textStyle: const TextStyle(color: AppColors.white),
                keyboardType: TextInputType.phone,
                autoDisposeControllers: false,
                cursorColor: AppColors.appBarBackground,
                appContext: context,
                onCompleted: (value) {
                  // Handle OTP completion
                },
                validator: (value) {
                  if (value!.length == 6) {
                    return null; // Input is valid
                  } else {
                    return "Please enter a 6-digit OTP code"; // Input is invalid
                  }
                },
                autoFocus: true,
                pinTheme: PinTheme(
                  disabledColor: Colors.transparent,
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(12.r),
                  fieldHeight: 49.h,
                  fieldWidth: 47.w,
                  activeFillColor: AppColors.appBarBackground,
                  selectedFillColor: AppColors.selectNavbarColor,
                  inactiveFillColor: AppColors.borderColor,
                  borderWidth: 0.5,
                  activeBorderWidth: 0.8,
                  selectedColor: AppColors.grayNormal,
                  inactiveColor: AppColors.selectNavbarColor,
                  activeColor: AppColors.blueNormal,
                ),
                length: 4,
                enableActiveFill: true,
              ),
              ///=============================Resend button====================
              Row(
                children: [
                  const Spacer(),
                  CustomText(
                    text: AppStrings.resend,
                    color: AppColors.blueNormal,
                    fontSize: 16.sp,
                  ),
                ],
              ),
              SizedBox(height: 91.h),
              ///======================================verify button==================
              CustomButton(
                onTap: () {
                 Get.toNamed(AppRoutes.resetPassword);
                },
                title: AppStrings.verify,
                fillColor: AppColors.appBarBackground,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
