import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/custom_widgets/custom_widgets.dart';
import 'package:track_booking/view/widgets/user_nav_bar/user_nav_bar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final CustomWidgets customWidgets = CustomWidgets();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const UserNavBar(currentIndex: 3),

      ///===============================Profile Appbar=====================
      appBar: AppBar(
        actions: [
          ///==============================Edit profile Icon=================
          InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.editProfileScreen);
              },
              child: const CustomImage(
                imageSrc: AppIcons.editIcon,
                imageType: ImageType.svg,
              )),
          SizedBox(
            width: 10.w,
          ),
        ],

        backgroundColor: AppColors.appBarBackground,
        title: CustomText(
          text: AppStrings.profile,
          color: AppColors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 24.h),
          child: Column(
            children: [
              ///<<<<========================================Profile Image======================================
              Container(
                padding: EdgeInsets.only(
                    top: 24.h, bottom: 24.h, left: 39.w, right: 39.w),
                decoration: BoxDecoration(
                  border: Border.all(color: AppColors.borderColor),
                ),
                child: Column(
                  children: [
                    CustomNetworkImage(
                        boxShape: BoxShape.circle,
                        imageUrl: AppConstants.userNtr,
                        height: 78.h,
                        width: 84.w),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        CustomText(
                          text: AutofillHints.username,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                        CustomText(
                          text: ":  Md. Mehedi Hassan",
                          fontWeight: FontWeight.w400,
                          fontSize: 14.sp,
                          color: Colors.black,
                        ),
                      ],
                    )
                  ],
                ),
              ),

              SizedBox(
                height: 24.h,
              ),
              Container(
                padding:
                EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: AppColors.background,
                  border: Border.all(
                    color: AppColors.borderColor,
                    width: 2.0,
                    style: BorderStyle.solid, // Specify the border style
                  ),
                  borderRadius:
                  BorderRadius.circular(8.r), // Added border radius
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: AppStrings.personalInformation,
                      color: AppColors.personalInformation,
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                      bottom: 16.h,
                    ),

                    ///============================Name========================
                    customWidgets.customProfile(
                        title: AppStrings.name, subTitle: 'Masum Raj'),

                    ///============================phone Number================
                    customWidgets.customProfile(
                        title: AppStrings.phoneNumber,
                        subTitle: "+1 145528 455265"),

                    ///================================Email=====================
                    customWidgets.customProfile(
                        title: AppStrings.email, subTitle: 'masum@gmail.com'),

                    ///===============================Address======================
                    customWidgets.customProfile(
                        title: AppStrings.address,
                        subTitle: "Bushwick Brooklyn, NY, USA"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
