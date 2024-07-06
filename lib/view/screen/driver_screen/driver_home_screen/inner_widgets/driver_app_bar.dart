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

class DriverAppBar extends StatelessWidget {
  const DriverAppBar({
    super.key,
    required this.scaffoldKey,
  });

  final GlobalKey<ScaffoldState> scaffoldKey;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: AppColors.appBarBackground,
      margin: EdgeInsets.only(
        top: 32.h,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 17, vertical: 15),
      child: Column(
        children: [
          ///====================================Top Section================================
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  ///==================== Profile image =====================
                  CustomNetworkImage(
                      boxShape: BoxShape.circle,
                      imageUrl: AppConstants.userNtr,
                      height: 60,
                      width: 60),

                  SizedBox(
                    width: 16.w,
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: AppStrings.welcome,
                        fontWeight: FontWeight.w600,
                        color: AppColors.white,
                        fontSize: 16.sp,
                      ),

                      ///=====================user name =======================
                      CustomText(
                        text: 'Masum Raj',
                        fontWeight: FontWeight.w400,
                        fontSize: 14.sp,
                        color: AppColors.white,
                      )
                    ],
                  )
                ],
              ),
              SizedBox(
                width: 50.w,
              ),
              // IconButton(
              //     onPressed: () {
              //       Get.toNamed(AppRoutes.notificationScreen);
              //     },
              //     icon: const Icon(
              //       Icons.notification_add,
              //       color: Colors.white,
              //     )),
              GestureDetector(
                onTap: (){
                  Get.toNamed(AppRoutes.notificationScreen);
                },
                child: CustomImage(
                  imageSrc: AppIcons.notification,
                  imageType: ImageType.svg,
                ),
              ),

              ///==========================Drawer button ====================
              GestureDetector(
                  onTap: () {
                    scaffoldKey.currentState?.openDrawer();
                  },
                  child: const CustomImage(imageSrc: AppIcons.drawer))
            ],
          ),
        ],
      ),
    );
  }
}
