import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/driver_nav_bar/driver_nav_bar.dart';
import 'package:track_booking/view/widgets/user_nav_bar/user_nav_bar.dart';

class DriverInboxScreen extends StatelessWidget {
  const DriverInboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      ///=========================Inbox appbar===============
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        title: const CustomText(
          text: "Inbox",
          fontWeight: FontWeight.w600,
          fontSize: 16,
          color: AppColors.white,
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: const DriverNavBar(currentIndex: 1),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Get.toNamed(AppRoutes.messageScreen);
            },
            child: Container(
              padding: EdgeInsets.all(20.r),
              child: ListTile(
                ///<=================== This is the  image section ==========================>

                leading: CustomNetworkImage(
                    boxShape: BoxShape.circle,
                    imageUrl: AppConstants.userNtr,
                    height: 40.h,
                    width: 40.w),

                ///<=========================== This is the title ==================>

                title: const CustomText(
                  textAlign: TextAlign.start,
                  text: "Heaven Salon",
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: AppColors.black,
                ),

                ///<=========================== This is the subtitle ==================>

                subtitle: const CustomText(
                  textAlign: TextAlign.start,
                  text: "Currently we have big discount offer.",
                  fontSize: 12,
                  maxLines: 2,
                  fontWeight: FontWeight.w400,
                  color: AppColors.normalBlack,
                ),

                ///<============== This is the time ========================>

                trailing: const CustomText(
                  text: "3.25 PM",
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
