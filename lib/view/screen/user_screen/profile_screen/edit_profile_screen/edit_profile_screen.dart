import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_text_field/custom_text_field.dart';
import 'package:track_booking/view/widgets/custom_widgets/custom_widgets.dart';

import '../profile_controller/profile_controller.dart';

class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key});

  final ProfileController profileController = Get.find<ProfileController>();
  final CustomWidgets customWidgets = CustomWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      ///<<<<========================================EditProfile AppBar======================================
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.white,
        ),
        backgroundColor: AppColors.appBarBackground,
        title: CustomText(
          text: AppStrings.editProfile,
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: SingleChildScrollView(
          child: Obx(
             () {
              return Column(
                children: [
                  ///<<<<========================================Edit Image======================================

                  Align(
                    alignment: Alignment.center,
                    child: GestureDetector(
                      onTap: () {
                        profileController.selectImage();
                      },
                      child: profileController.image.isNotEmpty
                          ? Container(
                              height: 100.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: FileImage(
                                      File(profileController.image.value),
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                  shape: BoxShape.circle),
                            )
                          : CustomNetworkImage(
                            imageUrl: AppConstants.userNtr,
                            height: 78.h,
                            width: 84.w,
                          ),
                    ),
                  ),



               SizedBox(
                 height: 20.h,
               ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      border: Border.all(
                        color: AppColors.borderColor,
                        width: 2.0,
                        style: BorderStyle.solid, // Specify the border style
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///========================personal information==================
                        CustomText(
                          text: AppStrings.personalInformation,
                          color: AppColors.appBarBackground,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                          bottom: 16,
                        ),

                        ///==================================Name===================
                        customWidgets.customEditProfile(
                            title: AppStrings.name,
                            controller: TextEditingController()),

                        ///=================================phone Number=================

                        CustomText(
                          color: AppColors.black,
                          text: AppStrings.phoneNumber,
                          fontWeight: FontWeight.w400,
                          fontSize: 16.w,
                          bottom: 13,
                        ),
                        const CustomTextField(
                          // textEditingController: controller,
                          inputTextStyle:
                              TextStyle(color: AppColors.selectNavbarColor),
                          fillColor: AppColors.selectNavbarColor,
                          fieldBorderColor: AppColors.borderColor,
                          keyboardType: TextInputType.phone,
                        ),
                        SizedBox(
                          height: 24.h,
                        ),

                        ///===============================Email ========================
                        customWidgets.customEditProfile(
                            title: AppStrings.email,
                            controller: TextEditingController()),

                        ///====================================Address====================
                        customWidgets.customEditProfile(
                            title: AppStrings.address,
                            controller: TextEditingController()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24.h,
                  ),

                  ///<<<<========================================Save And Update Button======================================
                  CustomButton(
                    onTap: () {
                      Get.back();
                    },
                    title: AppStrings.save,
                    fillColor: AppColors.appBarBackground,
                  )
                ],
              );
            }
          ),
        ),
      ),
    );
  }
}
