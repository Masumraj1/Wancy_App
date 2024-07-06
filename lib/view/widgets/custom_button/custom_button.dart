import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';

import '../custom_text/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.height = 48,
    this.width = double.maxFinite,
    required this.onTap,
    this.title = AppStrings.welcome,
    this.marginVertical = 0,
    this.marginHorizontal = 0,
    this.fillColor,
    this.textColor = AppColors.white,
    this.isBorder = false,
  });

  final double height;
  final double? width;
  final Color? fillColor;
  final Color textColor;
  final VoidCallback onTap;
  final String title;
  final double marginVertical;
  final double marginHorizontal;
  final bool isBorder;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(
            vertical: marginVertical, horizontal: marginHorizontal),
        alignment: Alignment.center,
        height: height,
        width: width,
        decoration: BoxDecoration(
          border: isBorder ? Border.all(color: textColor) : null,
          borderRadius: BorderRadius.circular(8.r),
          color: fillColor,
        ),
        child: CustomText(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: textColor,
          textAlign: TextAlign.center,
          text: title,
        ),
      ),
    );
  }
}
