import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class CustomProfileItem extends StatelessWidget {
  final String title;
  final String subTitle;

  const CustomProfileItem({
    super.key,
    required this.title,
    required this.subTitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          color: Colors.black,
          text: title,
          fontWeight: FontWeight.w500,
          fontSize: 16.sp,
        ),
        CustomText(
          color: Colors.black,
          text: subTitle,
          fontWeight: FontWeight.w300,
          fontSize: 12.sp,
        ),
        SizedBox(height: 8.h),
      ],
    );
  }
}
