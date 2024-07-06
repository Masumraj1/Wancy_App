import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class CustomDriverHistory extends StatelessWidget {
  final String pickupLocation;
  final String destinationLocation;
  final String driverName;
  final String date;
  final String driverImageUrl;
  final String amount;
  final String distance;
  final String fee;

  const CustomDriverHistory({
    super.key,
    required this.pickupLocation,
    required this.destinationLocation,
    required this.driverName,
    required this.driverImageUrl,
    required this.amount,
    required this.distance,
    required this.fee, required this.date,
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
          ///======================Info==================
          _buildDriverInfoRow(),
          SizedBox(height: 25.h),
          ///==========================Pickup=================
          _buildLocationRow(Icons.arrow_upward,pickupLocation),
          SizedBox(height: 10.h),
          ///======================Destination==============
          _buildLocationRow(
              Icons.arrow_downward, destinationLocation,),
          SizedBox(height: 25.h),
          ///======================Amount============
          _buildRideDetailsRow(),
          SizedBox(height: 25.h),


        ],
      ),
    );
  }

  ///=========================Custom location====================
  Widget _buildLocationRow(IconData icon, String location) {
    return Row(
      children: [
        Icon(icon, color: Colors.blue),
        SizedBox(width: 10.w),
        CustomText(text: location,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          bottom: 8,
          color: Colors.black,),
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
            imageUrl: driverImageUrl, height: 56.h, width: 56.h),
        SizedBox(width: 10.w),
       Expanded(
         child: Row(
           children: [
             ///====================Driver name====================
             CustomText(text: driverName,
               fontWeight: FontWeight.w400,
               fontSize: 16.sp,
               bottom: 8,
               color: Colors.black,),
             const Spacer(),
             ///====================Date====================
             CustomText(text: date,
               fontWeight: FontWeight.w400,
               fontSize: 16.sp,
               bottom: 8,
               color:AppColors.blueNormal,),
           ],
         ),
       )

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
        CustomText(text: title,
          fontWeight: FontWeight.w400,
          fontSize: 16.sp,
          bottom: 8,
          color: Colors.black,),
        CustomText(text: value,
          fontWeight: FontWeight.w400,
          fontSize: 13.sp,
          color: Colors.black,),

      ],
    );
  }
}
