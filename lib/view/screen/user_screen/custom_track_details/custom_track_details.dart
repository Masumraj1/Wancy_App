import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class CustomTrackDetails extends StatelessWidget {
  final String title;
  final List<Widget> children;

  const CustomTrackDetails({
    super.key,
    required this.title,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.background,
        border: Border.all(
          color: AppColors.borderColor,
          width: 2.0,
          style: BorderStyle.solid,
        ),
        borderRadius: BorderRadius.circular(8.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomText(
            text: title,
            color: AppColors.personalInformation,
            fontSize: 16.sp,
            fontWeight: FontWeight.w400,
            bottom: 16.h,
          ),
          ...children,
        ],
      ),
    );
  }
}
