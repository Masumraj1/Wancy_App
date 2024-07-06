import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  ///====================================Delete Account=============================
  void showDialogBox(BuildContext context) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.white,
        content: SizedBox(
          height: 320.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const SizedBox(),
                  const Spacer(),
                  GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: const CustomImage(
                        imageSrc: AppIcons.x,
                        imageType: ImageType.svg,
                      ))
                ],
              ),

              ///==========================Delete Account===============
              CustomText(
                left: 50,
                fontSize: 20.sp,
                text: AppStrings.deleteAccount,
                fontWeight: FontWeight.w500,
                color: AppColors.black,
                bottom: 10,
              ),
              CustomText(
                textAlign: TextAlign.start,
                text: AppStrings.areYouSureYou,
                fontWeight: FontWeight.w400,
                color: AppColors.black,
                fontSize: 14.sp,
                maxLines: 2,
              ),
              CustomText(
                top: 16,
                text: "Password",
                fontWeight: FontWeight.w500,
                fontSize: 16.sp,
                color: AppColors.appBarBackground,
                bottom: 16,
              ),

              ///======================================Password Field==================
              const CustomTextField(
                hintText: "password",
                isPassword: true,
                fillColor: AppColors.selectNavbarColor,
                fieldBorderColor: AppColors.white,
              ),
              SizedBox(
                height: 20.h,
              ),

              Row(
                children: [
                  ///=================================Yes Button============================
                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.yesButtonColor),
                      ),
                      onPressed: () {},
                      child: CustomText(
                        text: AppStrings.yes,
                        color: Colors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight
                            .w600, // Make sure the text color contrasts with the button color
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 8.w,
                  ),

                  ///===================================Cancel Button=====================
                  Expanded(
                    flex: 5,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            AppColors.cancelButtonColor),
                      ),
                      onPressed: () {
                        Get.back();
                      },
                      child: CustomText(
                        text: AppStrings.cancel,
                        color: AppColors.white,
                        fontSize: 14.sp,
                        fontWeight: FontWeight
                            .w600, // Make sure the text color contrasts with the button color
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      ///<<<<<========================================settings AppBar ============================
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.white,
        ),
        backgroundColor: AppColors.appBarBackground,
        centerTitle: true,
        title: CustomText(
          text: AppStrings.settings,
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            Row(
              children: [
                const CustomImage(
                  imageSrc: AppIcons.lock,
                  imageType: ImageType.svg,
                ),
                SizedBox(
                  width: 10.w,
                ),

                ///<<<<<========================================Change password Button ============================
                GestureDetector(
                  onTap: () {
                    Get.toNamed(AppRoutes.changePasswordScreen);
                  },
                  child: CustomText(
                    text: AppStrings.changePassword,
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40.h,
            ),

            ///<<<<<========================================Delete Account Button ============================
            GestureDetector(
              onTap: () {
                showDialogBox(context);
              },
              child: Row(
                children: [
                  const CustomImage(
                    imageSrc: AppIcons.remove,
                    imageType: ImageType.svg,
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  CustomText(
                    text: AppStrings.deleteAccount,
                    color: AppColors.black,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
