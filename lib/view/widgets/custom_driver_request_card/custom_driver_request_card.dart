import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class CustomDriverRequestCard extends StatelessWidget {
  final String pickupLocation;
  final String destinationLocation;
  final String driverName;
  final String driverPhoneNumber;
  final String driverImageUrl;
  final String amount;
  final String distance;
  final String fee;
  final VoidCallback onChatTap;
  final VoidCallback onAccept;
  final bool? isAcceptButton;

  const CustomDriverRequestCard({
    super.key,
    required this.pickupLocation,
    required this.destinationLocation,
    required this.driverName,
    required this.driverPhoneNumber,
    required this.driverImageUrl,
    required this.amount,
    required this.distance,
    required this.fee,
    required this.onChatTap,
    required this.onAccept,
    required this.isAcceptButton,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.w),
      padding: EdgeInsets.all(10.w),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ///==========================Pickup=================
          _buildLocationRow(Icons.arrow_upward, 'Pickup', pickupLocation),
          SizedBox(height: 10.h),
          ///======================Destination==============
          _buildLocationRow(
              Icons.arrow_downward, 'Destination',
              destinationLocation),
          Divider(thickness: 1.h, color: Colors.grey.shade300),
          ///======================Info==================
          _buildDriverInfoRow(),
          Divider(thickness: 1.h, color: Colors.grey.shade300),
          ///======================Amount============
          _buildRideDetailsRow(),
          SizedBox(height: 25.h),

          ///=================Accept button===================
          if (isAcceptButton==true)
            CustomButton(
              onTap: onAccept,
              fillColor: AppColors.appBarBackground,
              title: AppStrings.accept,
            ),
          SizedBox(
            height: 15.h,
          ),
        ],
      ),
    );
  }

  ///=========================Custom location====================
  Widget _buildLocationRow(IconData icon, String title, String location) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Align(
              child: Container(
                margin: const EdgeInsets.all(4),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.blueNormal,
                ),
                height: 10.h,
                width: 10.w,
              ),
            ),
            SizedBox(height: 10.h),
          ],
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ///==========================title====================
              CustomText(
                text: title,
                fontWeight: FontWeight.w400,
                fontSize: 12.sp,
                bottom: 8,
                color: AppColors.grayNormal,
              ),
              ///=========================Location===================
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(icon, color: Colors.blue),
                  SizedBox(width: 5.w),
                  Expanded(
                    child: CustomText(
                      textAlign: TextAlign.start,
                      text: location,
                      fontWeight: FontWeight.w400,
                      fontSize: 16.sp,
                      bottom: 8,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///=========================Info==================
  Widget _buildDriverInfoRow() {
    return Row(
      children: [
        ///========================Driver image===============
        CustomNetworkImage(
          boxShape: BoxShape.circle,
          imageUrl: driverImageUrl,
          height: 56.h,
          width: 56.h,
        ),
        SizedBox(width: 10.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ///====================Driver name====================
            CustomText(
              text: driverName,
              fontWeight: FontWeight.w400,
              fontSize: 16.sp,
              bottom: 8,
              color: Colors.black,
            ),
            ///====================Driver phone number===============
            CustomText(
              text: driverPhoneNumber,
              fontWeight: FontWeight.w400,
              fontSize: 13.sp,
              color: Colors.black,
            ),
          ],
        ),
        const Spacer(),
        GestureDetector(
          onTap: onChatTap,
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            decoration: BoxDecoration(
              color: AppColors.appBarBackground,
              borderRadius: BorderRadius.circular(15.r),
            ),
            child: Row(
              children: [
                const CustomImage(
                  imageSrc: AppIcons.userMessageUnSelected,
                  imageType: ImageType.svg,
                  imageColor: Colors.white,
                ),
                SizedBox(width: 5.w),
                Text(
                  'Chat',
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  ///===========================Amount===============
  Widget _buildRideDetailsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildRideDetailColumn('Amount', amount),
        _buildRideDetailColumn('Distance', distance),
        _buildRideDetailColumn('Fee', fee),
      ],
    );
  }

  ///=========================Custom Amount===========
  Widget _buildRideDetailColumn(String title, String value) {
    return Column(
      children: [
        CustomText(
          text: title,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          bottom: 8,
          color: Colors.black,
        ),
        CustomText(
          text: value,
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color: Colors.black,
        ),
      ],
    );
  }
}
