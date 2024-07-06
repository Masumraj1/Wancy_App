import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/utils/app_icons/app_icons.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/driver_screen/driver_home_screen/driver_home_controller/driver_home_controller.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_netwrok_image/custom_network_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/user_nav_bar/user_nav_bar.dart';

class TripScreen extends StatelessWidget {
  TripScreen({super.key});

  final DriverHomeController driverHomeController =
      Get.find<DriverHomeController>();
  final List<String> userList = [
    AppStrings.tripHistory,
    AppStrings.currentTrip,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      ///==================Trip appbar===================
      appBar: AppBar(
        backgroundColor: AppColors.appBarBackground,
        title: CustomText(
          text: AppStrings.trip,
          fontWeight: FontWeight.w500,
          fontSize: 20.sp,
          color: Colors.white,
        ),
        centerTitle: true,
      ),

      bottomNavigationBar: const UserNavBar(currentIndex: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.w),
          child: Obx(() {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ///=====================Tap ==================
                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2, color: AppColors.darkLight))),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        userList.length,
                        (index) => GestureDetector(
                          onTap: () {
                            driverHomeController.selectedIndex.value = index;
                          },
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border(
                                  bottom: driverHomeController
                                      .selectedIndex.value ==
                                      index
                                      ? const BorderSide(
                                    color: AppColors.appBarBackground, // Set your desired color
                                    width: 2.0, // Set your desired width
                                  )
                                      : const BorderSide(
                                    color: Colors.transparent, // Set your desired color
                                    width: 2.0, // Set your desired width
                                  ),
                                )),
                            child: CustomText(
                              textAlign: TextAlign.start,
                              text: userList[index],
                              color:
                              driverHomeController.selectedIndex.value == index
                                  ? AppColors.appBarBackground
                                  : AppColors.black,
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          )
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                driverHomeController.selectedIndex.value == 0
                    ? Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            children: [
                              ///==================Status============
                              _buildStatusWidget(
                                status: 'cancel',
                                details: '12 fit 2 ton (Open)',
                                dateTime: 'June 23, 2024, 01:30pm',
                                amount: 1290,
                              ),
                              SizedBox(
                                height: 10.h,
                              ),

                              ///========================Location=========
                              _buildLocationWidget(
                                pickup:
                                    'Fairview, House 17, Block A, Banasree Dhaka',
                                destination:
                                    '3 / 621 Juvenal Ridge, Port Vestachester',
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              const Divider(),
                              Row(
                                children: [
                                  CustomNetworkImage(
                                      boxShape: BoxShape.circle,
                                      imageUrl: AppConstants.userNtr,
                                      height: 56.h,
                                      width: 56.w),
                                  const CustomText(
                                    left: 10,
                                    text: 'Hasan ',
                                    color: Colors.black,
                                  )
                                ],
                              )
                            ],
                          ),
                        ),
                      )
                    : Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.r),
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(16.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              ///==================Status============
                              _buildStatusWidget(
                                status: 'Active',
                                details: '12 fit 2 ton (Open)',
                                dateTime: 'June 23, 2024, 01:30pm',
                                amount: 1290,
                              ),
                              SizedBox(height: 10.h),

                              ///========================Location=========
                              _buildLocationWidget(
                                pickup:
                                    'Fairview, House 17, Block A, Banasree Dhaka',
                                destination:
                                    '3 / 621 Juvenal Ridge, Port Vestachester',
                              ),
                              SizedBox(height: 10.h),
                              const Divider(),
                              SizedBox(height: 10.h),

                              ///=====================Info===============
                              _buildUserInfoWidget(
                                userName: 'Omar Almu...',
                                userImage: AppConstants.userNtr,
                                onChatTap: () {
                                  Get.toNamed(AppRoutes.messageScreen);
                                },
                                onTrackNowTap: () {
                                  // Handle track now tap
                                },
                              ),
                              SizedBox(height: 10.h),
                              const Divider(),
                              SizedBox(height: 10.h),

                              ///======================Note=============
                              _buildNoteAndActionWidget(
                                note:
                                    'A truck is included in this trip. Talk to our customer care if you want to cancel.',
                                onCancelTap: () {
                                  // Handle cancel tap
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget _buildStatusWidget({
    required String status,
    required String details,
    required String dateTime,
    required double amount,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              status,
              style: TextStyle(
                  color: driverHomeController.selectedIndex.value == 0
                      ? Colors.red
                      : Colors.blue,
                  fontSize: 16.sp),
            ),
            SizedBox(height: 5.h),
            Text(
              details,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
            SizedBox(height: 5.h),
            Text(
              dateTime,
              style: TextStyle(fontSize: 12.sp, color: Colors.grey),
            ),
          ],
        ),
        Text(
          '\$$amount',
          style: TextStyle(fontSize: 16.sp, fontWeight: FontWeight.bold),
        ),
      ],
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
            SizedBox(width: 5.w),
            Expanded(
              child: Text(
                pickup,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Row(
          children: [
            const Icon(Icons.arrow_downward, color: Colors.blue),
            SizedBox(width: 5.w),
            Expanded(
              child: Text(
                destination,
                style: TextStyle(fontSize: 14.sp),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildUserInfoWidget({
    required String userName,
    required String userImage,
    required VoidCallback onChatTap,
    required VoidCallback onTrackNowTap,
  }) {
    return Row(
      children: [
        CircleAvatar(
          backgroundImage: NetworkImage(userImage),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Text(
            userName,
            style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
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
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Chat',
                  style: TextStyle(color: Colors.white, fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ),
        SizedBox(width: 10.w),
        GestureDetector(
          onTap: onTrackNowTap,
          child: Text(
            'Track Now',
            style: TextStyle(color: Colors.blue, fontSize: 12.sp),
          ),
        ),
      ],
    );
  }

  Widget _buildNoteAndActionWidget({
    required String note,
    required VoidCallback onCancelTap,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Note: $note',
          style: TextStyle(fontSize: 12.sp, color: Colors.grey),
        ),
        SizedBox(height: 10.h),
        GestureDetector(
          onTap: onCancelTap,
          child: Row(
            children: [
              const SizedBox(),
              const Spacer(),
              Container(
                padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
                decoration: BoxDecoration(
                  color: AppColors.appBarBackground,
                  borderRadius: BorderRadius.circular(15.r),
                ),
                child: Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white, fontSize: 14.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
