import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_name_widgets/custom_name_widgets.dart';

class CustomProfileHeader extends StatelessWidget {
  final String profileImageUrl;
  final String rating;
  final String name;
  final String phoneNumber;
  final String email;

  const CustomProfileHeader({
    super.key,
    required this.profileImageUrl,
    required this.rating,
    required this.name,
    required this.phoneNumber,
    required this.email,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 24.h, horizontal: 39.w),
      decoration: BoxDecoration(
        border: Border.all(color: AppColors.borderColor),
      ),
      child: Column(
        children: [
          CustomNetworkImage(
            boxShape: BoxShape.circle,
            imageUrl: profileImageUrl,
            height: 78.h,
            width: 84.w,
          ),
          SizedBox(height: 12.h),
          CustomNameWidget(label: AppStrings.rating, value: rating),
          CustomNameWidget(label: AppStrings.name, value: name),
          CustomNameWidget(label: AppStrings.phoneNumber, value: phoneNumber),
          CustomNameWidget(label: AppStrings.email, value: email),
        ],
      ),
    );
  }
}
