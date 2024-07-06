import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';

class OverviewScreen extends StatelessWidget {
  const OverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: AppColors.white,
        ),
        backgroundColor: AppColors.appBarBackground,
        title: CustomText(
          text: AppStrings.overview,
          color: AppColors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Divider(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: _buildLocationWidget(
                pickup: 'Fairview, House 17, Block A, Banasree Dhaka',
                destination: '3 / 621 Juvenal Ridge, Port Vestachester',
              ),
            ),
            const Divider(),
            SizedBox(
              height: 24.h,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: 'Products Details :',
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w500,
                    color: AppColors.black,
                    bottom: 8,
                  ),
                  CustomText(
                    text: 'Catering/ Restaurant/ Event Management ',
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black,
                    bottom: 20,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomText(
                        text: 'note :',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w500,
                        color: AppColors.black,
                      ),
                      Expanded(
                        child: CustomText(
                          maxLines: 4,
                          text:
                              'If you cancel the trip after the start of the trip, 30% amount will be deducted from your account.',
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: AppColors.black,
                        ),
                      ),

                    ],
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  CustomButton(
                    onTap: () {},
                    title: 'Confirm',
                    fillColor: AppColors.appBarBackground,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildLocationWidget({
    required String pickup,
    required String destination,
  }) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(Icons.arrow_upward, color: Colors.blue),
            SizedBox(width: 24.w),
            Expanded(
              child: CustomText(
                textAlign: TextAlign.start,
                text: pickup,
                maxLines: 3,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            const Icon(Icons.arrow_downward, color: Colors.blue),
            SizedBox(width: 24.w),
            Expanded(
              child: CustomText(
                textAlign: TextAlign.start,
                text: destination,
                maxLines: 3,
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
                color: AppColors.black,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
