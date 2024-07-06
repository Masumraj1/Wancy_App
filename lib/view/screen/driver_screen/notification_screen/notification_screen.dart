import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      ///=====================Notification Appbar================
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColors.appBarBackground,
        title: CustomText(
          text: AppStrings.notifications,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.white,
        ),
      ),

      // Body with ListView builder
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
        child: ListView.builder(
          itemCount: 5, // Assuming 5 notifications for the example
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 16.h), // Added padding between items
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Notification icon
                  const CustomImage(
                    imageSrc: AppIcons.notification,
                    imageType: ImageType.svg,
                    imageColor: AppColors.black,
                  ),
                  SizedBox(width: 18.w),

                  // Notification text details
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            CustomText(
                              textAlign: TextAlign.left,
                              text: 'New Trip',
                              color: AppColors.black,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                            const Spacer(),
                            CustomText(
                              textAlign: TextAlign.left,
                              text: '4 hours ago',
                              color: AppColors.normalBlack,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        CustomText(
                          textAlign: TextAlign.start,
                          maxLines: 3,
                          text: "\$452 offered by a truck owner for your trip.",
                          fontWeight: FontWeight.w400,
                          fontSize: 12.sp,
                          color: AppColors.black,
                        ),
                        SizedBox(height: 10.h),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
