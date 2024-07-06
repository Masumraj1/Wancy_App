import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/user_screen/authentication_screens/authentication_controller/authentication_controller.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:track_booking/view/widgets/custom_widgets/custom_widgets.dart';

class PrimaryInfoForm extends StatelessWidget {
  PrimaryInfoForm({super.key});

  final CustomWidgets customWidgets = CustomWidgets();

  final AuthenticationController authenticationController = Get.find<
      AuthenticationController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          ///================Primary info==============
          CustomText(
            text: AppStrings.primaryInfo,
            fontSize: 17.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black,
            bottom: 10.h,
          ),

          ///===================Name===============
          customWidgets.customEditProfile(
              title: AppStrings.name, controller: TextEditingController()),

          ///===================Phone Number===============
          CustomText(
            color: AppColors.black,
            text: AppStrings.phoneNumber,
            fontWeight: FontWeight.w400,
            fontSize: 16.w,
            bottom: 8,
          ),
          CustomTextField(
            textEditingController: TextEditingController(),
            inputTextStyle: const TextStyle(color: AppColors.black),
            fillColor: AppColors.selectNavbarColor,
            fieldBorderColor: AppColors.borderColor,
            keyboardType:TextInputType.phone,
          ),
          SizedBox(
            height: 15.h,
          ),
          ///===================Email===============
          customWidgets.customEditProfile(
              title: AppStrings.email, controller: TextEditingController()),

          ///===================password===============
          customWidgets.customEditProfile(
            isPassword: true,

              title: AppStrings.password, controller: TextEditingController()),

          ///===================confirm password===============
          customWidgets.customEditProfile(
            isPassword: true,
              title: AppStrings.confirmPassword,
              controller: TextEditingController()),

          ///==================Next button=============
          CustomButton(
            onTap: () {
              authenticationController.updateStep(1);
            },
            title: AppStrings.next,
            fillColor: AppColors.appBarBackground,
          )
        ],
      ),
    );
  }
}