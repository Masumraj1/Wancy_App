
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/user_screen/custom_profile_header/custom_profile_header.dart';
import 'package:track_booking/view/screen/user_screen/custom_profile_item/custom_profile_item.dart';
import 'package:track_booking/view/screen/user_screen/custom_track_details/custom_track_details.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/driver_nav_bar/driver_nav_bar.dart';


class DriverProfileScreen extends StatelessWidget {
  const DriverProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      bottomNavigationBar: const DriverNavBar(currentIndex: 2),

      ///===============================Profile Appbar=====================
      appBar: AppBar(
        actions: [
          ///==============================Edit profile Icon=================
          InkWell(
              onTap: () {
                Get.toNamed(AppRoutes.driverEditProfile);
              },
              child: const CustomImage(
                imageSrc: AppIcons.editIcon,
                imageType: ImageType.svg,
              )),
          SizedBox(width: 10.w),
        ],

        ///==========================back button======================
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.selectNavbarColor,
        ),
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
              ///==================Custom profile header==========
              CustomProfileHeader(
                profileImageUrl: AppConstants.userNtr,
                rating: ' 4.5',
                name: ' Md Masum Raj',
                phoneNumber: ' 01722983931',
                email: 'masumran927@gmail.com',
              ),
              SizedBox(height: 24.h),
              ///==================Custom Track Details======================
              CustomTrackDetails(
                title: AppStrings.truckDetails,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        color: AppColors.black,
                        text: AppStrings.image,
                        fontWeight: FontWeight.w400,
                        fontSize: 16.w,
                      ),
                      const Spacer(),
                      CustomNetworkImage(
                        borderRadius: BorderRadius.circular(10),
                        imageUrl: AppConstants.userNtr,
                        height: 48.h,
                        width: 76.w,
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  ///====================Reg Number============
                  const CustomProfileItem(
                      title: AppStrings.regNumber, subTitle: '12458693455'),
                  ///==================== Total Trip============

                  const CustomProfileItem(
                      title: AppStrings.totalTrip,
                      subTitle: '150'),
                ],
              ),
              SizedBox(height: 15.h),
              ///===================Track info===============
              CustomTrackDetails(
                title: AppStrings.truckInfo,
                children: [
                  ///=====================Driving licence============
                  const CustomProfileItem(
                    title: AppStrings.drivingLicenceNumber,
                    subTitle: '124568369',
                  ),

                  ///==================expire date===============
                  const CustomProfileItem(
                    title: AppStrings.drivingLicenceExpireDate,
                    subTitle: '0 August 2025',
                  ),
                  ///===================Lecence image=============
                  CustomText(
                    top: 10.h,
                    color: AppColors.black,
                    text: AppStrings.licenceImage,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    bottom: 8.h,
                  ),
                  const CustomImage(
                    imageSrc: AppIcons.gallery,
                    imageType: ImageType.svg,
                  ),
                  ///======================Document image=============
                  CustomText(
                    top: 10.h,
                    color: AppColors.black,
                    text: AppStrings.registrationDocumentImage,
                    fontWeight: FontWeight.w400,
                    fontSize: 16.sp,
                    bottom: 8.h,
                  ),
                  const CustomImage(
                    imageSrc: AppIcons.gallery,
                    imageType: ImageType.svg,
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  ///======================Track size============
                  const CustomProfileItem(
                    title: AppStrings.truckSize,
                    subTitle: '19 fit',
                  ),

                  ///========================Products Carry================
                  const CustomProfileItem(
                    title: AppStrings.productsCarry,
                    subTitle: '2 Ton',
                  ),
                ],
              ),
              SizedBox(height: 15.h),
              ///============================Bank info==================
              const CustomTrackDetails(
                title: AppStrings.bankInfo,
                children: [
                  ///============================Bank account number================
                  CustomProfileItem(
                    title: AppStrings.bankAccountNumber,
                    subTitle: '21458965581452',
                  ),
                  ///============================bank Name================
                  CustomProfileItem(
                    title: AppStrings.bankName,
                    subTitle: 'Bangladesh Bank',
                  ),
                  ///============================Routing number================
                  CustomProfileItem(
                    title: AppStrings.routingNumber,
                    subTitle: '21458965581452',
                  ),
                  ///============================Account holder name================
                  CustomProfileItem(
                    title: AppStrings.accountHolderName,
                    subTitle: 'Masum raj',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
