import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/utils/app_images/app_images.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/driver_screen/driver_home_screen/driver_home_controller/driver_home_controller.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_widgets/custom_widgets.dart';

class DriverSideDrawer extends StatelessWidget {
  DriverSideDrawer({super.key});

  final CustomWidgets customWidget = CustomWidgets();

  final DriverHomeController driverHomeController =
      Get.find<DriverHomeController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(top: 35, right: 20, bottom: 5),
            width: MediaQuery.of(context).size.width / 1.3,
            color: AppColors.drawerContainer,
            height: 100.h,
            child: const CustomImage(
              imageSrc: AppImages.logo,
              imageType: ImageType.png,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            height: MediaQuery.of(context).size.height,
            color: AppColors.white,
            width: MediaQuery.of(context).size.width / 1.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///===========================Customer care===================
                customWidget.customRow(
                  onTap: () {
                    driverHomeController.launchPhone('01731090564');
                  },
                  title: AppStrings.customerCare,
                  icon: AppIcons.customCare,
                ),

                ///=========================Terms and condition=================
                customWidget.customRow(
                  onTap: () {
                    Get.toNamed(AppRoutes.termsAndConditionScreen);
                  },
                  title: AppStrings.termsAndConditions,
                  icon: AppIcons.terms,
                ),

                ///======================================privacy policy================
                customWidget.customRow(
                  onTap: () {
                    Get.toNamed(AppRoutes.privacyPolicyScreen);
                  },
                  title: AppStrings.privacyPolicy,
                  icon: AppIcons.privacy,
                ),

                ///===============================Feedback ==================
                customWidget.customRow(
                  onTap: () {
                    Get.toNamed(AppRoutes.feedbackScreen);
                  },
                  title: AppStrings.feedBack,
                  icon: AppIcons.feedBack,
                ),

                ///============================Settings====================
                customWidget.customRow(
                  onTap: () {
                    Get.toNamed(AppRoutes.settingScreen);
                  },
                  title: AppStrings.settings,
                  icon: AppIcons.settings,
                ),

                SizedBox(
                  height: 100.h,
                ),

                ///============================Log Out====================
                customWidget.customRow(
                  onTap: () {
                    Get.toNamed(AppRoutes.onBoardScreen);
                  },
                  title: AppStrings.logOut,
                  icon: AppIcons.logOut,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
