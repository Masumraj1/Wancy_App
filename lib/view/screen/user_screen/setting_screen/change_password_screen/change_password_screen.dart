
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';

class ChangePasswordScreen extends StatelessWidget {
  ChangePasswordScreen({super.key});
  final formKey = GlobalKey<FormState>() ;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      ///<<<<========================================Change Password AppBar======================================
      appBar: AppBar(
        leading: IconButton(onPressed: (){
          Get.back();
        }, icon: const Icon(Icons.arrow_back),color: AppColors.white,),
        title: CustomText(
          text: AppStrings.changePassword,
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        backgroundColor: AppColors.appBarBackground,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Form(
            // key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: AppStrings.currentPassword,
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  bottom: 10,
                ),

                ///<<<<========================================Current Password Field======================================
                const CustomTextField(
                  hintText: AppStrings.password,
                  // textEditingController:profileController.currentPasswordController ,
                  keyboardType: TextInputType.name,
                  isPassword: true,
                  fillColor: AppColors.selectNavbarColor,
                  fieldBorderColor: AppColors.selectNavbarColor,
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return AppStrings.fieldCantBeEmpty;
                  //   } else if (value.length < 6 &&
                  //       !AppStrings.passRegExp.hasMatch(value)) {
                  //     return AppStrings.passwordValidatorString;
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),

                CustomText(
                  text: AppStrings.newPassword,
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  bottom: 10,
                  top: 27,
                ),

                ///<<<<========================================NewPassword Field======================================
                const CustomTextField(
                  isPassword: true,
                  fillColor: AppColors.selectNavbarColor,
                  fieldBorderColor: AppColors.selectNavbarColor,
                  // textEditingController: profileController.newPasswordController,
                  keyboardType: TextInputType.name,
                  hintText: AppStrings.password,
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return AppStrings.fieldCantBeEmpty;
                  //   } else if (value.length < 6 &&
                  //       !AppStrings.passRegExp.hasMatch(value)) {
                  //     return AppStrings.passwordValidatorString;
                  //   } else {
                  //     return null;
                  //   }
                  // },
                ),

                CustomText(
                  text: AppStrings.confirmPassword,
                  color: AppColors.black,
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w400,
                  bottom: 10,
                  top: 27,
                ),

                ///<<<<========================================Confirm Password Field======================================
                const CustomTextField(
                  // textEditingController: profileController.confirmPasswordController,
                  keyboardType: TextInputType.name,
                  hintText: AppStrings.password,
                  fillColor: AppColors.selectNavbarColor,
                  fieldBorderColor: AppColors.drawerContainer,
                  isPassword: true,
                  // validator: (value) {
                  //   if (value.isEmpty) {
                  //     return AppStrings.fieldCantBeEmpty;
                  //   } else if (value != profileController.newPasswordController.text) {
                  //     return " Password should match";
                  //   }
                  //   return null;
                  // },
                ),
                SizedBox(
                  height: 150.h,
                ),

                ///<<<<========================================Save And Update Button======================================
                Center(
                  child: CustomButton(
                    fillColor: AppColors.appBarBackground,
                    width: double.infinity,
                    onTap: () {
                      Get.back();
                    },
                    title: AppStrings.changePassword,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}