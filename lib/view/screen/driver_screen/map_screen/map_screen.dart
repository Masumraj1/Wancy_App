import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_driver_request_card/custom_driver_request_card.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///====================map appbar=================
      appBar: AppBar(
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.white,
        ),
        backgroundColor: AppColors.appBarBackground,
        title: CustomText(
          text: 'Map',
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///==============This is Map============
            CustomNetworkImage(
                imageUrl: AppConstants.map, height: 350.h,
                width: double.infinity),
          CustomDriverRequestCard(
            pickupLocation:
            'Fairview, House 17, Block A, Banasree Dhaka',
            destinationLocation:
            '3 / 621 Juvenal Ridge, Port Vestachester',
            driverName: 'Md Shahadat',
            driverPhoneNumber: '188-65265-865',
            driverImageUrl: AppConstants.userNtr,
            // Replace with a valid image URL
            amount: '\$1080',
            distance: '2.5 KM',
            fee: '\$30',
            onChatTap: () {
              Get.toNamed(AppRoutes.messageScreen);
            },
            onAccept: () {
            }, isAcceptButton: false,
          ),
            ///======================Start Trip===========
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomButton(
                onTap: () {
                },
                title: 'End Trip',
                textColor: AppColors.whiteNormal,
                fillColor: AppColors.appBarBackground,
              ),
            ),
            SizedBox(
              height: 15.h,
            )
          ],
        ),
      ),
    );
  }
}
