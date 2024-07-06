import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:track_booking/core/app_routes/app_routes.dart';
import 'package:track_booking/utils/app_colors/app_colors.dart';
import 'package:track_booking/utils/app_const/app_const.dart';
import 'package:track_booking/utils/app_images/app_images.dart';
import 'package:track_booking/utils/app_strings/app_strings.dart';
import 'package:track_booking/view/screen/driver_screen/driver_home_screen/driver_home_controller/driver_home_controller.dart';
import 'package:track_booking/view/screen/driver_screen/driver_home_screen/inner_widgets/driver_app_bar.dart';
import 'package:track_booking/view/screen/driver_screen/driver_home_screen/inner_widgets/driver_side_drawer.dart';
import 'package:track_booking/view/widgets/custom_button/custom_button.dart';
import 'package:track_booking/view/widgets/custom_driver_history/custom_driver_history.dart';
import 'package:track_booking/view/widgets/custom_driver_request_card/custom_driver_request_card.dart';
import 'package:track_booking/view/widgets/custom_image/custom_image.dart';
import 'package:track_booking/view/widgets/custom_text/custom_text.dart';
import 'package:track_booking/view/widgets/driver_nav_bar/driver_nav_bar.dart';

class DriverHomeScreen extends StatelessWidget {
  DriverHomeScreen({super.key});

  final DriverHomeController driverHomeController =
      Get.find<DriverHomeController>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,

      // Side Drawer
      drawer: DriverSideDrawer(),
      bottomNavigationBar: const DriverNavBar(currentIndex: 0),
      body: SingleChildScrollView(
        child: Obx(
          () {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Home AppBar and banner
                DriverAppBar(scaffoldKey: scaffoldKey),
                SizedBox(height: 10.w),

                Container(
                  decoration: const BoxDecoration(
                      border: Border(
                          bottom: BorderSide(
                              width: 2, color: AppColors.darkLight))),
                  padding: const EdgeInsets.symmetric(horizontal: 22),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                        driverHomeController.userList.length,
                        (index) => GestureDetector(
                              onTap: () {
                                driverHomeController.selectedIndex.value =
                                    index;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border(
                                  bottom: driverHomeController
                                              .selectedIndex.value ==
                                          index
                                      ? const BorderSide(
                                          color: AppColors.appBarBackground,
                                          // Set your desired color
                                          width: 2.0, // Set your desired width
                                        )
                                      : const BorderSide(
                                          color: Colors.transparent,
                                          // Set your desired color
                                          width: 2.0, // Set your desired width
                                        ),
                                )),
                                child: CustomText(
                                  textAlign: TextAlign.start,
                                  text: driverHomeController.userList[index],
                                  color: driverHomeController
                                              .selectedIndex.value ==
                                          index
                                      ? AppColors.appBarBackground
                                      : AppColors.black,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w500,
                                  /*   decoration: driverHomeController
                                              .selectedIndex.value ==
                                          index
                                      ? TextDecoration.underline
                                      : TextDecoration.none,*/
                                ),
                              ),
                            )),
                  ),
                ),
                SizedBox(height: 40.h),

                ///=======================New Request screen===============
                driverHomeController.selectedIndex.value == 0
                    ? Column(
                        children: List.generate(2, (index) {
                          return CustomDriverRequestCard(
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
                              showDialogBox(context);
                            }, isAcceptButton: true,
                          );
                        }),
                      )
                    : Column(
                        children: [
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                _buildToggleOption(
                                    "All",
                                    driverHomeController.isAllSelected.value,
                                    true),
                                _buildToggleOption(
                                    "Current",
                                    !driverHomeController.isAllSelected.value,
                                    false),
                              ],
                            ),
                          ),
                          Column(
                            children: List.generate(1, (index) {
                              return CustomDriverHistory(
                                pickupLocation:
                                    'Fairview, House 17, Block A, Bana...',
                                destinationLocation:
                                    '3 / 621 Juvenal Ridge, Port Vest...',
                                driverName: 'masum',
                                driverImageUrl: AppConstants.userNtr,
                                amount: '10',
                                distance: '3.6 km',
                                fee: '100',
                                date: 'Date: 05/12/2024',
                              );
                            }),
                          )
                        ],
                      )

                ///================When screen null ....show this data =========
                // driverHomeController.selectedIndex.value == 0
                //     ? Center(
                //   child: Column(
                //     children: [
                //       Lottie.asset('assets/animation/updateLoder.json'),
                //       CustomText(
                //         color: Colors.black,
                //         fontWeight: FontWeight.w400,
                //         fontSize: 16.sp,
                //         maxLines: 4,
                //         text: 'There are no trips for you right now. You will definitely get notifications when new trips are made.',
                //       ),
                //     ],
                //   ),
                // )
                //     : Center(
                //   child: CustomText(
                //     fontSize: 16.sp,
                //     fontWeight: FontWeight.w400,
                //     color: Colors.black,
                //     text: 'No history available now.',
                //   ),
                // ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildToggleOption(String text, bool isSelected, bool isFirst) {
    return GestureDetector(
      onTap: () {
        driverHomeController.toggleSelection();
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 12.h, horizontal: 20.w),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.appBarBackground : AppColors.darkLight,
          borderRadius: isFirst
              ? BorderRadius.only(
                  topLeft: Radius.circular(20.r),
                  bottomLeft: Radius.circular(20.r))
              : BorderRadius.only(
                  topRight: Radius.circular(20.r),
                  bottomRight: Radius.circular(20.r)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.black,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  void showDialogBox(BuildContext context) {
    Get.dialog(
      AlertDialog(
        backgroundColor: AppColors.white,
        content: SizedBox(
          height: 320.h,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    const CustomImage(
                      imageSrc: AppImages.truck,
                      imageType: ImageType.png,
                    ),
                    CustomText(
                      text: AppStrings.rideRequestAccepted,
                      fontWeight: FontWeight.w500,
                      fontSize: 16.sp,
                      color: AppColors.appBarBackground,
                    ),
                    CustomText(
                      text: AppStrings.yourRideHasBeenAccepted,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: AppColors.black,
                      maxLines: 5,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
              ),
              ///======================Start Trip===========
              CustomButton(
                onTap: () {
                 Get.toNamed(AppRoutes.mapScreen);
                },
                title: AppStrings.startTrip,
                textColor: AppColors.whiteNormal,
                fillColor: AppColors.appBarBackground,
              )
            ],
          ),
        ),
      ),
    );
  }
}
