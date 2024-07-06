import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';

class CustomSearchCard extends StatelessWidget {
  const CustomSearchCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.cardColor,
      child: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildSearchRow(
              icon: AppIcons.container,
              hintText: 'ul. Działkowa 67, Szczecin 71-755',
            ),
            Container(
              height: 1.h,
              color: Colors.grey,
              margin: EdgeInsets.symmetric(vertical: 10.h),
            ),
            _buildSearchRow(
              icon: AppIcons.location,
              hintText: 'Where to go?',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchRow({required String icon, required String hintText}) {
    return Row(
      children: [
        CustomImage(
          imageSrc: icon,
          imageType: ImageType.svg,
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }
}
