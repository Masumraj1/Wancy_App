import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

import '../custom_text_field/custom_text_field.dart';

class CustomWidgets {
  ///==============================Custom side drawer=========================
  Widget customRow(
          {required String title,
          required String icon,
          required VoidCallback onTap}) =>
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Row(
              children: [
                CustomImage(
                  imageSrc: icon,
                  imageType: ImageType.svg,
                ),
                CustomText(
                  color: AppColors.buttonColor,
                  left: 16.w,
                  text: title,
                  fontSize: 14.w,
                  fontWeight: FontWeight.w400,
                ),
              ],
            )),
      );

  ///================================Custom Profile===================
  Widget customProfile({required String title, required String subTitle}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            color: AppColors.black,
            text: title,
            fontWeight: FontWeight.w400,
            fontSize: 16.w,
            bottom: 8,
          ),
          CustomText(
            color: AppColors.normalBlack,
            text: subTitle,
            fontWeight: FontWeight.w400,
            fontSize: 14.w,
            bottom: 20,
          ),
        ],
      );

  ///================================Custom More Profile===================
  Widget customMoreProfile({required String title, required String subTitle}) =>
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            color: AppColors.black,
            text: title,
            fontWeight: FontWeight.w400,
            fontSize: 16.w,
            bottom: 8,
          ),
          const Spacer(),
          CustomText(
            color: AppColors.normalBlack,
            text: subTitle,
            fontWeight: FontWeight.w400,
            fontSize: 14.w,
            bottom: 20,
          ),
        ],
      );

  ///================================Custom EditProfile===================
  Widget customEditProfile({
    required String title,
    required TextEditingController controller,
    bool isPassword = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          color: AppColors.black,
          text: title,
          fontWeight: FontWeight.w400,
          fontSize: 16.w,
          bottom: 8,
        ),
        CustomTextField(
          isPassword: isPassword,
          textEditingController: controller,
          inputTextStyle: const TextStyle(color: AppColors.black),
          fillColor: AppColors.selectNavbarColor,
          fieldBorderColor: AppColors.borderColor,
          keyboardType:
              isPassword ? TextInputType.phone : TextInputType.name,
        ),
        SizedBox(
          height: 15.h,
        )
      ],
    );
  }
}
