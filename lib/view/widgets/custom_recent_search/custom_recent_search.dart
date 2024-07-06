import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class CustomRecentSearch extends StatelessWidget {
  final String title;
  final String subtitle;

  const CustomRecentSearch({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const CustomImage(
              imageSrc: AppIcons.refresh, // Adjust icon path as needed
              imageType: ImageType.svg,
            ),
            SizedBox(width: 24.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                  text: title,
                  color: AppColors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 16.sp,
                  bottom: 12.h,
                ),
                CustomText(
                  text: subtitle,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 12.h),
        const Divider(color: AppColors.normalBlack),
        SizedBox(height: 12.h),
      ],
    );
  }
}
